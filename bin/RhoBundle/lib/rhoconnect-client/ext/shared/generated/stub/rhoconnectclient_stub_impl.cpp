//
//  RhoConnectClientImpl.cpp
#include "common/RhoStd.h"
#include "common/AutoPointer.h"
#include "common/RhodesApp.h"
#include "common/RhoConf.h"
#include "generated/cpp/RhoConnectClientBase.h"
#include "logging/RhoLog.h"

namespace rho {
    
    using namespace apiGenerator;
    using namespace common;
    
    class CRhoConnectClientSingletonImpl: public CRhoConnectClientSingletonBase
    {
    public:
        
        CRhoConnectClientSingletonImpl(): CRhoConnectClientSingletonBase(){}
        
        //methods
        // userName getter for "userName" property 
        virtual void getUserName(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getUserName","RhoConnectClient");
            
        } 
        // pollInterval getter for "pollInterval" property 
        virtual void getPollInterval(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getPollInterval","RhoConnectClient");
            
        } 
        // pollInterval= setter for "pollInterval" property 
        virtual void setPollInterval( int pollInterval, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setPollInterval","RhoConnectClient");
            
        } 
        // syncServer getter for "syncServer" property 
        virtual void getSyncServer(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getSyncServer","RhoConnectClient");
            
        } 
        // syncServer= setter for "syncServer" property 
        virtual void setSyncServer( const rho::String& syncServer, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setSyncServer","RhoConnectClient");
            
        } 
        // bulksyncState getter for "bulksyncState" property 
        virtual void getBulksyncState(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getBulksyncState","RhoConnectClient");
            
        } 
        // bulksyncState= setter for "bulksyncState" property 
        virtual void setBulksyncState( int bulksyncState, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setBulksyncState","RhoConnectClient");
            
        } 
        // pageSize getter for "pageSize" property 
        virtual void getPageSize(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getPageSize","RhoConnectClient");
            
        } 
        // pageSize= setter for "pageSize" property 
        virtual void setPageSize( int pageSize, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setPageSize","RhoConnectClient");
            
        } 
        // threadedMode getter for "threadedMode" property 
        virtual void getThreadedMode(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getThreadedMode","RhoConnectClient");
            
        } 
        // threadedMode= setter for "threadedMode" property 
        virtual void setThreadedMode( bool threadedMode, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setThreadedMode","RhoConnectClient");
            
        } 
        // showStatusPopup getter for "showStatusPopup" property 
        virtual void getShowStatusPopup(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getShowStatusPopup","RhoConnectClient");
            
        } 
        // showStatusPopup= setter for "showStatusPopup" property 
        virtual void setShowStatusPopup( bool showStatusPopup, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setShowStatusPopup","RhoConnectClient");
            
        } 
        // sslVerifyPeer getter for "sslVerifyPeer" property 
        virtual void getSslVerifyPeer(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getSslVerifyPeer","RhoConnectClient");
            
        } 
        // sslVerifyPeer= setter for "sslVerifyPeer" property 
        virtual void setSslVerifyPeer( bool sslVerifyPeer, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setSslVerifyPeer","RhoConnectClient");
            
        } 
        // isLoggedIn Returns true if the RhoConnectClient currently has a user session, false if not. 
        virtual void isLoggedIn(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("isLoggedIn","RhoConnectClient");
            
        } 
        // isSyncing Returns true if sync is currently in progress. 
        virtual void isSyncing(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("isSyncing","RhoConnectClient");
            
        } 
        // search If you have a large dataset in your backend service, you don't have to synchronize everything with the RhoConnectClient. Instead you can filter the synchronized dataset using the RhoConnectClient's search function. Provide callback, which will be executed after search is completed. 
        virtual void search( const rho::Hashtable<rho::String, rho::String>& args, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("search","RhoConnectClient");
            
        } 
        // doSync Start the RhoConnectClient sync process. 
        virtual void doSync( bool showStatusPopup,  const rho::String& queryParams,  bool syncOnlyChangedSources, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("doSync","RhoConnectClient");
            
        } 
        // doSyncSource Start RhoConnectClient sync process for a given source name. 
        virtual void doSyncSource( const rho::String& sourceName,  bool showStatusPopup,  const rho::String& queryParams, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("doSyncSource","RhoConnectClient");
            
        } 
        // login Authenticates the user with RhoConnect. The callback will be executed when it is finished. 
        virtual void login( const rho::String& login,  const rho::String& password, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("login","RhoConnectClient");
            
        } 
        // logout Logout the user from the RhoConnect server. This removes the local user session. 
        virtual void logout(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("logout","RhoConnectClient");
            
        } 
        // stopSync Stops any sync operations currently in progress. 
        virtual void stopSync(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("stopSync","RhoConnectClient");
            
        } 
        // setNotification The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model. 
        virtual void setNotification( const rho::String& sourceName, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setNotification","RhoConnectClient");
            
        } 
        // clearNotification Clears the sync notification for a given source. 
        virtual void clearNotification( const rho::String& sourceName, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("clearNotification","RhoConnectClient");
            
        } 
        // setObjectNotification The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action. 
        virtual void setObjectNotification(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setObjectNotification","RhoConnectClient");
            
        } 
        // addObjectNotify Add the object notification by passing in an object ID. 
        virtual void addObjectNotify( const rho::String& sourceName,  const rho::String& object, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("addObjectNotify","RhoConnectClient");
            
        } 
        // cleanObjectNotify Removes callback for object notifications. 
        virtual void cleanObjectNotify(rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("cleanObjectNotify","RhoConnectClient");
            
        } 
        // getLastSyncObjectCount Returns number of synced objects for a given source. 
        virtual void getLastSyncObjectCount( const rho::String& sourceName, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getLastSyncObjectCount","RhoConnectClient");
            
        } 
        // setSourceProperty Sets property value for a given source. 
        virtual void setSourceProperty( const rho::String& sourceName,  const rho::String& propertyName,  const rho::String& propertyValue, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("setSourceProperty","RhoConnectClient");
            
        } 
        // getSourceProperty Gets property value for a given source. 
        virtual void getSourceProperty( const rho::String& sourceName,  const rho::String& propertyName, rho::apiGenerator::CMethodResult& oResult) {
            // RAWLOGC_INFO("getSourceProperty","RhoConnectClient");
            
        } 

    };
    
    class CRhoConnectClientImpl : public CRhoConnectClientBase
    {
    public:
        virtual ~CRhoConnectClientImpl() {}

        //methods

    };
    
    ////////////////////////////////////////////////////////////////////////
    
    class CRhoConnectClientFactory: public CRhoConnectClientFactoryBase    {
    public:
        CRhoConnectClientFactory(){}
        
        IRhoConnectClientSingleton* createModuleSingleton()
        { 
            return new CRhoConnectClientSingletonImpl();
        }
        
        virtual IRhoConnectClient* createModuleByID(const rho::String& strID){ return new CRhoConnectClientImpl(); };
        
    };
    
}

extern "C" void Init_RhoConnectClient_extension()
{
    rho::CRhoConnectClientFactory::setInstance( new rho::CRhoConnectClientFactory() );
    rho::Init_RhoConnectClient_API();
    
}