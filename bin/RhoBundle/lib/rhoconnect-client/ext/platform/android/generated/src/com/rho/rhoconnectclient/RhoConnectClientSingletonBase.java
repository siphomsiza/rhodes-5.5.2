package com.rho.rhoconnectclient;

import java.util.List;
import java.util.Map;

import com.rhomobile.rhodes.api.IMethodResult;

public abstract class RhoConnectClientSingletonBase  {


    public static class getUserNameTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getUserNameTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getUserName( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getPollIntervalTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getPollIntervalTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getPollInterval( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setPollIntervalTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private int pollInterval; 
        private IMethodResult mResult;

        public setPollIntervalTask(IRhoConnectClientSingleton obj, 
                int pollInterval,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.pollInterval = pollInterval;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setPollInterval(
                    pollInterval,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getSyncServerTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getSyncServerTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getSyncServer( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setSyncServerTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String syncServer; 
        private IMethodResult mResult;

        public setSyncServerTask(IRhoConnectClientSingleton obj, 
                String syncServer,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.syncServer = syncServer;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setSyncServer(
                    syncServer,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getBulksyncStateTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getBulksyncStateTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getBulksyncState( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setBulksyncStateTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private int bulksyncState; 
        private IMethodResult mResult;

        public setBulksyncStateTask(IRhoConnectClientSingleton obj, 
                int bulksyncState,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.bulksyncState = bulksyncState;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setBulksyncState(
                    bulksyncState,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getPageSizeTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getPageSizeTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getPageSize( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setPageSizeTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private int pageSize; 
        private IMethodResult mResult;

        public setPageSizeTask(IRhoConnectClientSingleton obj, 
                int pageSize,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.pageSize = pageSize;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setPageSize(
                    pageSize,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getThreadedModeTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getThreadedModeTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getThreadedMode( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setThreadedModeTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private boolean threadedMode; 
        private IMethodResult mResult;

        public setThreadedModeTask(IRhoConnectClientSingleton obj, 
                boolean threadedMode,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.threadedMode = threadedMode;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setThreadedMode(
                    threadedMode,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getShowStatusPopupTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getShowStatusPopupTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getShowStatusPopup( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setShowStatusPopupTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private boolean showStatusPopup; 
        private IMethodResult mResult;

        public setShowStatusPopupTask(IRhoConnectClientSingleton obj, 
                boolean showStatusPopup,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.showStatusPopup = showStatusPopup;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setShowStatusPopup(
                    showStatusPopup,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getSslVerifyPeerTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public getSslVerifyPeerTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getSslVerifyPeer( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setSslVerifyPeerTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private boolean sslVerifyPeer; 
        private IMethodResult mResult;

        public setSslVerifyPeerTask(IRhoConnectClientSingleton obj, 
                boolean sslVerifyPeer,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sslVerifyPeer = sslVerifyPeer;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setSslVerifyPeer(
                    sslVerifyPeer,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class isLoggedInTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public isLoggedInTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.isLoggedIn( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class isSyncingTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public isSyncingTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.isSyncing( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class searchTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private Map<String, Object> args; 
        private IMethodResult mResult;

        public searchTask(IRhoConnectClientSingleton obj, 
                Map<String, Object> args,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.args = args;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.search(
                    args,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class doSyncTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private boolean showStatusPopup; 
        private String queryParams; 
        private boolean syncOnlyChangedSources; 
        private IMethodResult mResult;

        public doSyncTask(IRhoConnectClientSingleton obj, 
                boolean showStatusPopup, 
                String queryParams, 
                boolean syncOnlyChangedSources,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.showStatusPopup = showStatusPopup;
            this.queryParams = queryParams;
            this.syncOnlyChangedSources = syncOnlyChangedSources;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.doSync(
                    showStatusPopup, 
                    queryParams, 
                    syncOnlyChangedSources,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class doSyncSourceTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private boolean showStatusPopup; 
        private String queryParams; 
        private IMethodResult mResult;

        public doSyncSourceTask(IRhoConnectClientSingleton obj, 
                String sourceName, 
                boolean showStatusPopup, 
                String queryParams,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;
            this.showStatusPopup = showStatusPopup;
            this.queryParams = queryParams;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.doSyncSource(
                    sourceName, 
                    showStatusPopup, 
                    queryParams,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class loginTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String login; 
        private String password; 
        private IMethodResult mResult;

        public loginTask(IRhoConnectClientSingleton obj, 
                String login, 
                String password,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.login = login;
            this.password = password;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.login(
                    login, 
                    password,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class logoutTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public logoutTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.logout( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class stopSyncTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public stopSyncTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.stopSync( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setNotificationTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private IMethodResult mResult;

        public setNotificationTask(IRhoConnectClientSingleton obj, 
                String sourceName,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setNotification(
                    sourceName,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class clearNotificationTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private IMethodResult mResult;

        public clearNotificationTask(IRhoConnectClientSingleton obj, 
                String sourceName,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.clearNotification(
                    sourceName,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setObjectNotificationTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public setObjectNotificationTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setObjectNotification( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class addObjectNotifyTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private String object; 
        private IMethodResult mResult;

        public addObjectNotifyTask(IRhoConnectClientSingleton obj, 
                String sourceName, 
                String object,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;
            this.object = object;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.addObjectNotify(
                    sourceName, 
                    object,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class cleanObjectNotifyTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private IMethodResult mResult;

        public cleanObjectNotifyTask(IRhoConnectClientSingleton obj,         
                IMethodResult result) {
            this.mApiSingleton = obj;         
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.cleanObjectNotify( mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getLastSyncObjectCountTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private IMethodResult mResult;

        public getLastSyncObjectCountTask(IRhoConnectClientSingleton obj, 
                String sourceName,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getLastSyncObjectCount(
                    sourceName,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class setSourcePropertyTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private String propertyName; 
        private String propertyValue; 
        private IMethodResult mResult;

        public setSourcePropertyTask(IRhoConnectClientSingleton obj, 
                String sourceName, 
                String propertyName, 
                String propertyValue,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;
            this.propertyName = propertyName;
            this.propertyValue = propertyValue;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.setSourceProperty(
                    sourceName, 
                    propertyName, 
                    propertyValue,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    public static class getSourcePropertyTask implements Runnable {
        private IRhoConnectClientSingleton mApiSingleton; 
        private String sourceName; 
        private String propertyName; 
        private IMethodResult mResult;

        public getSourcePropertyTask(IRhoConnectClientSingleton obj, 
                String sourceName, 
                String propertyName,         
                IMethodResult result) {
            this.mApiSingleton = obj; 
            this.sourceName = sourceName;
            this.propertyName = propertyName;        
            this.mResult = result;
        }

        @Override
        public void run() {
            try {
                mApiSingleton.getSourceProperty(
                    sourceName, 
                    propertyName,  mResult);
            } catch (Throwable ex) {
                mResult.set(ex);
            }
        }
    }

    
}
