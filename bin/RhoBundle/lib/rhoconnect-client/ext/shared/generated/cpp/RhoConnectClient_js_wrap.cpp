

#include "logging/RhoLog.h"
#undef DEFAULT_LOGCATEGORY
#define DEFAULT_LOGCATEGORY "RhoConnectClient"

#include "RhoConnectClientBase.h"
#include "api_generator/js_helpers.h"
#include "api_generator/JSONResultConvertor.h"

#include "common/StringConverter.h"

extern "C" void rho_os_impl_performOnUiThread(rho::common::IRhoRunnable* pTask);

#ifdef OS_ANDROID
#include <jni.h>
extern "C" void* rho_nativethread_start();
JNIEnv* jnienv();
#endif //OS_ANDROID

using namespace rho;
using namespace rho::json;
using namespace rho::common;
using namespace rho::apiGenerator;


rho::String js_s_RhoConnectClient_getUserName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getUserName(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getUserName,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getUserName(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getPollInterval(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eInt);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getPollInterval,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getPollInterval(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setPollInterval(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    int arg0 = 60;
    if ( argc > 0 )
    {
        if ( argv[0].isInteger() )
            arg0 = argv[0].getInt();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "integer" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setPollInterval, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setPollInterval( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getSyncServer(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getSyncServer,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getSyncServer(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setSyncServer(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setSyncServer, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setSyncServer( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getBulksyncState(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eInt);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getBulksyncState,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getBulksyncState(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setBulksyncState(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    int arg0 = 1;
    if ( argc > 0 )
    {
        if ( argv[0].isInteger() )
            arg0 = argv[0].getInt();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "integer" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setBulksyncState, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setBulksyncState( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getPageSize(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eInt);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getPageSize,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getPageSize(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setPageSize(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    int arg0 = 0;
    if ( argc > 0 )
    {
        if ( argv[0].isInteger() )
            arg0 = argv[0].getInt();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "integer" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setPageSize, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setPageSize( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getThreadedMode(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eBool);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getThreadedMode,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getThreadedMode(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setThreadedMode(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    bool arg0 = true;
    if ( argc > 0 )
    {
        if ( argv[0].isBoolean() )
            arg0 = argv[0].getBoolean();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "boolean" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setThreadedMode, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setThreadedMode( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getShowStatusPopup(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eBool);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getShowStatusPopup,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getShowStatusPopup(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setShowStatusPopup(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    bool arg0 = true;
    if ( argc > 0 )
    {
        if ( argv[0].isBoolean() )
            arg0 = argv[0].getBoolean();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "boolean" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setShowStatusPopup, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setShowStatusPopup( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getSslVerifyPeer(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eBool);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getSslVerifyPeer,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getSslVerifyPeer(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setSslVerifyPeer(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    bool arg0 = true;
    if ( argc > 0 )
    {
        if ( argv[0].isBoolean() )
            arg0 = argv[0].getBoolean();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "boolean" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setSslVerifyPeer, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setSslVerifyPeer( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_isLoggedIn(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("isLoggedIn(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eBool);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::isLoggedIn,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->isLoggedIn(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_isSyncing(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("isSyncing(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eBool);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::isSyncing,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->isSyncing(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_search(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("search(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eStringHash);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    rho::Hashtable<rho::String, rho::String> arg0;
    if ( argc > 0 )
    {
        CJSONEntry value(argv[0]);
        if ( value.isObject() )
        {
            
            CJSONStructIterator objIter(value);

            for( ; !objIter.isEnd(); objIter.next() )
            {
                arg0[objIter.getCurKey()] = objIter.getCurString();
            }
            
        }
        else if (!value.isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "hash" );
            return oRes.toJSON();
        }
    }

    oRes.setCallInUIThread(false);
    oRes.setJSCallback( strCallbackID, strJsVmID);
    oRes.setCallbackParam( strCallbackParam );

    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->search( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_doSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("doSync(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    bool arg0 = false;
    if ( argc > 0 )
    {
        if ( argv[0].isBoolean() )
            arg0 = argv[0].getBoolean();
        else if (!argv[0].isNull())
        {
            oRes.setArgError("Type error: argument " "0" " should be " "boolean" );
            return oRes.toJSON();
        }
    }

    rho::String arg1 = "";
    if ( argc > 1 )
    {
        if ( argv[1].isString() )
        {
            arg1 = argv[1].getStringObject();
        }
        else if (!argv[1].isNull())
        {
            oRes.setArgError( "Type error: argument " "1" " should be " "string" );
            return oRes.toJSON();
        }
    }

    bool arg2 = false;
    if ( argc > 2 )
    {
        if ( argv[2].isBoolean() )
            arg2 = argv[2].getBoolean();
        else if (!argv[2].isNull())
        {
            oRes.setArgError("Type error: argument " "2" " should be " "boolean" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor4( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::doSync, arg0, arg1, arg2,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->doSync( arg0, arg1, arg2,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_doSyncSource(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("doSyncSource(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(3) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    bool arg1 = false;
    if ( argc > 1 )
    {
        if ( argv[1].isBoolean() )
            arg1 = argv[1].getBoolean();
        else if (!argv[1].isNull())
        {
            oRes.setArgError("Type error: argument " "1" " should be " "boolean" );
            return oRes.toJSON();
        }
    }

    rho::String arg2 = "";
    if ( argc > 2 )
    {
        if ( argv[2].isString() )
        {
            arg2 = argv[2].getStringObject();
        }
        else if (!argv[2].isNull())
        {
            oRes.setArgError( "Type error: argument " "2" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor4( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::doSyncSource, arg0, arg1, arg2,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->doSyncSource( arg0, arg1, arg2,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_login(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("login(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eInt);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(2) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( argc == 1 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(2) );
        return oRes.toJSON();
    }
    
    rho::String arg1 = "";
    if ( argc > 1 )
    {
        if ( argv[1].isString() )
        {
            arg1 = argv[1].getStringObject();
        }
        else if (!argv[1].isNull())
        {
            oRes.setArgError( "Type error: argument " "1" " should be " "string" );
            return oRes.toJSON();
        }
    }

    oRes.setCallInUIThread(false);
    oRes.setJSCallback( strCallbackID, strJsVmID);
    oRes.setCallbackParam( strCallbackParam );

    if ( !oRes.hasCallback() )
    {
        oRes.setArgError("Callback argument is missed");
        return oRes.toJSON();
    }

    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->login( arg0, arg1,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_logout(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("logout(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::logout,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->logout(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_stopSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("stopSync(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::stopSync,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->stopSync(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setNotification(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    oRes.setCallInUIThread(false);
    oRes.setJSCallback( strCallbackID, strJsVmID);
    oRes.setCallbackParam( strCallbackParam );

    if ( !oRes.hasCallback() )
    {
        oRes.setArgError("Callback argument is missed");
        return oRes.toJSON();
    }

    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setNotification( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_clearNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("clearNotification(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::clearNotification, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->clearNotification( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setObjectNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setObjectNotification(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    oRes.setCallInUIThread(false);
    oRes.setJSCallback( strCallbackID, strJsVmID);
    oRes.setCallbackParam( strCallbackParam );

    if ( !oRes.hasCallback() )
    {
        oRes.setArgError("Callback argument is missed");
        return oRes.toJSON();
    }

    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setObjectNotification(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_addObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("addObjectNotify(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(2) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( argc == 1 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(2) );
        return oRes.toJSON();
    }
    
    rho::String arg1 = "";
    if ( argc > 1 )
    {
        if ( argv[1].isString() )
        {
            arg1 = argv[1].getStringObject();
        }
        else if (!argv[1].isNull())
        {
            oRes.setArgError( "Type error: argument " "1" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor3( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::addObjectNotify, arg0, arg1,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addObjectNotify( arg0, arg1,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_cleanObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("cleanObjectNotify(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor1( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::cleanObjectNotify,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->cleanObjectNotify(  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getLastSyncObjectCount(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getLastSyncObjectCount(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eInt);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(1) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor2( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getLastSyncObjectCount, arg0,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getLastSyncObjectCount( arg0,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_setSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("setSourceProperty(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;



    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(3) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( argc == 1 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(3) );
        return oRes.toJSON();
    }
    
    rho::String arg1 = "";
    if ( argc > 1 )
    {
        if ( argv[1].isString() )
        {
            arg1 = argv[1].getStringObject();
        }
        else if (!argv[1].isNull())
        {
            oRes.setArgError( "Type error: argument " "1" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( argc == 2 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(3) );
        return oRes.toJSON();
    }
    
    rho::String arg2 = "";
    if ( argc > 2 )
    {
        if ( argv[2].isString() )
        {
            arg2 = argv[2].getStringObject();
        }
        else if (!argv[2].isNull())
        {
            oRes.setArgError( "Type error: argument " "2" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor4( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::setSourceProperty, arg0, arg1, arg2,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->setSourceProperty( arg0, arg1, arg2,  oRes );
    }
    
    return oRes.toJSON();

}

rho::String js_s_RhoConnectClient_getSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam)
{
    RAWTRACE4("getSourceProperty(strObjID = %s, argc = %d, strCallbackID = %s, strJsVmID = %s)", strObjID.c_str(), argv.getSize(), strCallbackID.c_str(), strJsVmID.c_str());

#ifdef OS_ANDROID
    if ( jnienv() == 0 )
    {
        rho_nativethread_start();
    }
#endif

    rho::apiGenerator::CMethodResult oRes;


    oRes.setRequestedType(CMethodResult::eString);

    rho::common::CInstanceClassFunctorBase<rho::apiGenerator::CMethodResult>* pFunctor = 0;
    int argc = argv.getSize();

    if ( argc == 0 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(2) );
        return oRes.toJSON();
    }
    
    rho::String arg0 = "";
    if ( argc > 0 )
    {
        if ( argv[0].isString() )
        {
            arg0 = argv[0].getStringObject();
        }
        else if (!argv[0].isNull())
        {
            oRes.setArgError( "Type error: argument " "0" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( argc == 1 )
    {
        oRes.setArgError( "Wrong number of arguments: " + convertToStringA(argc) + " instead of " + convertToStringA(2) );
        return oRes.toJSON();
    }
    
    rho::String arg1 = "";
    if ( argc > 1 )
    {
        if ( argv[1].isString() )
        {
            arg1 = argv[1].getStringObject();
        }
        else if (!argv[1].isNull())
        {
            oRes.setArgError( "Type error: argument " "1" " should be " "string" );
            return oRes.toJSON();
        }
    }

    if ( oRes.hasCallback() )
    {
        pFunctor = rho_makeInstanceClassFunctor3( rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS(), &rho::IRhoConnectClientSingleton::getSourceProperty, arg0, arg1,  oRes );
        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->addCommandToQueue( pFunctor );
    }
    else 
    {

        rho::CRhoConnectClientFactoryBase::getRhoConnectClientSingletonS()->getSourceProperty( arg0, arg1,  oRes );
    }
    
    return oRes.toJSON();

}



