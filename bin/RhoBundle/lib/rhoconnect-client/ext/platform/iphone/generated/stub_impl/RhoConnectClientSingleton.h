
#import "IRhoConnectClient.h"
#import "RhoConnectClientSingletonBase.h"

@interface RhoConnectClientSingleton : RhoConnectClientSingletonBase<IRhoConnectClientSingleton> {
}



-(void) getUserName:(id<IMethodResult>)methodResult;
-(void) getPollInterval:(id<IMethodResult>)methodResult;
-(void) setPollInterval:(int)pollInterval methodResult:(id<IMethodResult>)methodResult;
-(void) getSyncServer:(id<IMethodResult>)methodResult;
-(void) setSyncServer:(NSString*)syncServer methodResult:(id<IMethodResult>)methodResult;
-(void) getBulksyncState:(id<IMethodResult>)methodResult;
-(void) setBulksyncState:(int)bulksyncState methodResult:(id<IMethodResult>)methodResult;
-(void) getPageSize:(id<IMethodResult>)methodResult;
-(void) setPageSize:(int)pageSize methodResult:(id<IMethodResult>)methodResult;
-(void) getThreadedMode:(id<IMethodResult>)methodResult;
-(void) setThreadedMode:(BOOL)threadedMode methodResult:(id<IMethodResult>)methodResult;
-(void) getShowStatusPopup:(id<IMethodResult>)methodResult;
-(void) setShowStatusPopup:(BOOL)showStatusPopup methodResult:(id<IMethodResult>)methodResult;
-(void) getSslVerifyPeer:(id<IMethodResult>)methodResult;
-(void) setSslVerifyPeer:(BOOL)sslVerifyPeer methodResult:(id<IMethodResult>)methodResult;
-(void) isLoggedIn:(id<IMethodResult>)methodResult;
-(void) isSyncing:(id<IMethodResult>)methodResult;
-(void) search:(NSDictionary*)args methodResult:(id<IMethodResult>)methodResult;
-(void) doSync:(BOOL)showStatusPopup queryParams:(NSString*)queryParams syncOnlyChangedSources:(BOOL)syncOnlyChangedSources methodResult:(id<IMethodResult>)methodResult;
-(void) doSyncSource:(NSString*)sourceName showStatusPopup:(BOOL)showStatusPopup queryParams:(NSString*)queryParams methodResult:(id<IMethodResult>)methodResult;
-(void) login:(NSString*)login password:(NSString*)password methodResult:(id<IMethodResult>)methodResult;
-(void) logout:(id<IMethodResult>)methodResult;
-(void) stopSync:(id<IMethodResult>)methodResult;
-(void) setNotification:(NSString*)sourceName methodResult:(id<IMethodResult>)methodResult;
-(void) clearNotification:(NSString*)sourceName methodResult:(id<IMethodResult>)methodResult;
-(void) setObjectNotification:(id<IMethodResult>)methodResult;
-(void) addObjectNotify:(NSString*)sourceName object:(NSString*)object methodResult:(id<IMethodResult>)methodResult;
-(void) cleanObjectNotify:(id<IMethodResult>)methodResult;
-(void) getLastSyncObjectCount:(NSString*)sourceName methodResult:(id<IMethodResult>)methodResult;
-(void) setSourceProperty:(NSString*)sourceName propertyName:(NSString*)propertyName propertyValue:(NSString*)propertyValue methodResult:(id<IMethodResult>)methodResult;
-(void) getSourceProperty:(NSString*)sourceName propertyName:(NSString*)propertyName methodResult:(id<IMethodResult>)methodResult;




@end