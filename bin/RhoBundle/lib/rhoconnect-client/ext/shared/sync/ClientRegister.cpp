/*------------------------------------------------------------------------
* (The MIT License)
* 
* Copyright (c) 2008-2011 Rhomobile, Inc.
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
* 
* http://rhomobile.com

* Copyright (c) 2011-2016 Symbol Technologies, Inc.
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
* 
* http://symbol.com
*------------------------------------------------------------------------*/

#include "ClientRegister.h"
#include "SyncThread.h"
#include "sync/ILoginListener.h"
#include "common/RhoConf.h"
#include "common/RhodesApp.h"
#include "System.h"
#include "Push.h"

rho::String rho_sysimpl_get_phone_id();

namespace rho{
namespace sync{

using namespace rho::common;
using namespace rho::db;

static const int THREAD_WAIT_TIMEOUT = 10;


IMPLEMENT_LOGCLASS(CClientRegister,"ClientRegister");

CClientRegister* CClientRegister::m_pInstance = 0;
bool CClientRegister::s_sslVerifyPeer = true;
VectorPtr<ILoginListener*> CClientRegister::s_loginListeners;
	
/*static*/ CClientRegister* CClientRegister::Get()
{
    if (!m_pInstance)
    {
        m_pInstance = new CClientRegister();
    }
    return m_pInstance;
}

/*static*/ CClientRegister* CClientRegister::Create()
{
    LOG(TRACE) + "Starting ClientRegister";
    Get()->startUp();
    return m_pInstance;
}

/*static*/ CClientRegister* CClientRegister::Create(const String& devicePin)
{
    Get()->setDevicehPin(devicePin);
    return m_pInstance;
}

/*static*/ void CClientRegister::Stop()
{
    if(m_pInstance)
    {
        m_pInstance->doStop();
    }
}

/*static*/ void CClientRegister::Destroy()
{
    if ( m_pInstance )
        delete m_pInstance;

    m_pInstance = 0;
}

/*static*/ void CClientRegister::SetSslVerifyPeer(boolean b)
{
    s_sslVerifyPeer = b;
    if (m_pInstance)
        m_pInstance->m_NetRequest.setSslVerifyPeer(b);
}

bool CClientRegister::GetSslVerifyPeer()
{
    return s_sslVerifyPeer;
}

/*static*/void CClientRegister::AddLoginListener(ILoginListener* listener)
{
    s_loginListeners.addElement(listener);
}

CClientRegister::CClientRegister() : m_nPollInterval(POLL_INTERVAL_SECONDS), m_state(stRegister)
{
    m_NetRequest.setSslVerifyPeer(s_sslVerifyPeer);
}

CClientRegister::~CClientRegister()
{
    doStop();
    m_pInstance = 0;
}
void CClientRegister::setRhoconnectCredentials(const String& user, const String& pass, const String& session)
{
    LOG(INFO) + "New Sync credentials - user: " + user + ", sess: " + session;
    
    setState(stRegister);

    notifyLoggedIn(user,pass,session);
    
    startUp();
}

void CClientRegister::dropRhoconnectCredentials(const String& session,const String& clientID)
{
    LOG(INFO) + "Dropping credentials - sess: " + session;
    
    setState(stUnregister);
    
    m_unregisterSession = session;
    m_unregisterClientID = clientID;

    notifyLoggedOut(session);
    
    startUp();
}
    
void CClientRegister::notifyLoggedIn(const String& user, const String& pass, const String& session)
{
    for(VectorPtr<ILoginListener*>::iterator I = s_loginListeners.begin(); I != s_loginListeners.end(); ++I)
    {
        (*I)->onLogin(user, pass, session);
    }
}

void CClientRegister::notifyLoggedOut(const String& session)
{
    for(VectorPtr<ILoginListener*>::iterator I = s_loginListeners.begin(); I != s_loginListeners.end(); ++I)
    {
        (*I)->onLogout(session);
    }
}

void CClientRegister::setDevicehPin(const String& pin)
{
    m_strDevicePin = pin;

    if (pin.length() > 0)
    {
        startUp();
    } else
    {
        doStop();
    }
}

void CClientRegister::startUp()
{
    if ( RHOCONF().getString("syncserver").length() > 0 )
    {
        LOG(INFO) + "Starting ClientRegister...";

        start(epLow);
        stopWait();
    }
}

void CClientRegister::run()
{
    unsigned i = 0;
    LOG(INFO)+"ClientRegister is started";
	while(!isStopping()) 
	{
        i++;
        LOG(INFO)+"Try to (un)register: " + i;
        if ( CSyncThread::getInstance() != 0 )
		{
            EnState state = getState();
			if ( (stRegister==state) && doRegister(CSyncThread::getSyncEngine()) )
			{
			    LOG(INFO)+"Registered: " + i;
				break;
			} else if  ( (stUnregister==state) && doUnregister(CSyncThread::getSyncEngine()) ) {
                LOG(INFO)+"Unregistered: " + i;
				break;
            }
		} else
		    LOG(INFO)+"SyncThread is not ready";
		
		LOG(INFO)+"Waiting for "+ m_nPollInterval+ " sec to try again to register client";
		wait(m_nPollInterval*1000);
	}
    LOG(INFO)+"ClientRegister thread shutdown";
}

String CClientRegister::getRegisterBody(const String& strClientID)
{
#ifndef OS_SAILFISH
    String strPushType = rho::push::CPushManager::getInstance()->getDefaultID();
#else
    String strPushType = "";
#endif
    if(strPushType == "rhoconnect")
    {
        strPushType = "rhoconnect_push";
    }

    int port = RHOCONF().getInt("push_port");

    String appId = RHOCONF().getString("rho_app_id");
    String appVer = RHOCONF().getString("app_version");

	String body = CSyncThread::getSyncEngine().getProtocol().getClientRegisterBody( strClientID, m_strDevicePin,
		port > 0 ? port : DEFAULT_PUSH_PORT, rho_rhodesapp_getplatform(), rho::System::getPhoneId(),
		                strPushType, appId, appVer);

	LOG(INFO)+"getRegisterBody() BODY is: " + body;
	return body;
}
    
String CClientRegister::getUnregisterBody(const String& strClientID)
{    
	String body = CSyncThread::getSyncEngine().getProtocol().getClientRegisterBody( strClientID, "", 0, "", "", "", "", "" );
	LOG(INFO)+"getUnregisterBody() BODY is: " + body;
	return body;
}

boolean CClientRegister::doRegister(CSyncEngine& oSync)
{
    String session = oSync.loadSession();
    if ( session.length() == 0 )
    {
        m_nPollInterval = POLL_INTERVAL_INFINITE;
        LOG(INFO)+"Session is empty, do register later";
        return false;
    }
    
    if ( m_strDevicePin.length() == 0 )
    {
        notifyLoggedIn("","",session);
        m_nPollInterval = POLL_INTERVAL_INFINITE;
        LOG(INFO)+"Device PUSH pin is empty, do register later";
        return false;
    }
    m_nPollInterval = POLL_INTERVAL_SECONDS;

	String client_id = oSync.loadClientID();
	if ( client_id.length() == 0 )
	{
        LOG(WARNING)+"Sync client_id is empty, do register later";
		return false;
	}
    {
        // IDBResult hold mutex of DB - we should free it ASAP
        IDBResult res = CDBAdapter::getUserDB().executeSQL("SELECT token,token_sent from client_info");
        if ( !res.isEnd() ) {
            String token = res.getStringByIdx(0);
            int token_sent = res.getIntByIdx(1) && !RHOCONF().getBool("register_push_at_startup");
            
            if ( m_strDevicePin.compare(token) == 0 && token_sent > 0 )
            {
                //token in db same as new one and it was already send to the server
                //so we do nothing
                
                return true; 
            }
        }
    }
    
	String strBody = getRegisterBody(client_id);
    NetResponse resp = getNet().pushData( oSync.getProtocol().getClientRegisterUrl(client_id), strBody, &oSync );
	if( resp.isOK() )
    {
        CDBAdapter::getUserDB().executeSQL("UPDATE client_info SET token_sent=?, token=?", 1, m_strDevicePin );
		LOG(INFO)+"Registered client sucessfully...";
        
        return true;

    }

	LOG(WARNING)+"Network error: "+ resp.getRespCode();
	return false;
}
    
boolean CClientRegister::doUnregister(CSyncEngine& oSync)
{
    String session = m_unregisterSession;
    if ( session.length() == 0 )
    {
        m_unregisterSession = "";
        m_unregisterClientID = "";

        LOG(INFO)+"Session is empty, don't need to unregister";
        return true;
    }    

    m_nPollInterval = POLL_INTERVAL_SECONDS;

	String client_id = m_unregisterClientID;
	if ( client_id.length() == 0 )
	{
        m_unregisterSession = "";
        m_unregisterClientID = "";

        LOG(WARNING)+"Sync client_id is empty, don't need to unregister";
		return true;
	}
        
    String strBody = getUnregisterBody(client_id);    
    LOG(INFO)+"Unregistered client with body = " + strBody;
    
    class UnregisterSession : public net::IRhoSession {
        String m_session;
        String m_contentType;
    public:
        UnregisterSession(const String& session, const String& contentType) : m_session(session), m_contentType(contentType) {}
      	virtual void logout() {}
        virtual const String& getSession() {
            return m_session;
        }
        virtual const String& getContentType() {
            return m_contentType;
        }
    };
    
    UnregisterSession unregSession(session, oSync.getProtocol().getContentType() );
    
    NetResponse resp = getNet().pushData( oSync.getProtocol().getClientRegisterUrl(client_id), strBody, &unregSession );
	if( resp.isOK() )
    {
        m_unregisterSession = "";
        m_unregisterClientID = "";

        CDBAdapter::getUserDB().executeSQL("UPDATE client_info SET token_sent=?", 0 );
		LOG(INFO)+"Unregistered client sucessfully...";
        
        return true;
        
    }
    
	LOG(WARNING)+"Network error: "+ resp.getRespCode();
	return false;
}
    
void CClientRegister::setState( EnState st ) {
    synchronized(m_mxStateAccess)
    {
        m_state = st;
    }
}
    
CClientRegister::EnState CClientRegister::getState() {
    EnState state = stRegister;
    synchronized(m_mxStateAccess)
    {
        state = m_state;
    }

    return state;
}

void CClientRegister::doStop()
{
    LOG(INFO) + "Stopping ClientRegister...";

    m_NetRequest.cancel();
    stop(WAIT_BEFOREKILL_SECONDS);
}

}
}
