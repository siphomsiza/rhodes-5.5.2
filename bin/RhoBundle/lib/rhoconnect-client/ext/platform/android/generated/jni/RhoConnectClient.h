#pragma once

#include "common/RhoStd.h"
#include "logging/RhoLog.h"
#include "rhodes/JNIRhodes.h"
#include "MethodExecutorJni.h"
#include "MethodResultJni.h"


namespace rho {

using rho::apiGenerator::MethodResultJni;
using rho::apiGenerator::MethodExecutorJni;

class CRhoConnectClientBase : public MethodExecutorJni
{
protected:
    DEFINE_LOGCLASS;

    static const char* const FACTORY_SINGLETON_CLASS;
    static jclass s_clsFactorySingleton;
    static jmethodID s_midFactorySetInstance;
    static jmethodID s_midFactoryGetInstance;

    //IRhoConnectClientFactory staff
    static const char* const IFACTORY_CLASS;
    static jclass s_clsIFactory;
    static jmethodID s_midGetApiSingleton;
    static jmethodID s_midGetApiObject;

    //RhoConnectClientSingletonBase staff
    static const char* const SINGLETON_BASE_CLASS;
    static jclass s_clsSingletonBase;

    //RhoConnectClientBase staff
    static const char* const OBJECT_BASE_CLASS;
    static jclass s_clsObjectBase;

    //Method tasks

    static const char* const GETUSERNAME_TASK_CLASS;
    static jclass s_clsgetUserNameTask;
    static jmethodID s_midgetUserNameTask;
    static const char* const GETPOLLINTERVAL_TASK_CLASS;
    static jclass s_clsgetPollIntervalTask;
    static jmethodID s_midgetPollIntervalTask;
    static const char* const SETPOLLINTERVAL_TASK_CLASS;
    static jclass s_clssetPollIntervalTask;
    static jmethodID s_midsetPollIntervalTask;
    static const char* const GETSYNCSERVER_TASK_CLASS;
    static jclass s_clsgetSyncServerTask;
    static jmethodID s_midgetSyncServerTask;
    static const char* const SETSYNCSERVER_TASK_CLASS;
    static jclass s_clssetSyncServerTask;
    static jmethodID s_midsetSyncServerTask;
    static const char* const GETBULKSYNCSTATE_TASK_CLASS;
    static jclass s_clsgetBulksyncStateTask;
    static jmethodID s_midgetBulksyncStateTask;
    static const char* const SETBULKSYNCSTATE_TASK_CLASS;
    static jclass s_clssetBulksyncStateTask;
    static jmethodID s_midsetBulksyncStateTask;
    static const char* const GETPAGESIZE_TASK_CLASS;
    static jclass s_clsgetPageSizeTask;
    static jmethodID s_midgetPageSizeTask;
    static const char* const SETPAGESIZE_TASK_CLASS;
    static jclass s_clssetPageSizeTask;
    static jmethodID s_midsetPageSizeTask;
    static const char* const GETTHREADEDMODE_TASK_CLASS;
    static jclass s_clsgetThreadedModeTask;
    static jmethodID s_midgetThreadedModeTask;
    static const char* const SETTHREADEDMODE_TASK_CLASS;
    static jclass s_clssetThreadedModeTask;
    static jmethodID s_midsetThreadedModeTask;
    static const char* const GETSHOWSTATUSPOPUP_TASK_CLASS;
    static jclass s_clsgetShowStatusPopupTask;
    static jmethodID s_midgetShowStatusPopupTask;
    static const char* const SETSHOWSTATUSPOPUP_TASK_CLASS;
    static jclass s_clssetShowStatusPopupTask;
    static jmethodID s_midsetShowStatusPopupTask;
    static const char* const GETSSLVERIFYPEER_TASK_CLASS;
    static jclass s_clsgetSslVerifyPeerTask;
    static jmethodID s_midgetSslVerifyPeerTask;
    static const char* const SETSSLVERIFYPEER_TASK_CLASS;
    static jclass s_clssetSslVerifyPeerTask;
    static jmethodID s_midsetSslVerifyPeerTask;
    static const char* const ISLOGGEDIN_TASK_CLASS;
    static jclass s_clsisLoggedInTask;
    static jmethodID s_midisLoggedInTask;
    static const char* const ISSYNCING_TASK_CLASS;
    static jclass s_clsisSyncingTask;
    static jmethodID s_midisSyncingTask;
    static const char* const SEARCH_TASK_CLASS;
    static jclass s_clssearchTask;
    static jmethodID s_midsearchTask;
    static const char* const DOSYNC_TASK_CLASS;
    static jclass s_clsdoSyncTask;
    static jmethodID s_middoSyncTask;
    static const char* const DOSYNCSOURCE_TASK_CLASS;
    static jclass s_clsdoSyncSourceTask;
    static jmethodID s_middoSyncSourceTask;
    static const char* const LOGIN_TASK_CLASS;
    static jclass s_clsloginTask;
    static jmethodID s_midloginTask;
    static const char* const LOGOUT_TASK_CLASS;
    static jclass s_clslogoutTask;
    static jmethodID s_midlogoutTask;
    static const char* const STOPSYNC_TASK_CLASS;
    static jclass s_clsstopSyncTask;
    static jmethodID s_midstopSyncTask;
    static const char* const SETNOTIFICATION_TASK_CLASS;
    static jclass s_clssetNotificationTask;
    static jmethodID s_midsetNotificationTask;
    static const char* const CLEARNOTIFICATION_TASK_CLASS;
    static jclass s_clsclearNotificationTask;
    static jmethodID s_midclearNotificationTask;
    static const char* const SETOBJECTNOTIFICATION_TASK_CLASS;
    static jclass s_clssetObjectNotificationTask;
    static jmethodID s_midsetObjectNotificationTask;
    static const char* const ADDOBJECTNOTIFY_TASK_CLASS;
    static jclass s_clsaddObjectNotifyTask;
    static jmethodID s_midaddObjectNotifyTask;
    static const char* const CLEANOBJECTNOTIFY_TASK_CLASS;
    static jclass s_clscleanObjectNotifyTask;
    static jmethodID s_midcleanObjectNotifyTask;
    static const char* const GETLASTSYNCOBJECTCOUNT_TASK_CLASS;
    static jclass s_clsgetLastSyncObjectCountTask;
    static jmethodID s_midgetLastSyncObjectCountTask;
    static const char* const SETSOURCEPROPERTY_TASK_CLASS;
    static jclass s_clssetSourcePropertyTask;
    static jmethodID s_midsetSourcePropertyTask;
    static const char* const GETSOURCEPROPERTY_TASK_CLASS;
    static jclass s_clsgetSourcePropertyTask;
    static jmethodID s_midgetSourcePropertyTask;


