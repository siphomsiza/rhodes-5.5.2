
#import <Foundation/Foundation.h>

#import "api_generator/iphone/IMethodResult.h"


// hash keys used in properties and parameters

#define HK_FROM @"from"

#define HK_MAX_RESULTS @"maxResults"

#define HK_OFFSET @"offset"

#define HK_PROGRESS_STEP @"progressStep"

#define HK_SEARCH_PARAMS @"searchParams"

#define HK_SOURCE_NAMES @"sourceNames"

#define HK_SYNC_CHANGES @"syncChanges"

#define PROPERTY_BULKSYNC_STATE @"bulksyncState"

#define PROPERTY_PAGE_SIZE @"pageSize"

#define PROPERTY_POLL_INTERVAL @"pollInterval"

#define PROPERTY_SHOW_STATUS_POPUP @"showStatusPopup"

#define PROPERTY_SSL_VERIFY_PEER @"sslVerifyPeer"

#define PROPERTY_SYNC_SERVER @"syncServer"

#define PROPERTY_THREADED_MODE @"threadedMode"

#define PROPERTY_USER_NAME @"userName"


@protocol IRhoConnectClient <NSObject>



// NOTE: if you want to hold methodResult(for example periodically call callbacks) you should release it manually when you stop using it!
@end


@protocol IRhoConnectClientSingleton <NSObject>




/* getter for "userName" property */
-(void) getUserName:(id<IMethodResult>)methodResult;

/* getter for "pollInterval" property */
-(void) getPollInterval:(id<IMethodResult>)methodResult;

/* setter for "pollInterval" property */
-(void) setPollInterval:(int)pollInterval methodResult:(id<IMethodResult>)methodResult;

/* getter for "syncServer" property */
-(void) getSyncServer:(id<IMethodResult>)methodResult;

/* setter for "syncServer" property */
-(void) setSyncServer:(NSString*)syncServer methodResult:(id<IMethodResult>)methodResult;

/* getter for "bulksyncState" property */
-(void) getBulksyncState:(id<IMethodResult>)methodResult;

/* setter for "bulksyncState" property */
-(void) setBulksyncState:(int)bulksyncState methodResult:(id<IMethodResult>)methodResult;

/* getter for "pageSize" property */
-(void) getPageSize:(id<IMethodResult>)methodResult;

/* setter for "pageSize" property */
-(void) setPageSize:(int)pageSize methodResult:(id<IMethodResult>)methodResult;

/* getter for "threadedMode" property */
-(void) getThreadedMode:(id<IMethodResult>)methodResult;

/* setter for "threadedMode" property */
-(void) setThreadedMode:(BOOL)threadedMode methodResult:(id<IMethodResult>)methodResult;

/* getter for "showStatusPopup" property */
-(void) getShowStatusPopup:(id<IMethodResult>)methodResult;

/* setter for "showStatusPopup" property */
-(void) setShowStatusPopup:(BOOL)showStatusPopup methodResult:(id<IMethodResult>)methodResult;

/* getter for "sslVerifyPeer" property */
-(void) getSslVerifyPeer:(id<IMethodResult>)methodResult;

/* setter for "sslVerifyPeer" property */
-(void) setSslVerifyPeer:(BOOL)sslVerifyPeer methodResult:(id<IMethodResult>)methodResult;

/* Returns true if the RhoConnectClient currently has a user session, false if not. */
-(void) isLoggedIn:(id<IMethodResult>)methodResult;

/* Returns true if sync is currently in progress. */
-(void) isSyncing:(id<IMethodResult>)methodResult;

/* If you have a large dataset in your backend service, you don't have to synchronize everything with the RhoConnectClient. Instead you can filter the synchronized dataset using the RhoConnectClient's search function. Provide callback, which will be executed after search is completed. */
-(void) search:(NSDictionary*)args methodResult:(id<IMethodResult>)methodResult;

/* Start the RhoConnectClient sync process. */
-(void) doSync:(BOOL)showStatusPopup queryParams:(NSString*)queryParams syncOnlyChangedSources:(BOOL)syncOnlyChangedSources methodResult:(id<IMethodResult>)methodResult;

/* Start RhoConnectClient sync process for a given source name. */
-(void) doSyncSource:(NSString*)sourceName showStatusPopup:(BOOL)showStatusPopup queryParams:(NSString*)queryParams methodResult:(id<IMethodResult>)methodResult;

/* Authenticates the user with RhoConnect. The callback will be executed when it is finished. */
-(void) login:(NSString*)login password:(NSString*)password methodResult:(id<IMethodResult>)methodResult;

/* Logout the user from the RhoConnect server. This removes the local user session. */
-(void) logout:(id<IMethodResult>)methodResult;

/* Stops any sync operations currently in progress. */
-(void) stopSync:(id<IMethodResult>)methodResult;

/* The RhoConnectClient system uses notifications to provide information about the sync process to a Rhodes application. Notifications can be setup once for the duration of runtime or each time a sync is triggered. Once a sync is processing for a model, notifications are called with parameters containing sync process state. Your application can use this information to display different wait pages, progress bars, etc. setNotification will set notification for a model. */
-(void) setNotification:(NSString*)sourceName methodResult:(id<IMethodResult>)methodResult;

/* Clears the sync notification for a given source. */
-(void) clearNotification:(NSString*)sourceName methodResult:(id<IMethodResult>)methodResult;

/* The RhoConnectClient can send a notification when a specific object on the current page has been modified. This is useful if you have frequently-changing data like feeds or timelines in your application and want them to update without the user taking any action. */
-(void) setObjectNotification:(id<IMethodResult>)methodResult;

/* Add the object notification by passing in an object ID. */
-(void) addObjectNotify:(NSString*)sourceName object:(NSString*)object methodResult:(id<IMethodResult>)methodResult;

/* Removes callback for object notifications. */
-(void) cleanObjectNotify:(id<IMethodResult>)methodResult;

/* Returns number of synced objects for a given source. */
-(void) getLastSyncObjectCount:(NSString*)sourceName methodResult:(id<IMethodResult>)methodResult;

/* Sets property value for a given source. */
-(void) setSourceProperty:(NSString*)sourceName propertyName:(NSString*)propertyName propertyValue:(NSString*)propertyValue methodResult:(id<IMethodResult>)methodResult;

/* Gets property value for a given source. */
-(void) getSourceProperty:(NSString*)sourceName propertyName:(NSString*)propertyName methodResult:(id<IMethodResult>)methodResult;


@end


@protocol IRhoConnectClientFactory <NSObject>
-(id<IRhoConnectClientSingleton>) getRhoConnectClientSingleton;
-(id<IRhoConnectClient>) getRhoConnectClientByID:(NSString*)ID;
-(void) destroyObjectByID:(NSString*)ID;
-(NSArray*) enumerateRhoConnectClientInstances;
@end


@interface RhoConnectClientFactorySingleton : NSObject {
}
+(id<IRhoConnectClientFactory>) getRhoConnectClientFactoryInstance;
@end


