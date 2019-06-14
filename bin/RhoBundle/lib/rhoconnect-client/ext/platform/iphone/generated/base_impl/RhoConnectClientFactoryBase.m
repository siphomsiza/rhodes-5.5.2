
#import "RhoConnectClientFactoryBase.h"
#import "RhoConnectClient.h"
#import "RhoConnectClientSingleton.h"



@implementation RhoConnectClientFactoryBase

-(id)init {
    self = [super init];
    mRhoConnectClientInstances = [[NSMutableDictionary dictionaryWithCapacity:4] retain];
    mRhoConnectClientSingleton = nil;
    return self;
}

-(id<IRhoConnectClient>) getRhoConnectClientByID:(NSString*)ID {
    id<IRhoConnectClient> obj = (RhoConnectClient*)[mRhoConnectClientInstances objectForKey:ID];
    if (obj == nil) {
        obj = [self createRhoConnectClientByID:ID];
        [mRhoConnectClientInstances setObject:obj forKey:ID];
    }
    return obj;
}

-(void) destroyObjectByID:(NSString*)ID {
    RhoConnectClient* obj = [mRhoConnectClientInstances objectForKey:ID];
    if (obj != nil) {
        [mRhoConnectClientInstances removeObjectForKey:ID];
    }
}


-(id<IRhoConnectClient>)createRhoConnectClientByID:(NSString*)ID {
    RhoConnectClient* obj = [[RhoConnectClient alloc] init];

    return obj;
}


-(id<IRhoConnectClientSingleton>) getRhoConnectClientSingleton {
    if (mRhoConnectClientSingleton == nil) {
        mRhoConnectClientSingleton = [[RhoConnectClientSingleton alloc] init];
    }
    return mRhoConnectClientSingleton;
}

-(NSArray*) enumerateRhoConnectClientInstances {
    return [mRhoConnectClientInstances allKeys];
}

-(void)dealloc {
    [mRhoConnectClientInstances release];
    [super dealloc];
}


@end