#include "api_generator/js_helpers.h"
#include "api_generator/Api.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "RhoConnectClient"




rho::String js_s_RhoConnectClient_getUserName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_isLoggedIn(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_isSyncing(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_search(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_doSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_doSyncSource(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_login(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_logout(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_stopSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_clearNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setObjectNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_addObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_cleanObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getLastSyncObjectCount(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_setSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);

rho::String js_s_RhoConnectClient_getSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam);





namespace {
  using namespace rho::apiGenerator;
  class RhoConnectClientDispatcher : public ApiHandler<Func_JS>
  {
  public:
    RhoConnectClientDispatcher() : ApiHandler("Rho:RhoConnectClient") {}
    virtual ~RhoConnectClientDispatcher() {}
    virtual void initialize();
  };
  
  void RhoConnectClientDispatcher::initialize()
  {
    ApiHandler<Func_JS>::initialize();
    
    RAWTRACE("Initializing Rho:RhoConnectClient API...");


    defineStaticMethod("userName", js_s_RhoConnectClient_getUserName);


    defineStaticMethod("pollInterval", js_s_RhoConnectClient_getPollInterval);


    defineStaticMethod("pollInterval=", js_s_RhoConnectClient_setPollInterval);


    defineStaticMethod("syncServer", js_s_RhoConnectClient_getSyncServer);


    defineStaticMethod("syncServer=", js_s_RhoConnectClient_setSyncServer);


    defineStaticMethod("bulksyncState", js_s_RhoConnectClient_getBulksyncState);


    defineStaticMethod("bulksyncState=", js_s_RhoConnectClient_setBulksyncState);


    defineStaticMethod("pageSize", js_s_RhoConnectClient_getPageSize);


    defineStaticMethod("pageSize=", js_s_RhoConnectClient_setPageSize);


    defineStaticMethod("threadedMode", js_s_RhoConnectClient_getThreadedMode);


    defineStaticMethod("threadedMode=", js_s_RhoConnectClient_setThreadedMode);


    defineStaticMethod("showStatusPopup", js_s_RhoConnectClient_getShowStatusPopup);


    defineStaticMethod("showStatusPopup=", js_s_RhoConnectClient_setShowStatusPopup);


    defineStaticMethod("sslVerifyPeer", js_s_RhoConnectClient_getSslVerifyPeer);


    defineStaticMethod("sslVerifyPeer=", js_s_RhoConnectClient_setSslVerifyPeer);


    defineStaticMethod("isLoggedIn", js_s_RhoConnectClient_isLoggedIn);


    defineStaticMethod("isSyncing", js_s_RhoConnectClient_isSyncing);


    defineStaticMethod("search", js_s_RhoConnectClient_search);


    defineStaticMethod("doSync", js_s_RhoConnectClient_doSync);


    defineStaticMethod("doSyncSource", js_s_RhoConnectClient_doSyncSource);


    defineStaticMethod("login", js_s_RhoConnectClient_login);


    defineStaticMethod("logout", js_s_RhoConnectClient_logout);


    defineStaticMethod("stopSync", js_s_RhoConnectClient_stopSync);


    defineStaticMethod("setNotification", js_s_RhoConnectClient_setNotification);


    defineStaticMethod("clearNotification", js_s_RhoConnectClient_clearNotification);


    defineStaticMethod("setObjectNotification", js_s_RhoConnectClient_setObjectNotification);


    defineStaticMethod("addObjectNotify", js_s_RhoConnectClient_addObjectNotify);


    defineStaticMethod("cleanObjectNotify", js_s_RhoConnectClient_cleanObjectNotify);


    defineStaticMethod("getLastSyncObjectCount", js_s_RhoConnectClient_getLastSyncObjectCount);


    defineStaticMethod("setSourceProperty", js_s_RhoConnectClient_setSourceProperty);


    defineStaticMethod("getSourceProperty", js_s_RhoConnectClient_getSourceProperty);


    RAWTRACE("Rho:RhoConnectClient API - done");
  }
}

extern "C" void Init_JSAPI_RhoConnectClient(void)
{
  rho::apiGenerator::defineJSApiModule(new RhoConnectClientDispatcher);
}
