#pragma once

#include "IRhoConnectClient.h"
#include "logging/RhoLog.h"
#include "common/StringConverter.h"
#include "common/ExtManager.h"


namespace rho {

using namespace rho::apiGenerator;
using namespace rho;

// hash keys used in properties and parameters 
namespace rhoconnectclient {

    static const char HK_FROM[] = "from"; 

    static const char HK_MAX_RESULTS[] = "maxResults"; 

    static const char HK_OFFSET[] = "offset"; 

    static const char HK_PROGRESS_STEP[] = "progressStep"; 

    static const char HK_SEARCH_PARAMS[] = "searchParams"; 

    static const char HK_SOURCE_NAMES[] = "sourceNames"; 

    static const char HK_SYNC_CHANGES[] = "syncChanges"; 

    static const char PROPERTY_BULKSYNC_STATE[] = "bulksyncState"; 

    static const char PROPERTY_PAGE_SIZE[] = "pageSize"; 

    static const char PROPERTY_POLL_INTERVAL[] = "pollInterval"; 

    static const char PROPERTY_SHOW_STATUS_POPUP[] = "showStatusPopup"; 

    static const char PROPERTY_SSL_VERIFY_PEER[] = "sslVerifyPeer"; 

    static const char PROPERTY_SYNC_SERVER[] = "syncServer"; 

    static const char PROPERTY_THREADED_MODE[] = "threadedMode"; 

    static const char PROPERTY_USER_NAME[] = "userName"; 
 
} 

class CRhoConnectClientFactoryBase : public CModuleFactoryBase<IRhoConnectClient, IRhoConnectClientSingleton, IRhoConnectClientFactory>
{
protected:
    static rho::common::CAutoPtr<CRhoConnectClientFactoryBase> m_pInstance;
    HashtablePtr<rho::String,IRhoConnectClient*> m_hashModules;

public:

    static void setInstance(CRhoConnectClientFactoryBase* pInstance){ m_pInstance = pInstance; }
    static CRhoConnectClientFactoryBase* getInstance(){ return m_pInstance; }

    static IRhoConnectClientSingleton* getRhoConnectClientSingletonS(){ return getInstance()->getModuleSingleton(); }

    virtual IRhoConnectClient* getModuleByID(const rho::String& strID)
    {
        if ( !m_hashModules.containsKey(strID) )
        {
            IRhoConnectClient* pObj = createModuleByID(strID);
            m_hashModules.put(strID, pObj );

            return pObj;
        }

        return m_hashModules[strID];
    }

    virtual IRhoConnectClient* createModuleByID(const rho::String& strID){ return (IRhoConnectClient*)0; };
    virtual void deleteModuleByID(const rho::String& strID)
    {
        m_hashModules.remove(strID);
    }

};

class CRhoConnectClientSingletonBase : public CModuleSingletonBase< IRhoConnectClientSingleton >, public rho::common::IRhoExtension
{
protected:
    DEFINE_LOGCLASS;





public:
    virtual rho::LogCategory getModuleLogCategory(){ return getLogCategory(); }

    CRhoConnectClientSingletonBase();
    ~CRhoConnectClientSingletonBase();






};

class CRhoConnectClientBase: public IRhoConnectClient
{
protected:
    DEFINE_LOGCLASS;


public:



 

};

extern "C" void Init_RhoConnectClient_API();


}
