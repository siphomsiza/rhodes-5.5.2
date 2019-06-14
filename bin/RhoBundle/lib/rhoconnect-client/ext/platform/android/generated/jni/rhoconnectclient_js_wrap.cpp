#include "RhoConnectClient.h"

#include "MethodResultJni.h"

#include "rhodes/JNIRhoJS.h"

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "RhoConnectClientJS"

typedef rho::CRhoConnectClientProxy<ArgumentsAdapter<rho::json::CJSONArray> > ObjectProxy;

using namespace rho::apiGenerator;



rho::String js_s_RhoConnectClient_getUserName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getUserName(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getPollInterval(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setPollInterval(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getSyncServer(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setSyncServer(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getBulksyncState(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setBulksyncState(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getPageSize(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setPageSize(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getThreadedMode(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setThreadedMode(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getShowStatusPopup(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setShowStatusPopup(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getSslVerifyPeer(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setSslVerifyPeer(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_isLoggedIn(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::isLoggedIn(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_isSyncing(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::isSyncing(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_search(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::search(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_doSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 3))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::doSync(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_doSyncSource(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 3))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::doSyncSource(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_login(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 2) || (argc > 2))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    if(!result.hasCallback())
    {
        if(!result.isError())
        {
            result.setArgError("No callback handler provided");
        }
        RAWLOG_ERROR1("Error setting callback: %s", result.getErrorMessage().c_str());
        return CMethodResultConvertor().toJSON(result);
    }

    ObjectProxy::login(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_logout(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::logout(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_stopSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::stopSync(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    if(!result.hasCallback())
    {
        if(!result.isError())
        {
            result.setArgError("No callback handler provided");
        }
        RAWLOG_ERROR1("Error setting callback: %s", result.getErrorMessage().c_str());
        return CMethodResultConvertor().toJSON(result);
    }

    ObjectProxy::setNotification(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_clearNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::clearNotification(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setObjectNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    if(!result.hasCallback())
    {
        if(!result.isError())
        {
            result.setArgError("No callback handler provided");
        }
        RAWLOG_ERROR1("Error setting callback: %s", result.getErrorMessage().c_str());
        return CMethodResultConvertor().toJSON(result);
    }

    ObjectProxy::setObjectNotification(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_addObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 2) || (argc > 2))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::addObjectNotify(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_cleanObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 0) || (argc > 0))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::cleanObjectNotify(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getLastSyncObjectCount(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 1) || (argc > 1))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getLastSyncObjectCount(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_setSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 3) || (argc > 3))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::setSourceProperty(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
rho::String js_s_RhoConnectClient_getSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE2("%s(id=%s)", __FUNCTION__, strObjID.c_str());

    MethodResultJni result(false);
    if(!result)
    {
        result.setError("JNI error: failed to initialize MethodResult java object");
        RAWLOG_ERROR("JNI error: failed to initialize MethodResult java object ^^^");
        return CMethodResultConvertor().toJSON(result);
    }


    int argc = argv.getSize();
    if((argc < 2) || (argc > 2))
    {
        result.setArgError("Wrong number of arguments");
        RAWLOG_ERROR1("Wrong number of arguments: %d ^^^", argc);
        return CMethodResultConvertor().toJSON(result);
    }
    
    if(strCallbackID.length() != 0)
    {
        result.setCallBack(strCallbackID, strCallbackParam);
    }

    ObjectProxy::getSourceProperty(argumentsAdapter(argv), result); 
    rho::String res = CMethodResultConvertor().toJSON(result);
    RAWTRACE(res.c_str());
    RAWTRACE2("%s(id=%s) end ^^^", __FUNCTION__, strObjID.c_str());
    return res;
}
