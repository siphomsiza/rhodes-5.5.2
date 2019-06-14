#include "ruby.h"

static VALUE rb_api_mParent;
static VALUE rb_api_mRhoConnectClient;

VALUE rb_s_RhoConnectClient_getUserName(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getPollInterval(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setPollInterval(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getSyncServer(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setSyncServer(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getBulksyncState(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setBulksyncState(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getPageSize(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setPageSize(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getThreadedMode(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setThreadedMode(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getShowStatusPopup(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setShowStatusPopup(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getSslVerifyPeer(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setSslVerifyPeer(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_isLoggedIn(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_isSyncing(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_search(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_doSync(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_doSyncSource(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_login(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_logout(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_stopSync(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setNotification(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_clearNotification(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setObjectNotification(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_addObjectNotify(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_cleanObjectNotify(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getLastSyncObjectCount(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_setSourceProperty(int argc, VALUE *argv);
VALUE rb_s_RhoConnectClient_getSourceProperty(int argc, VALUE *argv);




VALUE getRuby_RhoConnectClient_Module(){ return rb_api_mRhoConnectClient; }



static void _free_class_object(void *p)
{
    ruby_xfree(p);
}

static VALUE _allocate_class_object(VALUE klass)
{
    VALUE valObj = 0;
    char ** ppString = NULL;
    void* pData = ALLOC(void*);
    memset( pData, 0, sizeof(pData) );
    
	valObj = Data_Wrap_Struct(klass, 0, _free_class_object, pData);

    Data_Get_Struct(valObj, char *, ppString);
    *ppString = xmalloc(10);
    sprintf(*ppString, "%X", valObj);

    return valObj;
}

void Init_RubyAPI_RhoConnectClient(void)
{

    VALUE tmpParent = Qnil;
    rb_api_mParent = rb_define_module("Rho");
    

	rb_api_mRhoConnectClient = rb_define_class_under(rb_api_mParent, "RhoConnectClient", rb_cObject);

	rb_define_alloc_func(rb_api_mRhoConnectClient, _allocate_class_object);
    //Constructor should be not available in case of static members
    //rb_undef_alloc_func(rb_api_mRhoConnectClient);

    rb_define_singleton_method(rb_api_mRhoConnectClient, "userName", rb_s_RhoConnectClient_getUserName, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "pollInterval", rb_s_RhoConnectClient_getPollInterval, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "pollInterval=", rb_s_RhoConnectClient_setPollInterval, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "syncServer", rb_s_RhoConnectClient_getSyncServer, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "syncServer=", rb_s_RhoConnectClient_setSyncServer, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "bulksyncState", rb_s_RhoConnectClient_getBulksyncState, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "bulksyncState=", rb_s_RhoConnectClient_setBulksyncState, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "pageSize", rb_s_RhoConnectClient_getPageSize, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "pageSize=", rb_s_RhoConnectClient_setPageSize, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "threadedMode", rb_s_RhoConnectClient_getThreadedMode, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "threadedMode=", rb_s_RhoConnectClient_setThreadedMode, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "showStatusPopup", rb_s_RhoConnectClient_getShowStatusPopup, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "showStatusPopup=", rb_s_RhoConnectClient_setShowStatusPopup, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "sslVerifyPeer", rb_s_RhoConnectClient_getSslVerifyPeer, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "sslVerifyPeer=", rb_s_RhoConnectClient_setSslVerifyPeer, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "isLoggedIn", rb_s_RhoConnectClient_isLoggedIn, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "isSyncing", rb_s_RhoConnectClient_isSyncing, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "search", rb_s_RhoConnectClient_search, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "doSync", rb_s_RhoConnectClient_doSync, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "doSyncSource", rb_s_RhoConnectClient_doSyncSource, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "login", rb_s_RhoConnectClient_login, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "logout", rb_s_RhoConnectClient_logout, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "stopSync", rb_s_RhoConnectClient_stopSync, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "setNotification", rb_s_RhoConnectClient_setNotification, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "clearNotification", rb_s_RhoConnectClient_clearNotification, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "setObjectNotification", rb_s_RhoConnectClient_setObjectNotification, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "addObjectNotify", rb_s_RhoConnectClient_addObjectNotify, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "cleanObjectNotify", rb_s_RhoConnectClient_cleanObjectNotify, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "getLastSyncObjectCount", rb_s_RhoConnectClient_getLastSyncObjectCount, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "setSourceProperty", rb_s_RhoConnectClient_setSourceProperty, -1);
    rb_define_singleton_method(rb_api_mRhoConnectClient, "getSourceProperty", rb_s_RhoConnectClient_getSourceProperty, -1);






    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "dosync", "doSync");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "set_objectnotify_url", "setObjectNotification");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "add_objectnotify", "addObjectNotify");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "clean_objectnotify", "cleanObjectNotify");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "stop_sync", "stopSync");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "user_name", "userName");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "poll_interval", "pollInterval");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "poll_interval=", "pollInterval=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "sync_server", "syncServer");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "sync_server=", "syncServer=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "bulksync_state", "bulksyncState");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "bulksync_state=", "bulksyncState=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "page_size", "pageSize");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "page_size=", "pageSize=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "threaded_mode", "threadedMode");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "threaded_mode=", "threadedMode=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "show_status_popup", "showStatusPopup");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "show_status_popup=", "showStatusPopup=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "ssl_verify_peer", "sslVerifyPeer");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "ssl_verify_peer=", "sslVerifyPeer=");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "is_logged_in", "isLoggedIn");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "is_syncing", "isSyncing");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "do_sync", "doSync");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "do_sync_source", "doSyncSource");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "set_notification", "setNotification");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "clear_notification", "clearNotification");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "set_object_notification", "setObjectNotification");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "add_object_notify", "addObjectNotify");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "clean_object_notify", "cleanObjectNotify");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "get_last_sync_object_count", "getLastSyncObjectCount");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "set_source_property", "setSourceProperty");
    rb_define_alias(rb_singleton_class(rb_api_mRhoConnectClient), "get_source_property", "getSourceProperty");


    rb_const_set(rb_mKernel, rb_intern("SyncEngine"), rb_api_mRhoConnectClient );
}

