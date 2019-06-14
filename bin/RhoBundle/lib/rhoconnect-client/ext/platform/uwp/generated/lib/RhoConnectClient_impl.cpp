#include "RhoConnectClient_impl.h"
#include "RhoConnectClientFactory.h"
#include "api_generator/uwp/MethodResultImpl.h"

using namespace rho::apiGenerator;
using namespace rhoruntime;

namespace rho {



class CRhoConnectClientSingleton: public CRhoConnectClientSingletonBase
{
private:
    IRhoConnectClientSingletonImpl^ _runtime;
public:
    CRhoConnectClientSingleton(IRhoConnectClientSingletonImpl^ runtime): CRhoConnectClientSingletonBase(), _runtime(runtime) {}
    ~CRhoConnectClientSingleton(){}

    virtual void getUserName(CMethodResult& oResult)
    {
        try {
            _runtime->getUserName(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getPollInterval(CMethodResult& oResult)
    {
        try {
            _runtime->getPollInterval(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setPollInterval(int pollInterval, CMethodResult& oResult)
    {
        try {
            _runtime->setPollInterval(pollInterval, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getSyncServer(CMethodResult& oResult)
    {
        try {
            _runtime->getSyncServer(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setSyncServer(const rho::String& syncServer, CMethodResult& oResult)
    {
        Platform::String^ _syncServer = rho::common::convertStringToWP8(syncServer);
        try {
            _runtime->setSyncServer(_syncServer, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getBulksyncState(CMethodResult& oResult)
    {
        try {
            _runtime->getBulksyncState(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setBulksyncState(int bulksyncState, CMethodResult& oResult)
    {
        try {
            _runtime->setBulksyncState(bulksyncState, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getPageSize(CMethodResult& oResult)
    {
        try {
            _runtime->getPageSize(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setPageSize(int pageSize, CMethodResult& oResult)
    {
        try {
            _runtime->setPageSize(pageSize, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getThreadedMode(CMethodResult& oResult)
    {
        try {
            _runtime->getThreadedMode(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setThreadedMode(bool threadedMode, CMethodResult& oResult)
    {
        try {
            _runtime->setThreadedMode(threadedMode, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getShowStatusPopup(CMethodResult& oResult)
    {
        try {
            _runtime->getShowStatusPopup(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setShowStatusPopup(bool showStatusPopup, CMethodResult& oResult)
    {
        try {
            _runtime->setShowStatusPopup(showStatusPopup, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getSslVerifyPeer(CMethodResult& oResult)
    {
        try {
            _runtime->getSslVerifyPeer(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setSslVerifyPeer(bool sslVerifyPeer, CMethodResult& oResult)
    {
        try {
            _runtime->setSslVerifyPeer(sslVerifyPeer, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void isLoggedIn(CMethodResult& oResult)
    {
        try {
            _runtime->isLoggedIn(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void isSyncing(CMethodResult& oResult)
    {
        try {
            _runtime->isSyncing(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void search(const rho::Hashtable<rho::String, rho::String>& args, CMethodResult& oResult)
    {
        Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ _args = rho::common::convertHashToWP8(args);
        try {
            _runtime->search(_args, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void doSync(bool showStatusPopup, const rho::String& queryParams, bool syncOnlyChangedSources, CMethodResult& oResult)
    {
        Platform::String^ _queryParams = rho::common::convertStringToWP8(queryParams);
        try {
            _runtime->doSync(showStatusPopup, _queryParams, syncOnlyChangedSources, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void doSyncSource(const rho::String& sourceName, bool showStatusPopup, const rho::String& queryParams, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        Platform::String^ _queryParams = rho::common::convertStringToWP8(queryParams);
        try {
            _runtime->doSyncSource(_sourceName, showStatusPopup, _queryParams, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void login(const rho::String& login, const rho::String& password, CMethodResult& oResult)
    {
        Platform::String^ _login = rho::common::convertStringToWP8(login);
        Platform::String^ _password = rho::common::convertStringToWP8(password);
        try {
            _runtime->login(_login, _password, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void logout(CMethodResult& oResult)
    {
        try {
            _runtime->logout(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void stopSync(CMethodResult& oResult)
    {
        try {
            _runtime->stopSync(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setNotification(const rho::String& sourceName, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        try {
            _runtime->setNotification(_sourceName, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void clearNotification(const rho::String& sourceName, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        try {
            _runtime->clearNotification(_sourceName, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setObjectNotification(CMethodResult& oResult)
    {
        try {
            _runtime->setObjectNotification(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void addObjectNotify(const rho::String& sourceName, const rho::String& object, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        Platform::String^ _object = rho::common::convertStringToWP8(object);
        try {
            _runtime->addObjectNotify(_sourceName, _object, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void cleanObjectNotify(CMethodResult& oResult)
    {
        try {
            _runtime->cleanObjectNotify(ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getLastSyncObjectCount(const rho::String& sourceName, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        try {
            _runtime->getLastSyncObjectCount(_sourceName, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void setSourceProperty(const rho::String& sourceName, const rho::String& propertyName, const rho::String& propertyValue, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        Platform::String^ _propertyName = rho::common::convertStringToWP8(propertyName);
        Platform::String^ _propertyValue = rho::common::convertStringToWP8(propertyValue);
        try {
            _runtime->setSourceProperty(_sourceName, _propertyName, _propertyValue, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    virtual void getSourceProperty(const rho::String& sourceName, const rho::String& propertyName, CMethodResult& oResult)
    {
        Platform::String^ _sourceName = rho::common::convertStringToWP8(sourceName);
        Platform::String^ _propertyName = rho::common::convertStringToWP8(propertyName);
        try {
            _runtime->getSourceProperty(_sourceName, _propertyName, ref new CMethodResultImpl((int64)&oResult));
        } catch (Platform::Exception^ e) {
            LOG(ERROR) + rho::common::convertStringAFromWP8(e->ToString());
        }
    }

    
    //virtual void addCommandToQueue(rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor){} // TODO: implement addCommandToQueue
    //virtual void callCommandInThread(rho::common::IRhoRunnable* pFunctor){} // TODO: implement callCommandInThread
};

IRhoConnectClientFactoryImpl^ CRhoConnectClientFactory::_impl;

IRhoConnectClient* CRhoConnectClientFactory::createModuleByID(const rho::String& strID)
{
    return new CRhoConnectClientImpl(strID, _impl->getImpl(rho::common::convertStringToWP8(strID)));
}

IRhoConnectClientSingleton* CRhoConnectClientFactory::createModuleSingleton()
{
    return new CRhoConnectClientSingleton(_impl->getSingletonImpl());
}

}

extern "C" void Init_RhoConnectClient_extension()
{
    rho::CRhoConnectClientFactory::setInstance( new rho::CRhoConnectClientFactory() );
    rho::Init_RhoConnectClient_API();

    RHODESAPP().getExtManager().requireRubyFile("RhoRhoConnectClientApi");
}
