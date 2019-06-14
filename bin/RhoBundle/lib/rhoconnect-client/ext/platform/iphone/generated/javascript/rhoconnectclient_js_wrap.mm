
#import "IRhoConnectClient.h"
//#import "api_generator/common/ruby_helpers.h"

#include "api_generator/js_helpers.h"

#import "api_generator/iphone/CMethodResult.h"
#import "api_generator/iphone/CJSConverter.h"

extern VALUE getRuby_RhoConnectClient_Module();



id<IRhoConnectClient> RhoConnectClient_makeInstanceByJSObject(rho::String sid) {
    const char* szID = sid.c_str();
    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    return [factory getRhoConnectClientByID:[NSString stringWithUTF8String:szID]];
}









@interface RhoConnectClient_getUserName_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getUserName_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getUserName_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getUserName_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getUserName_caller_params* par = [[[RhoConnectClient_getUserName_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getUserName_caller : NSObject {

}
+(RhoConnectClient_getUserName_caller*) getSharedInstance;
+(void) getUserName:(RhoConnectClient_getUserName_caller_params*)caller_params;
+(void) getUserName_in_thread:(RhoConnectClient_getUserName_caller_params*)caller_params;
+(void) getUserName_in_UI_thread:(RhoConnectClient_getUserName_caller_params*)caller_params;

@end

static RhoConnectClient_getUserName_caller* our_RhoConnectClient_getUserName_caller = nil;

@implementation RhoConnectClient_getUserName_caller

+(RhoConnectClient_getUserName_caller*) getSharedInstance {
    if (our_RhoConnectClient_getUserName_caller == nil) {
        our_RhoConnectClient_getUserName_caller = [[RhoConnectClient_getUserName_caller alloc] init];
    }
    return our_RhoConnectClient_getUserName_caller;
}

-(void) command_getUserName:(RhoConnectClient_getUserName_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getUserName:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getUserName:(RhoConnectClient_getUserName_caller_params*)caller_params {
    [[RhoConnectClient_getUserName_caller getSharedInstance] command_getUserName:caller_params];
}

+(void) getUserName_in_thread:(RhoConnectClient_getUserName_caller_params*)caller_params {
    [[RhoConnectClient_getUserName_caller getSharedInstance] performSelectorInBackground:@selector(command_getUserName:) withObject:caller_params];
}

+(void) getUserName_in_UI_thread:(RhoConnectClient_getUserName_caller_params*)caller_params {
    [[RhoConnectClient_getUserName_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getUserName:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getUserName_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::userName"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getUserName parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getUserName_caller getUserName_in_thread:[RhoConnectClient_getUserName_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getUserName_caller getUserName:[RhoConnectClient_getUserName_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getUserName(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getUserName_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getPollInterval_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getPollInterval_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getPollInterval_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getPollInterval_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getPollInterval_caller_params* par = [[[RhoConnectClient_getPollInterval_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getPollInterval_caller : NSObject {

}
+(RhoConnectClient_getPollInterval_caller*) getSharedInstance;
+(void) getPollInterval:(RhoConnectClient_getPollInterval_caller_params*)caller_params;
+(void) getPollInterval_in_thread:(RhoConnectClient_getPollInterval_caller_params*)caller_params;
+(void) getPollInterval_in_UI_thread:(RhoConnectClient_getPollInterval_caller_params*)caller_params;

@end

static RhoConnectClient_getPollInterval_caller* our_RhoConnectClient_getPollInterval_caller = nil;

@implementation RhoConnectClient_getPollInterval_caller

+(RhoConnectClient_getPollInterval_caller*) getSharedInstance {
    if (our_RhoConnectClient_getPollInterval_caller == nil) {
        our_RhoConnectClient_getPollInterval_caller = [[RhoConnectClient_getPollInterval_caller alloc] init];
    }
    return our_RhoConnectClient_getPollInterval_caller;
}

-(void) command_getPollInterval:(RhoConnectClient_getPollInterval_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getPollInterval:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getPollInterval:(RhoConnectClient_getPollInterval_caller_params*)caller_params {
    [[RhoConnectClient_getPollInterval_caller getSharedInstance] command_getPollInterval:caller_params];
}

+(void) getPollInterval_in_thread:(RhoConnectClient_getPollInterval_caller_params*)caller_params {
    [[RhoConnectClient_getPollInterval_caller getSharedInstance] performSelectorInBackground:@selector(command_getPollInterval:) withObject:caller_params];
}

+(void) getPollInterval_in_UI_thread:(RhoConnectClient_getPollInterval_caller_params*)caller_params {
    [[RhoConnectClient_getPollInterval_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getPollInterval:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getPollInterval_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::pollInterval"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getPollInterval parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getPollInterval_caller getPollInterval_in_thread:[RhoConnectClient_getPollInterval_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getPollInterval_caller getPollInterval:[RhoConnectClient_getPollInterval_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getPollInterval_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setPollInterval_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setPollInterval_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setPollInterval_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setPollInterval_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setPollInterval_caller_params* par = [[[RhoConnectClient_setPollInterval_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setPollInterval_caller : NSObject {

}
+(RhoConnectClient_setPollInterval_caller*) getSharedInstance;
+(void) setPollInterval:(RhoConnectClient_setPollInterval_caller_params*)caller_params;
+(void) setPollInterval_in_thread:(RhoConnectClient_setPollInterval_caller_params*)caller_params;
+(void) setPollInterval_in_UI_thread:(RhoConnectClient_setPollInterval_caller_params*)caller_params;

@end

static RhoConnectClient_setPollInterval_caller* our_RhoConnectClient_setPollInterval_caller = nil;

@implementation RhoConnectClient_setPollInterval_caller

+(RhoConnectClient_setPollInterval_caller*) getSharedInstance {
    if (our_RhoConnectClient_setPollInterval_caller == nil) {
        our_RhoConnectClient_setPollInterval_caller = [[RhoConnectClient_setPollInterval_caller alloc] init];
    }
    return our_RhoConnectClient_setPollInterval_caller;
}

-(void) command_setPollInterval:(RhoConnectClient_setPollInterval_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setPollInterval:(int)[((NSNumber*)[params objectAtIndex:0]) intValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setPollInterval:(RhoConnectClient_setPollInterval_caller_params*)caller_params {
    [[RhoConnectClient_setPollInterval_caller getSharedInstance] command_setPollInterval:caller_params];
}

+(void) setPollInterval_in_thread:(RhoConnectClient_setPollInterval_caller_params*)caller_params {
    [[RhoConnectClient_setPollInterval_caller getSharedInstance] performSelectorInBackground:@selector(command_setPollInterval:) withObject:caller_params];
}

+(void) setPollInterval_in_UI_thread:(RhoConnectClient_setPollInterval_caller_params*)caller_params {
    [[RhoConnectClient_setPollInterval_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setPollInterval:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setPollInterval_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::pollInterval="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_INTEGER, 0, "pollInterval", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    
                params[0]= [NSNumber numberWithInt:60];

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setPollInterval parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setPollInterval_caller setPollInterval_in_thread:[RhoConnectClient_setPollInterval_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setPollInterval_caller setPollInterval:[RhoConnectClient_setPollInterval_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setPollInterval(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setPollInterval_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getSyncServer_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getSyncServer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getSyncServer_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getSyncServer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getSyncServer_caller_params* par = [[[RhoConnectClient_getSyncServer_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getSyncServer_caller : NSObject {

}
+(RhoConnectClient_getSyncServer_caller*) getSharedInstance;
+(void) getSyncServer:(RhoConnectClient_getSyncServer_caller_params*)caller_params;
+(void) getSyncServer_in_thread:(RhoConnectClient_getSyncServer_caller_params*)caller_params;
+(void) getSyncServer_in_UI_thread:(RhoConnectClient_getSyncServer_caller_params*)caller_params;

@end

static RhoConnectClient_getSyncServer_caller* our_RhoConnectClient_getSyncServer_caller = nil;

@implementation RhoConnectClient_getSyncServer_caller

+(RhoConnectClient_getSyncServer_caller*) getSharedInstance {
    if (our_RhoConnectClient_getSyncServer_caller == nil) {
        our_RhoConnectClient_getSyncServer_caller = [[RhoConnectClient_getSyncServer_caller alloc] init];
    }
    return our_RhoConnectClient_getSyncServer_caller;
}

-(void) command_getSyncServer:(RhoConnectClient_getSyncServer_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSyncServer:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getSyncServer:(RhoConnectClient_getSyncServer_caller_params*)caller_params {
    [[RhoConnectClient_getSyncServer_caller getSharedInstance] command_getSyncServer:caller_params];
}

+(void) getSyncServer_in_thread:(RhoConnectClient_getSyncServer_caller_params*)caller_params {
    [[RhoConnectClient_getSyncServer_caller getSharedInstance] performSelectorInBackground:@selector(command_getSyncServer:) withObject:caller_params];
}

+(void) getSyncServer_in_UI_thread:(RhoConnectClient_getSyncServer_caller_params*)caller_params {
    [[RhoConnectClient_getSyncServer_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSyncServer:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getSyncServer_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::syncServer"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getSyncServer parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getSyncServer_caller getSyncServer_in_thread:[RhoConnectClient_getSyncServer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getSyncServer_caller getSyncServer:[RhoConnectClient_getSyncServer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getSyncServer_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setSyncServer_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setSyncServer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setSyncServer_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setSyncServer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setSyncServer_caller_params* par = [[[RhoConnectClient_setSyncServer_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setSyncServer_caller : NSObject {

}
+(RhoConnectClient_setSyncServer_caller*) getSharedInstance;
+(void) setSyncServer:(RhoConnectClient_setSyncServer_caller_params*)caller_params;
+(void) setSyncServer_in_thread:(RhoConnectClient_setSyncServer_caller_params*)caller_params;
+(void) setSyncServer_in_UI_thread:(RhoConnectClient_setSyncServer_caller_params*)caller_params;

@end

static RhoConnectClient_setSyncServer_caller* our_RhoConnectClient_setSyncServer_caller = nil;

@implementation RhoConnectClient_setSyncServer_caller

+(RhoConnectClient_setSyncServer_caller*) getSharedInstance {
    if (our_RhoConnectClient_setSyncServer_caller == nil) {
        our_RhoConnectClient_setSyncServer_caller = [[RhoConnectClient_setSyncServer_caller alloc] init];
    }
    return our_RhoConnectClient_setSyncServer_caller;
}

-(void) command_setSyncServer:(RhoConnectClient_setSyncServer_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setSyncServer:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setSyncServer:(RhoConnectClient_setSyncServer_caller_params*)caller_params {
    [[RhoConnectClient_setSyncServer_caller getSharedInstance] command_setSyncServer:caller_params];
}

+(void) setSyncServer_in_thread:(RhoConnectClient_setSyncServer_caller_params*)caller_params {
    [[RhoConnectClient_setSyncServer_caller getSharedInstance] performSelectorInBackground:@selector(command_setSyncServer:) withObject:caller_params];
}

+(void) setSyncServer_in_UI_thread:(RhoConnectClient_setSyncServer_caller_params*)caller_params {
    [[RhoConnectClient_setSyncServer_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setSyncServer:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setSyncServer_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::syncServer="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "syncServer", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setSyncServer parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setSyncServer_caller setSyncServer_in_thread:[RhoConnectClient_setSyncServer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setSyncServer_caller setSyncServer:[RhoConnectClient_setSyncServer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setSyncServer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setSyncServer_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getBulksyncState_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getBulksyncState_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getBulksyncState_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getBulksyncState_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getBulksyncState_caller_params* par = [[[RhoConnectClient_getBulksyncState_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getBulksyncState_caller : NSObject {

}
+(RhoConnectClient_getBulksyncState_caller*) getSharedInstance;
+(void) getBulksyncState:(RhoConnectClient_getBulksyncState_caller_params*)caller_params;
+(void) getBulksyncState_in_thread:(RhoConnectClient_getBulksyncState_caller_params*)caller_params;
+(void) getBulksyncState_in_UI_thread:(RhoConnectClient_getBulksyncState_caller_params*)caller_params;

@end

static RhoConnectClient_getBulksyncState_caller* our_RhoConnectClient_getBulksyncState_caller = nil;

@implementation RhoConnectClient_getBulksyncState_caller

+(RhoConnectClient_getBulksyncState_caller*) getSharedInstance {
    if (our_RhoConnectClient_getBulksyncState_caller == nil) {
        our_RhoConnectClient_getBulksyncState_caller = [[RhoConnectClient_getBulksyncState_caller alloc] init];
    }
    return our_RhoConnectClient_getBulksyncState_caller;
}

-(void) command_getBulksyncState:(RhoConnectClient_getBulksyncState_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getBulksyncState:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getBulksyncState:(RhoConnectClient_getBulksyncState_caller_params*)caller_params {
    [[RhoConnectClient_getBulksyncState_caller getSharedInstance] command_getBulksyncState:caller_params];
}

+(void) getBulksyncState_in_thread:(RhoConnectClient_getBulksyncState_caller_params*)caller_params {
    [[RhoConnectClient_getBulksyncState_caller getSharedInstance] performSelectorInBackground:@selector(command_getBulksyncState:) withObject:caller_params];
}

+(void) getBulksyncState_in_UI_thread:(RhoConnectClient_getBulksyncState_caller_params*)caller_params {
    [[RhoConnectClient_getBulksyncState_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getBulksyncState:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getBulksyncState_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::bulksyncState"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getBulksyncState parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getBulksyncState_caller getBulksyncState_in_thread:[RhoConnectClient_getBulksyncState_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getBulksyncState_caller getBulksyncState:[RhoConnectClient_getBulksyncState_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getBulksyncState_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setBulksyncState_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setBulksyncState_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setBulksyncState_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setBulksyncState_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setBulksyncState_caller_params* par = [[[RhoConnectClient_setBulksyncState_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setBulksyncState_caller : NSObject {

}
+(RhoConnectClient_setBulksyncState_caller*) getSharedInstance;
+(void) setBulksyncState:(RhoConnectClient_setBulksyncState_caller_params*)caller_params;
+(void) setBulksyncState_in_thread:(RhoConnectClient_setBulksyncState_caller_params*)caller_params;
+(void) setBulksyncState_in_UI_thread:(RhoConnectClient_setBulksyncState_caller_params*)caller_params;

@end

static RhoConnectClient_setBulksyncState_caller* our_RhoConnectClient_setBulksyncState_caller = nil;

@implementation RhoConnectClient_setBulksyncState_caller

+(RhoConnectClient_setBulksyncState_caller*) getSharedInstance {
    if (our_RhoConnectClient_setBulksyncState_caller == nil) {
        our_RhoConnectClient_setBulksyncState_caller = [[RhoConnectClient_setBulksyncState_caller alloc] init];
    }
    return our_RhoConnectClient_setBulksyncState_caller;
}

-(void) command_setBulksyncState:(RhoConnectClient_setBulksyncState_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setBulksyncState:(int)[((NSNumber*)[params objectAtIndex:0]) intValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setBulksyncState:(RhoConnectClient_setBulksyncState_caller_params*)caller_params {
    [[RhoConnectClient_setBulksyncState_caller getSharedInstance] command_setBulksyncState:caller_params];
}

+(void) setBulksyncState_in_thread:(RhoConnectClient_setBulksyncState_caller_params*)caller_params {
    [[RhoConnectClient_setBulksyncState_caller getSharedInstance] performSelectorInBackground:@selector(command_setBulksyncState:) withObject:caller_params];
}

+(void) setBulksyncState_in_UI_thread:(RhoConnectClient_setBulksyncState_caller_params*)caller_params {
    [[RhoConnectClient_setBulksyncState_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setBulksyncState:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setBulksyncState_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::bulksyncState="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_INTEGER, 0, "bulksyncState", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    
                params[0]= [NSNumber numberWithInt:1];

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setBulksyncState parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setBulksyncState_caller setBulksyncState_in_thread:[RhoConnectClient_setBulksyncState_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setBulksyncState_caller setBulksyncState:[RhoConnectClient_setBulksyncState_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setBulksyncState(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setBulksyncState_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getPageSize_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getPageSize_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getPageSize_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getPageSize_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getPageSize_caller_params* par = [[[RhoConnectClient_getPageSize_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getPageSize_caller : NSObject {

}
+(RhoConnectClient_getPageSize_caller*) getSharedInstance;
+(void) getPageSize:(RhoConnectClient_getPageSize_caller_params*)caller_params;
+(void) getPageSize_in_thread:(RhoConnectClient_getPageSize_caller_params*)caller_params;
+(void) getPageSize_in_UI_thread:(RhoConnectClient_getPageSize_caller_params*)caller_params;

@end

static RhoConnectClient_getPageSize_caller* our_RhoConnectClient_getPageSize_caller = nil;

@implementation RhoConnectClient_getPageSize_caller

+(RhoConnectClient_getPageSize_caller*) getSharedInstance {
    if (our_RhoConnectClient_getPageSize_caller == nil) {
        our_RhoConnectClient_getPageSize_caller = [[RhoConnectClient_getPageSize_caller alloc] init];
    }
    return our_RhoConnectClient_getPageSize_caller;
}

-(void) command_getPageSize:(RhoConnectClient_getPageSize_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getPageSize:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getPageSize:(RhoConnectClient_getPageSize_caller_params*)caller_params {
    [[RhoConnectClient_getPageSize_caller getSharedInstance] command_getPageSize:caller_params];
}

+(void) getPageSize_in_thread:(RhoConnectClient_getPageSize_caller_params*)caller_params {
    [[RhoConnectClient_getPageSize_caller getSharedInstance] performSelectorInBackground:@selector(command_getPageSize:) withObject:caller_params];
}

+(void) getPageSize_in_UI_thread:(RhoConnectClient_getPageSize_caller_params*)caller_params {
    [[RhoConnectClient_getPageSize_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getPageSize:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getPageSize_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::pageSize"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getPageSize parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getPageSize_caller getPageSize_in_thread:[RhoConnectClient_getPageSize_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getPageSize_caller getPageSize:[RhoConnectClient_getPageSize_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getPageSize_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setPageSize_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setPageSize_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setPageSize_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setPageSize_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setPageSize_caller_params* par = [[[RhoConnectClient_setPageSize_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setPageSize_caller : NSObject {

}
+(RhoConnectClient_setPageSize_caller*) getSharedInstance;
+(void) setPageSize:(RhoConnectClient_setPageSize_caller_params*)caller_params;
+(void) setPageSize_in_thread:(RhoConnectClient_setPageSize_caller_params*)caller_params;
+(void) setPageSize_in_UI_thread:(RhoConnectClient_setPageSize_caller_params*)caller_params;

@end

static RhoConnectClient_setPageSize_caller* our_RhoConnectClient_setPageSize_caller = nil;

@implementation RhoConnectClient_setPageSize_caller

+(RhoConnectClient_setPageSize_caller*) getSharedInstance {
    if (our_RhoConnectClient_setPageSize_caller == nil) {
        our_RhoConnectClient_setPageSize_caller = [[RhoConnectClient_setPageSize_caller alloc] init];
    }
    return our_RhoConnectClient_setPageSize_caller;
}

-(void) command_setPageSize:(RhoConnectClient_setPageSize_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setPageSize:(int)[((NSNumber*)[params objectAtIndex:0]) intValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setPageSize:(RhoConnectClient_setPageSize_caller_params*)caller_params {
    [[RhoConnectClient_setPageSize_caller getSharedInstance] command_setPageSize:caller_params];
}

+(void) setPageSize_in_thread:(RhoConnectClient_setPageSize_caller_params*)caller_params {
    [[RhoConnectClient_setPageSize_caller getSharedInstance] performSelectorInBackground:@selector(command_setPageSize:) withObject:caller_params];
}

+(void) setPageSize_in_UI_thread:(RhoConnectClient_setPageSize_caller_params*)caller_params {
    [[RhoConnectClient_setPageSize_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setPageSize:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setPageSize_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::pageSize="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_INTEGER, 0, "pageSize", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setPageSize parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setPageSize_caller setPageSize_in_thread:[RhoConnectClient_setPageSize_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setPageSize_caller setPageSize:[RhoConnectClient_setPageSize_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setPageSize(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setPageSize_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getThreadedMode_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getThreadedMode_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getThreadedMode_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getThreadedMode_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getThreadedMode_caller_params* par = [[[RhoConnectClient_getThreadedMode_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getThreadedMode_caller : NSObject {

}
+(RhoConnectClient_getThreadedMode_caller*) getSharedInstance;
+(void) getThreadedMode:(RhoConnectClient_getThreadedMode_caller_params*)caller_params;
+(void) getThreadedMode_in_thread:(RhoConnectClient_getThreadedMode_caller_params*)caller_params;
+(void) getThreadedMode_in_UI_thread:(RhoConnectClient_getThreadedMode_caller_params*)caller_params;

@end

static RhoConnectClient_getThreadedMode_caller* our_RhoConnectClient_getThreadedMode_caller = nil;

@implementation RhoConnectClient_getThreadedMode_caller

+(RhoConnectClient_getThreadedMode_caller*) getSharedInstance {
    if (our_RhoConnectClient_getThreadedMode_caller == nil) {
        our_RhoConnectClient_getThreadedMode_caller = [[RhoConnectClient_getThreadedMode_caller alloc] init];
    }
    return our_RhoConnectClient_getThreadedMode_caller;
}

-(void) command_getThreadedMode:(RhoConnectClient_getThreadedMode_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getThreadedMode:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getThreadedMode:(RhoConnectClient_getThreadedMode_caller_params*)caller_params {
    [[RhoConnectClient_getThreadedMode_caller getSharedInstance] command_getThreadedMode:caller_params];
}

+(void) getThreadedMode_in_thread:(RhoConnectClient_getThreadedMode_caller_params*)caller_params {
    [[RhoConnectClient_getThreadedMode_caller getSharedInstance] performSelectorInBackground:@selector(command_getThreadedMode:) withObject:caller_params];
}

+(void) getThreadedMode_in_UI_thread:(RhoConnectClient_getThreadedMode_caller_params*)caller_params {
    [[RhoConnectClient_getThreadedMode_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getThreadedMode:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getThreadedMode_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::threadedMode"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getThreadedMode parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getThreadedMode_caller getThreadedMode_in_thread:[RhoConnectClient_getThreadedMode_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getThreadedMode_caller getThreadedMode:[RhoConnectClient_getThreadedMode_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getThreadedMode_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setThreadedMode_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setThreadedMode_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setThreadedMode_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setThreadedMode_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setThreadedMode_caller_params* par = [[[RhoConnectClient_setThreadedMode_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setThreadedMode_caller : NSObject {

}
+(RhoConnectClient_setThreadedMode_caller*) getSharedInstance;
+(void) setThreadedMode:(RhoConnectClient_setThreadedMode_caller_params*)caller_params;
+(void) setThreadedMode_in_thread:(RhoConnectClient_setThreadedMode_caller_params*)caller_params;
+(void) setThreadedMode_in_UI_thread:(RhoConnectClient_setThreadedMode_caller_params*)caller_params;

@end

static RhoConnectClient_setThreadedMode_caller* our_RhoConnectClient_setThreadedMode_caller = nil;

@implementation RhoConnectClient_setThreadedMode_caller

+(RhoConnectClient_setThreadedMode_caller*) getSharedInstance {
    if (our_RhoConnectClient_setThreadedMode_caller == nil) {
        our_RhoConnectClient_setThreadedMode_caller = [[RhoConnectClient_setThreadedMode_caller alloc] init];
    }
    return our_RhoConnectClient_setThreadedMode_caller;
}

-(void) command_setThreadedMode:(RhoConnectClient_setThreadedMode_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setThreadedMode:(BOOL)[((NSNumber*)[params objectAtIndex:0]) boolValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setThreadedMode:(RhoConnectClient_setThreadedMode_caller_params*)caller_params {
    [[RhoConnectClient_setThreadedMode_caller getSharedInstance] command_setThreadedMode:caller_params];
}

+(void) setThreadedMode_in_thread:(RhoConnectClient_setThreadedMode_caller_params*)caller_params {
    [[RhoConnectClient_setThreadedMode_caller getSharedInstance] performSelectorInBackground:@selector(command_setThreadedMode:) withObject:caller_params];
}

+(void) setThreadedMode_in_UI_thread:(RhoConnectClient_setThreadedMode_caller_params*)caller_params {
    [[RhoConnectClient_setThreadedMode_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setThreadedMode:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setThreadedMode_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::threadedMode="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_BOOLEAN, 0, "threadedMode", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    
                params[0]= [NSNumber numberWithBool:YES];

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setThreadedMode parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setThreadedMode_caller setThreadedMode_in_thread:[RhoConnectClient_setThreadedMode_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setThreadedMode_caller setThreadedMode:[RhoConnectClient_setThreadedMode_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setThreadedMode(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setThreadedMode_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getShowStatusPopup_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getShowStatusPopup_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getShowStatusPopup_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getShowStatusPopup_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getShowStatusPopup_caller_params* par = [[[RhoConnectClient_getShowStatusPopup_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getShowStatusPopup_caller : NSObject {

}
+(RhoConnectClient_getShowStatusPopup_caller*) getSharedInstance;
+(void) getShowStatusPopup:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params;
+(void) getShowStatusPopup_in_thread:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params;
+(void) getShowStatusPopup_in_UI_thread:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params;

@end

static RhoConnectClient_getShowStatusPopup_caller* our_RhoConnectClient_getShowStatusPopup_caller = nil;

@implementation RhoConnectClient_getShowStatusPopup_caller

+(RhoConnectClient_getShowStatusPopup_caller*) getSharedInstance {
    if (our_RhoConnectClient_getShowStatusPopup_caller == nil) {
        our_RhoConnectClient_getShowStatusPopup_caller = [[RhoConnectClient_getShowStatusPopup_caller alloc] init];
    }
    return our_RhoConnectClient_getShowStatusPopup_caller;
}

-(void) command_getShowStatusPopup:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getShowStatusPopup:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getShowStatusPopup:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params {
    [[RhoConnectClient_getShowStatusPopup_caller getSharedInstance] command_getShowStatusPopup:caller_params];
}

+(void) getShowStatusPopup_in_thread:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params {
    [[RhoConnectClient_getShowStatusPopup_caller getSharedInstance] performSelectorInBackground:@selector(command_getShowStatusPopup:) withObject:caller_params];
}

+(void) getShowStatusPopup_in_UI_thread:(RhoConnectClient_getShowStatusPopup_caller_params*)caller_params {
    [[RhoConnectClient_getShowStatusPopup_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getShowStatusPopup:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getShowStatusPopup_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::showStatusPopup"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getShowStatusPopup parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getShowStatusPopup_caller getShowStatusPopup_in_thread:[RhoConnectClient_getShowStatusPopup_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getShowStatusPopup_caller getShowStatusPopup:[RhoConnectClient_getShowStatusPopup_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getShowStatusPopup_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setShowStatusPopup_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setShowStatusPopup_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setShowStatusPopup_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setShowStatusPopup_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setShowStatusPopup_caller_params* par = [[[RhoConnectClient_setShowStatusPopup_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setShowStatusPopup_caller : NSObject {

}
+(RhoConnectClient_setShowStatusPopup_caller*) getSharedInstance;
+(void) setShowStatusPopup:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params;
+(void) setShowStatusPopup_in_thread:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params;
+(void) setShowStatusPopup_in_UI_thread:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params;

@end

static RhoConnectClient_setShowStatusPopup_caller* our_RhoConnectClient_setShowStatusPopup_caller = nil;

@implementation RhoConnectClient_setShowStatusPopup_caller

+(RhoConnectClient_setShowStatusPopup_caller*) getSharedInstance {
    if (our_RhoConnectClient_setShowStatusPopup_caller == nil) {
        our_RhoConnectClient_setShowStatusPopup_caller = [[RhoConnectClient_setShowStatusPopup_caller alloc] init];
    }
    return our_RhoConnectClient_setShowStatusPopup_caller;
}

-(void) command_setShowStatusPopup:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setShowStatusPopup:(BOOL)[((NSNumber*)[params objectAtIndex:0]) boolValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setShowStatusPopup:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params {
    [[RhoConnectClient_setShowStatusPopup_caller getSharedInstance] command_setShowStatusPopup:caller_params];
}

+(void) setShowStatusPopup_in_thread:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params {
    [[RhoConnectClient_setShowStatusPopup_caller getSharedInstance] performSelectorInBackground:@selector(command_setShowStatusPopup:) withObject:caller_params];
}

+(void) setShowStatusPopup_in_UI_thread:(RhoConnectClient_setShowStatusPopup_caller_params*)caller_params {
    [[RhoConnectClient_setShowStatusPopup_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setShowStatusPopup:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setShowStatusPopup_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::showStatusPopup="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_BOOLEAN, 0, "showStatusPopup", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    
                params[0]= [NSNumber numberWithBool:YES];

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setShowStatusPopup parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setShowStatusPopup_caller setShowStatusPopup_in_thread:[RhoConnectClient_setShowStatusPopup_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setShowStatusPopup_caller setShowStatusPopup:[RhoConnectClient_setShowStatusPopup_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setShowStatusPopup(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setShowStatusPopup_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getSslVerifyPeer_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getSslVerifyPeer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getSslVerifyPeer_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getSslVerifyPeer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getSslVerifyPeer_caller_params* par = [[[RhoConnectClient_getSslVerifyPeer_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getSslVerifyPeer_caller : NSObject {

}
+(RhoConnectClient_getSslVerifyPeer_caller*) getSharedInstance;
+(void) getSslVerifyPeer:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params;
+(void) getSslVerifyPeer_in_thread:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params;
+(void) getSslVerifyPeer_in_UI_thread:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params;

@end

static RhoConnectClient_getSslVerifyPeer_caller* our_RhoConnectClient_getSslVerifyPeer_caller = nil;

@implementation RhoConnectClient_getSslVerifyPeer_caller

+(RhoConnectClient_getSslVerifyPeer_caller*) getSharedInstance {
    if (our_RhoConnectClient_getSslVerifyPeer_caller == nil) {
        our_RhoConnectClient_getSslVerifyPeer_caller = [[RhoConnectClient_getSslVerifyPeer_caller alloc] init];
    }
    return our_RhoConnectClient_getSslVerifyPeer_caller;
}

-(void) command_getSslVerifyPeer:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSslVerifyPeer:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getSslVerifyPeer:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params {
    [[RhoConnectClient_getSslVerifyPeer_caller getSharedInstance] command_getSslVerifyPeer:caller_params];
}

+(void) getSslVerifyPeer_in_thread:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params {
    [[RhoConnectClient_getSslVerifyPeer_caller getSharedInstance] performSelectorInBackground:@selector(command_getSslVerifyPeer:) withObject:caller_params];
}

+(void) getSslVerifyPeer_in_UI_thread:(RhoConnectClient_getSslVerifyPeer_caller_params*)caller_params {
    [[RhoConnectClient_getSslVerifyPeer_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSslVerifyPeer:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getSslVerifyPeer_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::sslVerifyPeer"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getSslVerifyPeer parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getSslVerifyPeer_caller getSslVerifyPeer_in_thread:[RhoConnectClient_getSslVerifyPeer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getSslVerifyPeer_caller getSslVerifyPeer:[RhoConnectClient_getSslVerifyPeer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getSslVerifyPeer_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setSslVerifyPeer_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setSslVerifyPeer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setSslVerifyPeer_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setSslVerifyPeer_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setSslVerifyPeer_caller_params* par = [[[RhoConnectClient_setSslVerifyPeer_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setSslVerifyPeer_caller : NSObject {

}
+(RhoConnectClient_setSslVerifyPeer_caller*) getSharedInstance;
+(void) setSslVerifyPeer:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params;
+(void) setSslVerifyPeer_in_thread:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params;
+(void) setSslVerifyPeer_in_UI_thread:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params;

@end

static RhoConnectClient_setSslVerifyPeer_caller* our_RhoConnectClient_setSslVerifyPeer_caller = nil;

@implementation RhoConnectClient_setSslVerifyPeer_caller

+(RhoConnectClient_setSslVerifyPeer_caller*) getSharedInstance {
    if (our_RhoConnectClient_setSslVerifyPeer_caller == nil) {
        our_RhoConnectClient_setSslVerifyPeer_caller = [[RhoConnectClient_setSslVerifyPeer_caller alloc] init];
    }
    return our_RhoConnectClient_setSslVerifyPeer_caller;
}

-(void) command_setSslVerifyPeer:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setSslVerifyPeer:(BOOL)[((NSNumber*)[params objectAtIndex:0]) boolValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setSslVerifyPeer:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params {
    [[RhoConnectClient_setSslVerifyPeer_caller getSharedInstance] command_setSslVerifyPeer:caller_params];
}

+(void) setSslVerifyPeer_in_thread:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params {
    [[RhoConnectClient_setSslVerifyPeer_caller getSharedInstance] performSelectorInBackground:@selector(command_setSslVerifyPeer:) withObject:caller_params];
}

+(void) setSslVerifyPeer_in_UI_thread:(RhoConnectClient_setSslVerifyPeer_caller_params*)caller_params {
    [[RhoConnectClient_setSslVerifyPeer_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setSslVerifyPeer:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setSslVerifyPeer_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::sslVerifyPeer="];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_BOOLEAN, 0, "sslVerifyPeer", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    
                params[0]= [NSNumber numberWithBool:YES];

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setSslVerifyPeer parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setSslVerifyPeer_caller setSslVerifyPeer_in_thread:[RhoConnectClient_setSslVerifyPeer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setSslVerifyPeer_caller setSslVerifyPeer:[RhoConnectClient_setSslVerifyPeer_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setSslVerifyPeer(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setSslVerifyPeer_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_isLoggedIn_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_isLoggedIn_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_isLoggedIn_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_isLoggedIn_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_isLoggedIn_caller_params* par = [[[RhoConnectClient_isLoggedIn_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_isLoggedIn_caller : NSObject {

}
+(RhoConnectClient_isLoggedIn_caller*) getSharedInstance;
+(void) isLoggedIn:(RhoConnectClient_isLoggedIn_caller_params*)caller_params;
+(void) isLoggedIn_in_thread:(RhoConnectClient_isLoggedIn_caller_params*)caller_params;
+(void) isLoggedIn_in_UI_thread:(RhoConnectClient_isLoggedIn_caller_params*)caller_params;

@end

static RhoConnectClient_isLoggedIn_caller* our_RhoConnectClient_isLoggedIn_caller = nil;

@implementation RhoConnectClient_isLoggedIn_caller

+(RhoConnectClient_isLoggedIn_caller*) getSharedInstance {
    if (our_RhoConnectClient_isLoggedIn_caller == nil) {
        our_RhoConnectClient_isLoggedIn_caller = [[RhoConnectClient_isLoggedIn_caller alloc] init];
    }
    return our_RhoConnectClient_isLoggedIn_caller;
}

-(void) command_isLoggedIn:(RhoConnectClient_isLoggedIn_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem isLoggedIn:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) isLoggedIn:(RhoConnectClient_isLoggedIn_caller_params*)caller_params {
    [[RhoConnectClient_isLoggedIn_caller getSharedInstance] command_isLoggedIn:caller_params];
}

+(void) isLoggedIn_in_thread:(RhoConnectClient_isLoggedIn_caller_params*)caller_params {
    [[RhoConnectClient_isLoggedIn_caller getSharedInstance] performSelectorInBackground:@selector(command_isLoggedIn:) withObject:caller_params];
}

+(void) isLoggedIn_in_UI_thread:(RhoConnectClient_isLoggedIn_caller_params*)caller_params {
    [[RhoConnectClient_isLoggedIn_caller getSharedInstance] performSelectorOnMainThread:@selector(command_isLoggedIn:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_isLoggedIn_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::isLoggedIn"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::isLoggedIn parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_isLoggedIn_caller isLoggedIn_in_thread:[RhoConnectClient_isLoggedIn_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_isLoggedIn_caller isLoggedIn:[RhoConnectClient_isLoggedIn_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_isLoggedIn(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_isLoggedIn_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_isSyncing_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_isSyncing_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_isSyncing_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_isSyncing_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_isSyncing_caller_params* par = [[[RhoConnectClient_isSyncing_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_isSyncing_caller : NSObject {

}
+(RhoConnectClient_isSyncing_caller*) getSharedInstance;
+(void) isSyncing:(RhoConnectClient_isSyncing_caller_params*)caller_params;
+(void) isSyncing_in_thread:(RhoConnectClient_isSyncing_caller_params*)caller_params;
+(void) isSyncing_in_UI_thread:(RhoConnectClient_isSyncing_caller_params*)caller_params;

@end

static RhoConnectClient_isSyncing_caller* our_RhoConnectClient_isSyncing_caller = nil;

@implementation RhoConnectClient_isSyncing_caller

+(RhoConnectClient_isSyncing_caller*) getSharedInstance {
    if (our_RhoConnectClient_isSyncing_caller == nil) {
        our_RhoConnectClient_isSyncing_caller = [[RhoConnectClient_isSyncing_caller alloc] init];
    }
    return our_RhoConnectClient_isSyncing_caller;
}

-(void) command_isSyncing:(RhoConnectClient_isSyncing_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem isSyncing:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) isSyncing:(RhoConnectClient_isSyncing_caller_params*)caller_params {
    [[RhoConnectClient_isSyncing_caller getSharedInstance] command_isSyncing:caller_params];
}

+(void) isSyncing_in_thread:(RhoConnectClient_isSyncing_caller_params*)caller_params {
    [[RhoConnectClient_isSyncing_caller getSharedInstance] performSelectorInBackground:@selector(command_isSyncing:) withObject:caller_params];
}

+(void) isSyncing_in_UI_thread:(RhoConnectClient_isSyncing_caller_params*)caller_params {
    [[RhoConnectClient_isSyncing_caller getSharedInstance] performSelectorOnMainThread:@selector(command_isSyncing:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_isSyncing_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::isSyncing"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::isSyncing parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_isSyncing_caller isSyncing_in_thread:[RhoConnectClient_isSyncing_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_isSyncing_caller isSyncing:[RhoConnectClient_isSyncing_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_isSyncing(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_isSyncing_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_search_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_search_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_search_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_search_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_search_caller_params* par = [[[RhoConnectClient_search_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_search_caller : NSObject {

}
+(RhoConnectClient_search_caller*) getSharedInstance;
+(void) search:(RhoConnectClient_search_caller_params*)caller_params;
+(void) search_in_thread:(RhoConnectClient_search_caller_params*)caller_params;
+(void) search_in_UI_thread:(RhoConnectClient_search_caller_params*)caller_params;

@end

static RhoConnectClient_search_caller* our_RhoConnectClient_search_caller = nil;

@implementation RhoConnectClient_search_caller

+(RhoConnectClient_search_caller*) getSharedInstance {
    if (our_RhoConnectClient_search_caller == nil) {
        our_RhoConnectClient_search_caller = [[RhoConnectClient_search_caller alloc] init];
    }
    return our_RhoConnectClient_search_caller;
}

-(void) command_search:(RhoConnectClient_search_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem search:(NSDictionary*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) search:(RhoConnectClient_search_caller_params*)caller_params {
    [[RhoConnectClient_search_caller getSharedInstance] command_search:caller_params];
}

+(void) search_in_thread:(RhoConnectClient_search_caller_params*)caller_params {
    [[RhoConnectClient_search_caller getSharedInstance] performSelectorInBackground:@selector(command_search:) withObject:caller_params];
}

+(void) search_in_UI_thread:(RhoConnectClient_search_caller_params*)caller_params {
    [[RhoConnectClient_search_caller getSharedInstance] performSelectorOnMainThread:@selector(command_search:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_search_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::search"];

    
    static RHO_API_PARAM rho_api_params_param0_param0[] = { {RHO_API_STRING, 0, 0, 0, 0 } };
    static RHO_API_PARAM rho_api_params_param0[] = { {RHO_API_ARRAY, 0, "sourceNames", 1, rho_api_params_param0_param0 }, {RHO_API_STRING, 0, "from", 0, 0 }, {RHO_API_HASH, 0, "searchParams", 0, 0 }, {RHO_API_INTEGER, 0, "offset", 0, 0 }, {RHO_API_INTEGER, 0, "maxResults", 0, 0 }, {RHO_API_INTEGER, 0, "progressStep", 0, 0 }, {RHO_API_BOOLEAN, 0, "syncChanges", 0, 0 } };
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_HASH, 0, "args", 7, rho_api_params_param0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::search parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_search_caller search_in_thread:[RhoConnectClient_search_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_search_caller search:[RhoConnectClient_search_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_search(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_search_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_doSync_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_doSync_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_doSync_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_doSync_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_doSync_caller_params* par = [[[RhoConnectClient_doSync_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_doSync_caller : NSObject {

}
+(RhoConnectClient_doSync_caller*) getSharedInstance;
+(void) doSync:(RhoConnectClient_doSync_caller_params*)caller_params;
+(void) doSync_in_thread:(RhoConnectClient_doSync_caller_params*)caller_params;
+(void) doSync_in_UI_thread:(RhoConnectClient_doSync_caller_params*)caller_params;

@end

static RhoConnectClient_doSync_caller* our_RhoConnectClient_doSync_caller = nil;

@implementation RhoConnectClient_doSync_caller

+(RhoConnectClient_doSync_caller*) getSharedInstance {
    if (our_RhoConnectClient_doSync_caller == nil) {
        our_RhoConnectClient_doSync_caller = [[RhoConnectClient_doSync_caller alloc] init];
    }
    return our_RhoConnectClient_doSync_caller;
}

-(void) command_doSync:(RhoConnectClient_doSync_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem doSync:(BOOL)[((NSNumber*)[params objectAtIndex:0]) boolValue] queryParams:(NSString*)[params objectAtIndex:1] syncOnlyChangedSources:(BOOL)[((NSNumber*)[params objectAtIndex:2]) boolValue] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) doSync:(RhoConnectClient_doSync_caller_params*)caller_params {
    [[RhoConnectClient_doSync_caller getSharedInstance] command_doSync:caller_params];
}

+(void) doSync_in_thread:(RhoConnectClient_doSync_caller_params*)caller_params {
    [[RhoConnectClient_doSync_caller getSharedInstance] performSelectorInBackground:@selector(command_doSync:) withObject:caller_params];
}

+(void) doSync_in_UI_thread:(RhoConnectClient_doSync_caller_params*)caller_params {
    [[RhoConnectClient_doSync_caller getSharedInstance] performSelectorOnMainThread:@selector(command_doSync:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_doSync_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[3+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::doSync"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_BOOLEAN, 0, "showStatusPopup", 0, 0 }, {RHO_API_STRING, 0, "queryParams", 0, 0 }, {RHO_API_BOOLEAN, 0, "syncOnlyChangedSources", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (3); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (3); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::doSync parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(3)];
    for (i = 0 ; i < (3); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_doSync_caller doSync_in_thread:[RhoConnectClient_doSync_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_doSync_caller doSync:[RhoConnectClient_doSync_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_doSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_doSync_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_doSyncSource_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_doSyncSource_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_doSyncSource_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_doSyncSource_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_doSyncSource_caller_params* par = [[[RhoConnectClient_doSyncSource_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_doSyncSource_caller : NSObject {

}
+(RhoConnectClient_doSyncSource_caller*) getSharedInstance;
+(void) doSyncSource:(RhoConnectClient_doSyncSource_caller_params*)caller_params;
+(void) doSyncSource_in_thread:(RhoConnectClient_doSyncSource_caller_params*)caller_params;
+(void) doSyncSource_in_UI_thread:(RhoConnectClient_doSyncSource_caller_params*)caller_params;

@end

static RhoConnectClient_doSyncSource_caller* our_RhoConnectClient_doSyncSource_caller = nil;

@implementation RhoConnectClient_doSyncSource_caller

+(RhoConnectClient_doSyncSource_caller*) getSharedInstance {
    if (our_RhoConnectClient_doSyncSource_caller == nil) {
        our_RhoConnectClient_doSyncSource_caller = [[RhoConnectClient_doSyncSource_caller alloc] init];
    }
    return our_RhoConnectClient_doSyncSource_caller;
}

-(void) command_doSyncSource:(RhoConnectClient_doSyncSource_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem doSyncSource:(NSString*)[params objectAtIndex:0] showStatusPopup:(BOOL)[((NSNumber*)[params objectAtIndex:1]) boolValue] queryParams:(NSString*)[params objectAtIndex:2] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) doSyncSource:(RhoConnectClient_doSyncSource_caller_params*)caller_params {
    [[RhoConnectClient_doSyncSource_caller getSharedInstance] command_doSyncSource:caller_params];
}

+(void) doSyncSource_in_thread:(RhoConnectClient_doSyncSource_caller_params*)caller_params {
    [[RhoConnectClient_doSyncSource_caller getSharedInstance] performSelectorInBackground:@selector(command_doSyncSource:) withObject:caller_params];
}

+(void) doSyncSource_in_UI_thread:(RhoConnectClient_doSyncSource_caller_params*)caller_params {
    [[RhoConnectClient_doSyncSource_caller getSharedInstance] performSelectorOnMainThread:@selector(command_doSyncSource:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_doSyncSource_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[3+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::doSyncSource"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 }, {RHO_API_BOOLEAN, 0, "showStatusPopup", 0, 0 }, {RHO_API_STRING, 0, "queryParams", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (3); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (3); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::doSyncSource parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(3)];
    for (i = 0 ; i < (3); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_doSyncSource_caller doSyncSource_in_thread:[RhoConnectClient_doSyncSource_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_doSyncSource_caller doSyncSource:[RhoConnectClient_doSyncSource_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_doSyncSource(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_doSyncSource_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_login_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_login_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_login_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_login_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_login_caller_params* par = [[[RhoConnectClient_login_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_login_caller : NSObject {

}
+(RhoConnectClient_login_caller*) getSharedInstance;
+(void) login:(RhoConnectClient_login_caller_params*)caller_params;
+(void) login_in_thread:(RhoConnectClient_login_caller_params*)caller_params;
+(void) login_in_UI_thread:(RhoConnectClient_login_caller_params*)caller_params;

@end

static RhoConnectClient_login_caller* our_RhoConnectClient_login_caller = nil;

@implementation RhoConnectClient_login_caller

+(RhoConnectClient_login_caller*) getSharedInstance {
    if (our_RhoConnectClient_login_caller == nil) {
        our_RhoConnectClient_login_caller = [[RhoConnectClient_login_caller alloc] init];
    }
    return our_RhoConnectClient_login_caller;
}

-(void) command_login:(RhoConnectClient_login_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem login:(NSString*)[params objectAtIndex:0] password:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) login:(RhoConnectClient_login_caller_params*)caller_params {
    [[RhoConnectClient_login_caller getSharedInstance] command_login:caller_params];
}

+(void) login_in_thread:(RhoConnectClient_login_caller_params*)caller_params {
    [[RhoConnectClient_login_caller getSharedInstance] performSelectorInBackground:@selector(command_login:) withObject:caller_params];
}

+(void) login_in_UI_thread:(RhoConnectClient_login_caller_params*)caller_params {
    [[RhoConnectClient_login_caller getSharedInstance] performSelectorOnMainThread:@selector(command_login:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_login_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::login"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "login", 0, 0 }, {RHO_API_STRING, 0, "password", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::login parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_login_caller login_in_thread:[RhoConnectClient_login_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_login_caller login:[RhoConnectClient_login_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_login(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_login_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_logout_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_logout_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_logout_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_logout_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_logout_caller_params* par = [[[RhoConnectClient_logout_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_logout_caller : NSObject {

}
+(RhoConnectClient_logout_caller*) getSharedInstance;
+(void) logout:(RhoConnectClient_logout_caller_params*)caller_params;
+(void) logout_in_thread:(RhoConnectClient_logout_caller_params*)caller_params;
+(void) logout_in_UI_thread:(RhoConnectClient_logout_caller_params*)caller_params;

@end

static RhoConnectClient_logout_caller* our_RhoConnectClient_logout_caller = nil;

@implementation RhoConnectClient_logout_caller

+(RhoConnectClient_logout_caller*) getSharedInstance {
    if (our_RhoConnectClient_logout_caller == nil) {
        our_RhoConnectClient_logout_caller = [[RhoConnectClient_logout_caller alloc] init];
    }
    return our_RhoConnectClient_logout_caller;
}

-(void) command_logout:(RhoConnectClient_logout_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem logout:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) logout:(RhoConnectClient_logout_caller_params*)caller_params {
    [[RhoConnectClient_logout_caller getSharedInstance] command_logout:caller_params];
}

+(void) logout_in_thread:(RhoConnectClient_logout_caller_params*)caller_params {
    [[RhoConnectClient_logout_caller getSharedInstance] performSelectorInBackground:@selector(command_logout:) withObject:caller_params];
}

+(void) logout_in_UI_thread:(RhoConnectClient_logout_caller_params*)caller_params {
    [[RhoConnectClient_logout_caller getSharedInstance] performSelectorOnMainThread:@selector(command_logout:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_logout_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::logout"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::logout parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_logout_caller logout_in_thread:[RhoConnectClient_logout_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_logout_caller logout:[RhoConnectClient_logout_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_logout(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_logout_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_stopSync_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_stopSync_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_stopSync_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_stopSync_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_stopSync_caller_params* par = [[[RhoConnectClient_stopSync_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_stopSync_caller : NSObject {

}
+(RhoConnectClient_stopSync_caller*) getSharedInstance;
+(void) stopSync:(RhoConnectClient_stopSync_caller_params*)caller_params;
+(void) stopSync_in_thread:(RhoConnectClient_stopSync_caller_params*)caller_params;
+(void) stopSync_in_UI_thread:(RhoConnectClient_stopSync_caller_params*)caller_params;

@end

static RhoConnectClient_stopSync_caller* our_RhoConnectClient_stopSync_caller = nil;

@implementation RhoConnectClient_stopSync_caller

+(RhoConnectClient_stopSync_caller*) getSharedInstance {
    if (our_RhoConnectClient_stopSync_caller == nil) {
        our_RhoConnectClient_stopSync_caller = [[RhoConnectClient_stopSync_caller alloc] init];
    }
    return our_RhoConnectClient_stopSync_caller;
}

-(void) command_stopSync:(RhoConnectClient_stopSync_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem stopSync:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) stopSync:(RhoConnectClient_stopSync_caller_params*)caller_params {
    [[RhoConnectClient_stopSync_caller getSharedInstance] command_stopSync:caller_params];
}

+(void) stopSync_in_thread:(RhoConnectClient_stopSync_caller_params*)caller_params {
    [[RhoConnectClient_stopSync_caller getSharedInstance] performSelectorInBackground:@selector(command_stopSync:) withObject:caller_params];
}

+(void) stopSync_in_UI_thread:(RhoConnectClient_stopSync_caller_params*)caller_params {
    [[RhoConnectClient_stopSync_caller getSharedInstance] performSelectorOnMainThread:@selector(command_stopSync:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_stopSync_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::stopSync"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::stopSync parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_stopSync_caller stopSync_in_thread:[RhoConnectClient_stopSync_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_stopSync_caller stopSync:[RhoConnectClient_stopSync_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_stopSync(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_stopSync_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setNotification_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setNotification_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setNotification_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setNotification_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setNotification_caller_params* par = [[[RhoConnectClient_setNotification_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setNotification_caller : NSObject {

}
+(RhoConnectClient_setNotification_caller*) getSharedInstance;
+(void) setNotification:(RhoConnectClient_setNotification_caller_params*)caller_params;
+(void) setNotification_in_thread:(RhoConnectClient_setNotification_caller_params*)caller_params;
+(void) setNotification_in_UI_thread:(RhoConnectClient_setNotification_caller_params*)caller_params;

@end

static RhoConnectClient_setNotification_caller* our_RhoConnectClient_setNotification_caller = nil;

@implementation RhoConnectClient_setNotification_caller

+(RhoConnectClient_setNotification_caller*) getSharedInstance {
    if (our_RhoConnectClient_setNotification_caller == nil) {
        our_RhoConnectClient_setNotification_caller = [[RhoConnectClient_setNotification_caller alloc] init];
    }
    return our_RhoConnectClient_setNotification_caller;
}

-(void) command_setNotification:(RhoConnectClient_setNotification_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setNotification:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setNotification:(RhoConnectClient_setNotification_caller_params*)caller_params {
    [[RhoConnectClient_setNotification_caller getSharedInstance] command_setNotification:caller_params];
}

+(void) setNotification_in_thread:(RhoConnectClient_setNotification_caller_params*)caller_params {
    [[RhoConnectClient_setNotification_caller getSharedInstance] performSelectorInBackground:@selector(command_setNotification:) withObject:caller_params];
}

+(void) setNotification_in_UI_thread:(RhoConnectClient_setNotification_caller_params*)caller_params {
    [[RhoConnectClient_setNotification_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setNotification:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setNotification_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::setNotification"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setNotification parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setNotification_caller setNotification_in_thread:[RhoConnectClient_setNotification_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setNotification_caller setNotification:[RhoConnectClient_setNotification_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setNotification_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_clearNotification_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_clearNotification_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_clearNotification_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_clearNotification_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_clearNotification_caller_params* par = [[[RhoConnectClient_clearNotification_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_clearNotification_caller : NSObject {

}
+(RhoConnectClient_clearNotification_caller*) getSharedInstance;
+(void) clearNotification:(RhoConnectClient_clearNotification_caller_params*)caller_params;
+(void) clearNotification_in_thread:(RhoConnectClient_clearNotification_caller_params*)caller_params;
+(void) clearNotification_in_UI_thread:(RhoConnectClient_clearNotification_caller_params*)caller_params;

@end

static RhoConnectClient_clearNotification_caller* our_RhoConnectClient_clearNotification_caller = nil;

@implementation RhoConnectClient_clearNotification_caller

+(RhoConnectClient_clearNotification_caller*) getSharedInstance {
    if (our_RhoConnectClient_clearNotification_caller == nil) {
        our_RhoConnectClient_clearNotification_caller = [[RhoConnectClient_clearNotification_caller alloc] init];
    }
    return our_RhoConnectClient_clearNotification_caller;
}

-(void) command_clearNotification:(RhoConnectClient_clearNotification_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem clearNotification:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) clearNotification:(RhoConnectClient_clearNotification_caller_params*)caller_params {
    [[RhoConnectClient_clearNotification_caller getSharedInstance] command_clearNotification:caller_params];
}

+(void) clearNotification_in_thread:(RhoConnectClient_clearNotification_caller_params*)caller_params {
    [[RhoConnectClient_clearNotification_caller getSharedInstance] performSelectorInBackground:@selector(command_clearNotification:) withObject:caller_params];
}

+(void) clearNotification_in_UI_thread:(RhoConnectClient_clearNotification_caller_params*)caller_params {
    [[RhoConnectClient_clearNotification_caller getSharedInstance] performSelectorOnMainThread:@selector(command_clearNotification:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_clearNotification_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::clearNotification"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::clearNotification parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_clearNotification_caller clearNotification_in_thread:[RhoConnectClient_clearNotification_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_clearNotification_caller clearNotification:[RhoConnectClient_clearNotification_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_clearNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_clearNotification_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setObjectNotification_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setObjectNotification_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setObjectNotification_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setObjectNotification_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setObjectNotification_caller_params* par = [[[RhoConnectClient_setObjectNotification_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setObjectNotification_caller : NSObject {

}
+(RhoConnectClient_setObjectNotification_caller*) getSharedInstance;
+(void) setObjectNotification:(RhoConnectClient_setObjectNotification_caller_params*)caller_params;
+(void) setObjectNotification_in_thread:(RhoConnectClient_setObjectNotification_caller_params*)caller_params;
+(void) setObjectNotification_in_UI_thread:(RhoConnectClient_setObjectNotification_caller_params*)caller_params;

@end

static RhoConnectClient_setObjectNotification_caller* our_RhoConnectClient_setObjectNotification_caller = nil;

@implementation RhoConnectClient_setObjectNotification_caller

+(RhoConnectClient_setObjectNotification_caller*) getSharedInstance {
    if (our_RhoConnectClient_setObjectNotification_caller == nil) {
        our_RhoConnectClient_setObjectNotification_caller = [[RhoConnectClient_setObjectNotification_caller alloc] init];
    }
    return our_RhoConnectClient_setObjectNotification_caller;
}

-(void) command_setObjectNotification:(RhoConnectClient_setObjectNotification_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setObjectNotification:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setObjectNotification:(RhoConnectClient_setObjectNotification_caller_params*)caller_params {
    [[RhoConnectClient_setObjectNotification_caller getSharedInstance] command_setObjectNotification:caller_params];
}

+(void) setObjectNotification_in_thread:(RhoConnectClient_setObjectNotification_caller_params*)caller_params {
    [[RhoConnectClient_setObjectNotification_caller getSharedInstance] performSelectorInBackground:@selector(command_setObjectNotification:) withObject:caller_params];
}

+(void) setObjectNotification_in_UI_thread:(RhoConnectClient_setObjectNotification_caller_params*)caller_params {
    [[RhoConnectClient_setObjectNotification_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setObjectNotification:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setObjectNotification_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::setObjectNotification"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setObjectNotification parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setObjectNotification_caller setObjectNotification_in_thread:[RhoConnectClient_setObjectNotification_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setObjectNotification_caller setObjectNotification:[RhoConnectClient_setObjectNotification_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setObjectNotification(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setObjectNotification_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_addObjectNotify_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_addObjectNotify_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_addObjectNotify_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_addObjectNotify_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_addObjectNotify_caller_params* par = [[[RhoConnectClient_addObjectNotify_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_addObjectNotify_caller : NSObject {

}
+(RhoConnectClient_addObjectNotify_caller*) getSharedInstance;
+(void) addObjectNotify:(RhoConnectClient_addObjectNotify_caller_params*)caller_params;
+(void) addObjectNotify_in_thread:(RhoConnectClient_addObjectNotify_caller_params*)caller_params;
+(void) addObjectNotify_in_UI_thread:(RhoConnectClient_addObjectNotify_caller_params*)caller_params;

@end

static RhoConnectClient_addObjectNotify_caller* our_RhoConnectClient_addObjectNotify_caller = nil;

@implementation RhoConnectClient_addObjectNotify_caller

+(RhoConnectClient_addObjectNotify_caller*) getSharedInstance {
    if (our_RhoConnectClient_addObjectNotify_caller == nil) {
        our_RhoConnectClient_addObjectNotify_caller = [[RhoConnectClient_addObjectNotify_caller alloc] init];
    }
    return our_RhoConnectClient_addObjectNotify_caller;
}

-(void) command_addObjectNotify:(RhoConnectClient_addObjectNotify_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem addObjectNotify:(NSString*)[params objectAtIndex:0] object:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) addObjectNotify:(RhoConnectClient_addObjectNotify_caller_params*)caller_params {
    [[RhoConnectClient_addObjectNotify_caller getSharedInstance] command_addObjectNotify:caller_params];
}

+(void) addObjectNotify_in_thread:(RhoConnectClient_addObjectNotify_caller_params*)caller_params {
    [[RhoConnectClient_addObjectNotify_caller getSharedInstance] performSelectorInBackground:@selector(command_addObjectNotify:) withObject:caller_params];
}

+(void) addObjectNotify_in_UI_thread:(RhoConnectClient_addObjectNotify_caller_params*)caller_params {
    [[RhoConnectClient_addObjectNotify_caller getSharedInstance] performSelectorOnMainThread:@selector(command_addObjectNotify:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_addObjectNotify_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::addObjectNotify"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 }, {RHO_API_STRING, 0, "object", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::addObjectNotify parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_addObjectNotify_caller addObjectNotify_in_thread:[RhoConnectClient_addObjectNotify_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_addObjectNotify_caller addObjectNotify:[RhoConnectClient_addObjectNotify_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_addObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_addObjectNotify_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_cleanObjectNotify_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_cleanObjectNotify_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_cleanObjectNotify_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_cleanObjectNotify_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_cleanObjectNotify_caller_params* par = [[[RhoConnectClient_cleanObjectNotify_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_cleanObjectNotify_caller : NSObject {

}
+(RhoConnectClient_cleanObjectNotify_caller*) getSharedInstance;
+(void) cleanObjectNotify:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params;
+(void) cleanObjectNotify_in_thread:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params;
+(void) cleanObjectNotify_in_UI_thread:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params;

@end

static RhoConnectClient_cleanObjectNotify_caller* our_RhoConnectClient_cleanObjectNotify_caller = nil;

@implementation RhoConnectClient_cleanObjectNotify_caller

+(RhoConnectClient_cleanObjectNotify_caller*) getSharedInstance {
    if (our_RhoConnectClient_cleanObjectNotify_caller == nil) {
        our_RhoConnectClient_cleanObjectNotify_caller = [[RhoConnectClient_cleanObjectNotify_caller alloc] init];
    }
    return our_RhoConnectClient_cleanObjectNotify_caller;
}

-(void) command_cleanObjectNotify:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params {

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem cleanObjectNotify:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) cleanObjectNotify:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params {
    [[RhoConnectClient_cleanObjectNotify_caller getSharedInstance] command_cleanObjectNotify:caller_params];
}

+(void) cleanObjectNotify_in_thread:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params {
    [[RhoConnectClient_cleanObjectNotify_caller getSharedInstance] performSelectorInBackground:@selector(command_cleanObjectNotify:) withObject:caller_params];
}

+(void) cleanObjectNotify_in_UI_thread:(RhoConnectClient_cleanObjectNotify_caller_params*)caller_params {
    [[RhoConnectClient_cleanObjectNotify_caller getSharedInstance] performSelectorOnMainThread:@selector(command_cleanObjectNotify:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_cleanObjectNotify_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[0+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::cleanObjectNotify"];

    
    static RHO_API_PARAM rho_api_params[] = {  };

    
    BOOL is_factory_param[] = { NO };

    int i;

    // init
    for (i = 0; i < (0); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (0); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::cleanObjectNotify parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(0)];
    for (i = 0 ; i < (0); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_cleanObjectNotify_caller cleanObjectNotify_in_thread:[RhoConnectClient_cleanObjectNotify_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_cleanObjectNotify_caller cleanObjectNotify:[RhoConnectClient_cleanObjectNotify_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_cleanObjectNotify(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_cleanObjectNotify_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getLastSyncObjectCount_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getLastSyncObjectCount_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getLastSyncObjectCount_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getLastSyncObjectCount_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getLastSyncObjectCount_caller_params* par = [[[RhoConnectClient_getLastSyncObjectCount_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getLastSyncObjectCount_caller : NSObject {

}
+(RhoConnectClient_getLastSyncObjectCount_caller*) getSharedInstance;
+(void) getLastSyncObjectCount:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params;
+(void) getLastSyncObjectCount_in_thread:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params;
+(void) getLastSyncObjectCount_in_UI_thread:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params;

@end

static RhoConnectClient_getLastSyncObjectCount_caller* our_RhoConnectClient_getLastSyncObjectCount_caller = nil;

@implementation RhoConnectClient_getLastSyncObjectCount_caller

+(RhoConnectClient_getLastSyncObjectCount_caller*) getSharedInstance {
    if (our_RhoConnectClient_getLastSyncObjectCount_caller == nil) {
        our_RhoConnectClient_getLastSyncObjectCount_caller = [[RhoConnectClient_getLastSyncObjectCount_caller alloc] init];
    }
    return our_RhoConnectClient_getLastSyncObjectCount_caller;
}

-(void) command_getLastSyncObjectCount:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getLastSyncObjectCount:(NSString*)[params objectAtIndex:0] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getLastSyncObjectCount:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params {
    [[RhoConnectClient_getLastSyncObjectCount_caller getSharedInstance] command_getLastSyncObjectCount:caller_params];
}

+(void) getLastSyncObjectCount_in_thread:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params {
    [[RhoConnectClient_getLastSyncObjectCount_caller getSharedInstance] performSelectorInBackground:@selector(command_getLastSyncObjectCount:) withObject:caller_params];
}

+(void) getLastSyncObjectCount_in_UI_thread:(RhoConnectClient_getLastSyncObjectCount_caller_params*)caller_params {
    [[RhoConnectClient_getLastSyncObjectCount_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getLastSyncObjectCount:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getLastSyncObjectCount_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[1+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::getLastSyncObjectCount"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO };

    int i;

    // init
    for (i = 0; i < (1); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (1); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getLastSyncObjectCount parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(1)];
    for (i = 0 ; i < (1); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getLastSyncObjectCount_caller getLastSyncObjectCount_in_thread:[RhoConnectClient_getLastSyncObjectCount_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getLastSyncObjectCount_caller getLastSyncObjectCount:[RhoConnectClient_getLastSyncObjectCount_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getLastSyncObjectCount(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getLastSyncObjectCount_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_setSourceProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_setSourceProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_setSourceProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_setSourceProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_setSourceProperty_caller_params* par = [[[RhoConnectClient_setSourceProperty_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_setSourceProperty_caller : NSObject {

}
+(RhoConnectClient_setSourceProperty_caller*) getSharedInstance;
+(void) setSourceProperty:(RhoConnectClient_setSourceProperty_caller_params*)caller_params;
+(void) setSourceProperty_in_thread:(RhoConnectClient_setSourceProperty_caller_params*)caller_params;
+(void) setSourceProperty_in_UI_thread:(RhoConnectClient_setSourceProperty_caller_params*)caller_params;

@end

static RhoConnectClient_setSourceProperty_caller* our_RhoConnectClient_setSourceProperty_caller = nil;

@implementation RhoConnectClient_setSourceProperty_caller

+(RhoConnectClient_setSourceProperty_caller*) getSharedInstance {
    if (our_RhoConnectClient_setSourceProperty_caller == nil) {
        our_RhoConnectClient_setSourceProperty_caller = [[RhoConnectClient_setSourceProperty_caller alloc] init];
    }
    return our_RhoConnectClient_setSourceProperty_caller;
}

-(void) command_setSourceProperty:(RhoConnectClient_setSourceProperty_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem setSourceProperty:(NSString*)[params objectAtIndex:0] propertyName:(NSString*)[params objectAtIndex:1] propertyValue:(NSString*)[params objectAtIndex:2] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) setSourceProperty:(RhoConnectClient_setSourceProperty_caller_params*)caller_params {
    [[RhoConnectClient_setSourceProperty_caller getSharedInstance] command_setSourceProperty:caller_params];
}

+(void) setSourceProperty_in_thread:(RhoConnectClient_setSourceProperty_caller_params*)caller_params {
    [[RhoConnectClient_setSourceProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_setSourceProperty:) withObject:caller_params];
}

+(void) setSourceProperty_in_UI_thread:(RhoConnectClient_setSourceProperty_caller_params*)caller_params {
    [[RhoConnectClient_setSourceProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_setSourceProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_setSourceProperty_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[3+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::setSourceProperty"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 }, {RHO_API_STRING, 0, "propertyName", 0, 0 }, {RHO_API_STRING, 0, "propertyValue", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (3); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (3); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::setSourceProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(3)];
    for (i = 0 ; i < (3); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_setSourceProperty_caller setSourceProperty_in_thread:[RhoConnectClient_setSourceProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_setSourceProperty_caller setSourceProperty:[RhoConnectClient_setSourceProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_setSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_setSourceProperty_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







@interface RhoConnectClient_getSourceProperty_caller_params : NSObject

@property (nonatomic, copy) NSArray* params;
@property (assign) id<IRhoConnectClientSingleton> item;
@property (assign) CMethodResult* methodResult;

-(void)dealloc;

+(RhoConnectClient_getSourceProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult;

@end

@implementation RhoConnectClient_getSourceProperty_caller_params

@synthesize params,item,methodResult;

-(void)dealloc {
    [params release];
    [super dealloc];
}

+(RhoConnectClient_getSourceProperty_caller_params*) makeParams:(NSArray*)_params _item:(id<IRhoConnectClientSingleton>)_item _methodResult:(CMethodResult*)_methodResult {
    RhoConnectClient_getSourceProperty_caller_params* par = [[[RhoConnectClient_getSourceProperty_caller_params alloc] init] autorelease];
    par.params = _params;
    par.item = _item;
    par.methodResult = [_methodResult retain];
    return [par retain];
}

@end


@interface RhoConnectClient_getSourceProperty_caller : NSObject {

}
+(RhoConnectClient_getSourceProperty_caller*) getSharedInstance;
+(void) getSourceProperty:(RhoConnectClient_getSourceProperty_caller_params*)caller_params;
+(void) getSourceProperty_in_thread:(RhoConnectClient_getSourceProperty_caller_params*)caller_params;
+(void) getSourceProperty_in_UI_thread:(RhoConnectClient_getSourceProperty_caller_params*)caller_params;

@end

static RhoConnectClient_getSourceProperty_caller* our_RhoConnectClient_getSourceProperty_caller = nil;

@implementation RhoConnectClient_getSourceProperty_caller

+(RhoConnectClient_getSourceProperty_caller*) getSharedInstance {
    if (our_RhoConnectClient_getSourceProperty_caller == nil) {
        our_RhoConnectClient_getSourceProperty_caller = [[RhoConnectClient_getSourceProperty_caller alloc] init];
    }
    return our_RhoConnectClient_getSourceProperty_caller;
}

-(void) command_getSourceProperty:(RhoConnectClient_getSourceProperty_caller_params*)caller_params {

    NSArray* params = caller_params.params;

    id<IRhoConnectClientSingleton> objItem = caller_params.item;
    CMethodResult* methodResult = caller_params.methodResult;

    
    [objItem getSourceProperty:(NSString*)[params objectAtIndex:0] propertyName:(NSString*)[params objectAtIndex:1] methodResult:methodResult ];
    [caller_params.methodResult release];
    [caller_params release];
}


+(void) getSourceProperty:(RhoConnectClient_getSourceProperty_caller_params*)caller_params {
    [[RhoConnectClient_getSourceProperty_caller getSharedInstance] command_getSourceProperty:caller_params];
}

+(void) getSourceProperty_in_thread:(RhoConnectClient_getSourceProperty_caller_params*)caller_params {
    [[RhoConnectClient_getSourceProperty_caller getSharedInstance] performSelectorInBackground:@selector(command_getSourceProperty:) withObject:caller_params];
}

+(void) getSourceProperty_in_UI_thread:(RhoConnectClient_getSourceProperty_caller_params*)caller_params {
    [[RhoConnectClient_getSourceProperty_caller getSharedInstance] performSelectorOnMainThread:@selector(command_getSourceProperty:) withObject:caller_params waitUntilDone:NO];
}


@end


rho::String js_RhoConnectClient_getSourceProperty_Obj(rho::json::CJSONArray& argv, id<IRhoConnectClientSingleton>objItem, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    CMethodResult* methodResult = [[CMethodResult alloc] init];

    NSObject* params[2+1];
    BOOL method_return_result = YES;
    BOOL method_receive_callback = NO;
    int argc = argv.getSize();


    [methodResult setMethodSignature:@"RhoConnectClient::getSourceProperty"];

    
    static RHO_API_PARAM rho_api_params[] = { {RHO_API_STRING, 0, "sourceName", 0, 0 }, {RHO_API_STRING, 0, "propertyName", 0, 0 } };

    
    BOOL is_factory_param[] = { NO, NO, NO };

    int i;

    // init
    for (i = 0; i < (2); i++) {
        params[i] = [CJSConverter getObjectiveCNULL];
    }

    

    // enumerate params
    for (int i = 0; i < (2); i++) {
        if (argc > i) {
            // we have a [i] param !
            if (is_factory_param[i]) {
                params[i] = RhoConnectClient_makeInstanceByJSObject(argv.getItem(i).getString());
            }
            else {
                rho::json::CJSONEntry entry = argv.getItem(i);
                params[i] = [[CJSConverter convertFromJS:&entry rho_api_param:&(rho_api_params[i])] retain];
            }
            // TODO: Handle CMethodResultError
            if (params[i] == nil) {
                //NSLog(@"RhoConnectClient::getSourceProperty parameter %d is nil!", i);
                rho::String resValue = rho::String("\"result\":null,\"error\":\"Method parameter is nil!\"");
                return resValue;
            }
        }
    }

    NSMutableArray* params_array = [NSMutableArray arrayWithCapacity:(2)];
    for (i = 0 ; i < (2); i++) {
        [params_array addObject:params[i]];
    }

    
        if (strCallbackID.size() > 0) {
            method_receive_callback = YES;
        }
    

    

    if (method_receive_callback) {
        // we have callback - method should not call setResult if method execute from current thread - only later or in UI or separated threads !!!
        [methodResult setJSCallback:[NSString stringWithUTF8String:strCallbackID.c_str()] webViewUID:[NSString stringWithUTF8String:strJsVmID.c_str()]];
        [methodResult setCallbackParam:[NSString stringWithUTF8String:strCallbackParam.c_str()]];
        
        [RhoConnectClient_getSourceProperty_caller getSourceProperty_in_thread:[RhoConnectClient_getSourceProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        

        // FIXME: callback should not be retained, it must be saved outside of this call
        [methodResult retain];
    }
    else {
        // we do not have callback
        
        [RhoConnectClient_getSourceProperty_caller getSourceProperty:[RhoConnectClient_getSourceProperty_caller_params makeParams:params_array _item:objItem _methodResult:methodResult]];
        
    }
    rho::String resValue = rho::String("\"result\":null");
    if ((!method_receive_callback) && (method_return_result)) {
        resValue = [[methodResult toJSON] UTF8String];
    }
    [methodResult release];
    return resValue;
}


rho::String js_s_RhoConnectClient_getSourceProperty(const rho::String& strObjID, rho::json::CJSONArray& argv, const rho::String& strCallbackID, const rho::String& strJsVmID, const rho::String& strCallbackParam) {

    id<IRhoConnectClientFactory> factory = [RhoConnectClientFactorySingleton getRhoConnectClientFactoryInstance];
    id<IRhoConnectClientSingleton> singleton = [factory getRhoConnectClientSingleton];
    return js_RhoConnectClient_getSourceProperty_Obj(argv, singleton, strCallbackID, strJsVmID, strCallbackParam);

}