    static JNIEnv* jniInit(JNIEnv* env);
    static JNIEnv* jniInit();

    static jobject getFactory(JNIEnv* env);
    static jobject getSingleton(JNIEnv* env);

    rho::String m_id;
    jobject getObject(JNIEnv* env);
public:
    static void setJavaFactory(JNIEnv* env, jobject jFactory);


    CRhoConnectClientBase(const rho::String& id)
        : MethodExecutorJni(), m_id(id)
        {}
    virtual ~CRhoConnectClientBase() {}
};

template <typename T>
class CRhoConnectClientProxy : public CRhoConnectClientBase
{
public:
    CRhoConnectClientProxy(const rho::String& id)
        : CRhoConnectClientBase(id)
        {}
    virtual ~CRhoConnectClientProxy() {}

    static
    void getUserName(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getUserName";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetUserNameTask, s_midgetUserNameTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getPollInterval(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getPollInterval";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetPollIntervalTask, s_midgetPollIntervalTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setPollInterval(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setPollInterval";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jholder< jint > jhpollInterval = (argsAdapter.size() <= 0) ?
            rho_cast<jint>(env, static_cast<int>(60)) : 
                rho_cast< jint >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetPollIntervalTask, s_midsetPollIntervalTask,
                    jhObject.get(), 
                    jhpollInterval.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getSyncServer(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getSyncServer";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetSyncServerTask, s_midgetSyncServerTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setSyncServer(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setSyncServer";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'syncServer' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'syncServer' must be set");
            return;
        }
        jholder< jstring > jhsyncServer = 
            rho_cast< jstring >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetSyncServerTask, s_midsetSyncServerTask,
                    jhObject.get(), 
                    jhsyncServer.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getBulksyncState(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getBulksyncState";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetBulksyncStateTask, s_midgetBulksyncStateTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setBulksyncState(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setBulksyncState";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jholder< jint > jhbulksyncState = (argsAdapter.size() <= 0) ?
            rho_cast<jint>(env, static_cast<int>(1)) : 
                rho_cast< jint >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetBulksyncStateTask, s_midsetBulksyncStateTask,
                    jhObject.get(), 
                    jhbulksyncState.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getPageSize(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getPageSize";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetPageSizeTask, s_midgetPageSizeTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setPageSize(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setPageSize";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'pageSize' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'pageSize' must be set");
            return;
        }
        jholder< jint > jhpageSize = 
            rho_cast< jint >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetPageSizeTask, s_midsetPageSizeTask,
                    jhObject.get(), 
                    jhpageSize.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getThreadedMode(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getThreadedMode";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetThreadedModeTask, s_midgetThreadedModeTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setThreadedMode(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setThreadedMode";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jholder< jboolean > jhthreadedMode = (argsAdapter.size() <= 0) ?
            rho_cast<jboolean>(env, static_cast<bool>(true)) : 
                rho_cast< jboolean >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetThreadedModeTask, s_midsetThreadedModeTask,
                    jhObject.get(), 
                    jhthreadedMode.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getShowStatusPopup(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getShowStatusPopup";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetShowStatusPopupTask, s_midgetShowStatusPopupTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setShowStatusPopup(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setShowStatusPopup";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jholder< jboolean > jhshowStatusPopup = (argsAdapter.size() <= 0) ?
            rho_cast<jboolean>(env, static_cast<bool>(true)) : 
                rho_cast< jboolean >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetShowStatusPopupTask, s_midsetShowStatusPopupTask,
                    jhObject.get(), 
                    jhshowStatusPopup.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getSslVerifyPeer(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getSslVerifyPeer";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsgetSslVerifyPeerTask, s_midgetSslVerifyPeerTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setSslVerifyPeer(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setSslVerifyPeer";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jholder< jboolean > jhsslVerifyPeer = (argsAdapter.size() <= 0) ?
            rho_cast<jboolean>(env, static_cast<bool>(true)) : 
                rho_cast< jboolean >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetSslVerifyPeerTask, s_midsetSslVerifyPeerTask,
                    jhObject.get(), 
                    jhsslVerifyPeer.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void isLoggedIn(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "isLoggedIn";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsisLoggedInTask, s_midisLoggedInTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void isSyncing(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "isSyncing";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsisSyncingTask, s_midisSyncingTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void search(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "search";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'args' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'args' must be set");
            return;
        }
        jholder< jobject > jhargs = 
            convertToPropertyMap(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssearchTask, s_midsearchTask,
                    jhObject.get(), 
                    jhargs.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::FORCE_CURRENT_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void doSync(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "doSync";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jholder< jboolean > jhshowStatusPopup = (argsAdapter.size() <= 0) ?
            0 : 
                rho_cast< jboolean >(env, argsAdapter[0]);

        jholder< jstring > jhqueryParams = (argsAdapter.size() <= 1) ?
            0 : 
                rho_cast< jstring >(env, argsAdapter[1]);

        jholder< jboolean > jhsyncOnlyChangedSources = (argsAdapter.size() <= 2) ?
            0 : 
                rho_cast< jboolean >(env, argsAdapter[2]);

        jhobject jhTask = env->NewObject(s_clsdoSyncTask, s_middoSyncTask,
                    jhObject.get(), 
                    jhshowStatusPopup.get(),
                    jhqueryParams.get(),
                    jhsyncOnlyChangedSources.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void doSyncSource(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "doSyncSource";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        jholder< jboolean > jhshowStatusPopup = (argsAdapter.size() <= 1) ?
            0 : 
                rho_cast< jboolean >(env, argsAdapter[1]);

        jholder< jstring > jhqueryParams = (argsAdapter.size() <= 2) ?
            0 : 
                rho_cast< jstring >(env, argsAdapter[2]);

        jhobject jhTask = env->NewObject(s_clsdoSyncSourceTask, s_middoSyncSourceTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    jhshowStatusPopup.get(),
                    jhqueryParams.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void login(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "login";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'login' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'login' must be set");
            return;
        }
        jholder< jstring > jhlogin = 
            rho_cast< jstring >(env, argsAdapter[0]);

        if(argsAdapter.size() <= 1)
        {
            LOG(ERROR) + "Wrong number of arguments: 'password' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'password' must be set");
            return;
        }
        jholder< jstring > jhpassword = 
            rho_cast< jstring >(env, argsAdapter[1]);

        jhobject jhTask = env->NewObject(s_clsloginTask, s_midloginTask,
                    jhObject.get(), 
                    jhlogin.get(),
                    jhpassword.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::FORCE_CURRENT_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void logout(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "logout";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clslogoutTask, s_midlogoutTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void stopSync(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "stopSync";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clsstopSyncTask, s_midstopSyncTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setNotification(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setNotification";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clssetNotificationTask, s_midsetNotificationTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::FORCE_CURRENT_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void clearNotification(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "clearNotification";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clsclearNotificationTask, s_midclearNotificationTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setObjectNotification(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setObjectNotification";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clssetObjectNotificationTask, s_midsetObjectNotificationTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::FORCE_CURRENT_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void addObjectNotify(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "addObjectNotify";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        if(argsAdapter.size() <= 1)
        {
            LOG(ERROR) + "Wrong number of arguments: 'object' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'object' must be set");
            return;
        }
        jholder< jstring > jhobject = 
            rho_cast< jstring >(env, argsAdapter[1]);

        jhobject jhTask = env->NewObject(s_clsaddObjectNotifyTask, s_midaddObjectNotifyTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    jhobject.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void cleanObjectNotify(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "cleanObjectNotify";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        jhobject jhTask = env->NewObject(s_clscleanObjectNotifyTask, s_midcleanObjectNotifyTask,
                    jhObject.get(), 
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getLastSyncObjectCount(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getLastSyncObjectCount";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        jhobject jhTask = env->NewObject(s_clsgetLastSyncObjectCountTask, s_midgetLastSyncObjectCountTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void setSourceProperty(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "setSourceProperty";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        if(argsAdapter.size() <= 1)
        {
            LOG(ERROR) + "Wrong number of arguments: 'propertyName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'propertyName' must be set");
            return;
        }
        jholder< jstring > jhpropertyName = 
            rho_cast< jstring >(env, argsAdapter[1]);

        if(argsAdapter.size() <= 2)
        {
            LOG(ERROR) + "Wrong number of arguments: 'propertyValue' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'propertyValue' must be set");
            return;
        }
        jholder< jstring > jhpropertyValue = 
            rho_cast< jstring >(env, argsAdapter[2]);

        jhobject jhTask = env->NewObject(s_clssetSourcePropertyTask, s_midsetSourcePropertyTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    jhpropertyName.get(),
                    jhpropertyValue.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }

    static
    void getSourceProperty(const T& argsAdapter, MethodResultJni& result)
    {
        LOG(TRACE) + "getSourceProperty";

        JNIEnv *env = jniInit();
        if (!env) {
            LOG(FATAL) + "JNI initialization failed";
            return;
        }

        jhobject jhObject = 
            getSingleton(env); 

        if(argsAdapter.size() <= 0)
        {
            LOG(ERROR) + "Wrong number of arguments: 'sourceName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'sourceName' must be set");
            return;
        }
        jholder< jstring > jhsourceName = 
            rho_cast< jstring >(env, argsAdapter[0]);

        if(argsAdapter.size() <= 1)
        {
            LOG(ERROR) + "Wrong number of arguments: 'propertyName' must be set ^^^";
            result.setArgError("Wrong number of arguments: 'propertyName' must be set");
            return;
        }
        jholder< jstring > jhpropertyName = 
            rho_cast< jstring >(env, argsAdapter[1]);

        jhobject jhTask = env->NewObject(s_clsgetSourcePropertyTask, s_midgetSourcePropertyTask,
                    jhObject.get(), 
                    jhsourceName.get(),
                    jhpropertyName.get(),
                    static_cast<jobject>(result));

        run(env, jhTask.get(), result, rho::apiGenerator::NOT_FORCE_THREAD);
        if(env->ExceptionCheck() == JNI_TRUE)
        {
            rho::String message = rho::common::clearException(env);
            LOG(ERROR) + message;
            result.setError(message);
        }
    }


};


}
