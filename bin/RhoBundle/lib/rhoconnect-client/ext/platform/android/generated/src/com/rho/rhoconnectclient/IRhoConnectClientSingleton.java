package com.rho.rhoconnectclient;



import java.util.Map;
import java.util.List;

import com.rhomobile.rhodes.api.IMethodResult;


public interface IRhoConnectClientSingleton
 {



  // hash keys used in properties and parameters

    static final String HK_FROM = "from"; 
    static final String HK_MAX_RESULTS = "maxResults"; 
    static final String HK_OFFSET = "offset"; 
    static final String HK_PROGRESS_STEP = "progressStep"; 
    static final String HK_SEARCH_PARAMS = "searchParams"; 
    static final String HK_SOURCE_NAMES = "sourceNames"; 
    static final String HK_SYNC_CHANGES = "syncChanges"; 
    static final String PROPERTY_BULKSYNC_STATE = "bulksyncState"; 
    static final String PROPERTY_PAGE_SIZE = "pageSize"; 
    static final String PROPERTY_POLL_INTERVAL = "pollInterval"; 
    static final String PROPERTY_SHOW_STATUS_POPUP = "showStatusPopup"; 
    static final String PROPERTY_SSL_VERIFY_PEER = "sslVerifyPeer"; 
    static final String PROPERTY_SYNC_SERVER = "syncServer"; 
    static final String PROPERTY_THREADED_MODE = "threadedMode"; 
    static final String PROPERTY_USER_NAME = "userName"; 


    void getUserName(IMethodResult result); 
    void getPollInterval(IMethodResult result); 
    void setPollInterval(int pollInterval, IMethodResult result); 
    void getSyncServer(IMethodResult result); 
    void setSyncServer(String syncServer, IMethodResult result); 
    void getBulksyncState(IMethodResult result); 
    void setBulksyncState(int bulksyncState, IMethodResult result); 
    void getPageSize(IMethodResult result); 
    void setPageSize(int pageSize, IMethodResult result); 
    void getThreadedMode(IMethodResult result); 
    void setThreadedMode(boolean threadedMode, IMethodResult result); 
    void getShowStatusPopup(IMethodResult result); 
    void setShowStatusPopup(boolean showStatusPopup, IMethodResult result); 
    void getSslVerifyPeer(IMethodResult result); 
    void setSslVerifyPeer(boolean sslVerifyPeer, IMethodResult result); 
    void isLoggedIn(IMethodResult result); 
    void isSyncing(IMethodResult result); 
    void search(Map<String, Object> args, IMethodResult result); 
    void doSync(boolean showStatusPopup, String queryParams, boolean syncOnlyChangedSources, IMethodResult result); 
    void doSyncSource(String sourceName, boolean showStatusPopup, String queryParams, IMethodResult result); 
    void login(String login, String password, IMethodResult result); 
    void logout(IMethodResult result); 
    void stopSync(IMethodResult result); 
    void setNotification(String sourceName, IMethodResult result); 
    void clearNotification(String sourceName, IMethodResult result); 
    void setObjectNotification(IMethodResult result); 
    void addObjectNotify(String sourceName, String object, IMethodResult result); 
    void cleanObjectNotify(IMethodResult result); 
    void getLastSyncObjectCount(String sourceName, IMethodResult result); 
    void setSourceProperty(String sourceName, String propertyName, String propertyValue, IMethodResult result); 
    void getSourceProperty(String sourceName, String propertyName, IMethodResult result); 

}
