
(function ($, rho, rhoUtil) {
    'use strict';

    var moduleNS = 'Rho.RhoConnectClient';
    var apiReq = rhoUtil.apiReqFor(moduleNS);


    // === RhoConnectClient class definition ===

    function RhoConnectClient() {
        var id = null;
        this.getId = function () {return id;};

        if (1 == arguments.length && arguments[0][rhoUtil.rhoIdParam()]) {
            if (moduleNS != arguments[0][rhoUtil.rhoClassParam()]) {
                throw "Wrong class instantiation!";
            }
            id = arguments[0][rhoUtil.rhoIdParam()];
        } else {
            id = rhoUtil.nextId();
            // constructor methods are following:
            
        }
    };

    // === RhoConnectClient instance properties ===

    rhoUtil.createPropsProxy(RhoConnectClient.prototype, [
    ], apiReq, function(){ return this.getId(); });

    // === RhoConnectClient instance methods ===

    rhoUtil.createMethodsProxy(RhoConnectClient.prototype, [
    
    ], apiReq, function(){ return this.getId(); });

    

    rhoUtil.createRawPropsProxy(RhoConnectClient.prototype, [
    ]);

    // === RhoConnectClient constants ===

    



    // === RhoConnectClient static properties ===

    rhoUtil.createPropsProxy(RhoConnectClient, [
        { propName: 'userName', propAccess: 'r' }
      , { propName: 'pollInterval', propAccess: 'rw' }
      , { propName: 'syncServer', propAccess: 'rw' }
      , { propName: 'bulksyncState', propAccess: 'rw' }
      , { propName: 'pageSize', propAccess: 'rw' }
      , { propName: 'threadedMode', propAccess: 'rw' }
      , { propName: 'showStatusPopup', propAccess: 'rw' }
      , { propName: 'sslVerifyPeer', propAccess: 'rw' }
    ], apiReq);

    // === RhoConnectClient static methods ===

    rhoUtil.createMethodsProxy(RhoConnectClient, [
    
          // function(/* optional function */ oResult)
          { methodName: 'isLoggedIn', nativeName: 'isLoggedIn', valueCallbackIndex: 0 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'isSyncing', nativeName: 'isSyncing', valueCallbackIndex: 0 }
    
          // function(/* const rho::Hashtable<rho::String, rho::String>& */ args, /* optional function */ oResult)
        , { methodName: 'search', nativeName: 'search', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
    
          // function(/* bool */ showStatusPopup, /* const rho::String& */ queryParams, /* bool */ syncOnlyChangedSources, /* optional function */ oResult)
        , { methodName: 'doSync', nativeName: 'doSync', valueCallbackIndex: 3 }
    
          // function(/* const rho::String& */ sourceName, /* bool */ showStatusPopup, /* const rho::String& */ queryParams, /* optional function */ oResult)
        , { methodName: 'doSyncSource', nativeName: 'doSyncSource', valueCallbackIndex: 3 }
    
          // function(/* const rho::String& */ login, /* const rho::String& */ password, /* optional function */ oResult)
        , { methodName: 'login', nativeName: 'login', persistentCallbackIndex: 2, valueCallbackIndex: 4 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'logout', nativeName: 'logout', valueCallbackIndex: 0 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'stopSync', nativeName: 'stopSync', valueCallbackIndex: 0 }
    
          // function(/* const rho::String& */ sourceName, /* optional function */ oResult)
        , { methodName: 'setNotification', nativeName: 'setNotification', persistentCallbackIndex: 1, valueCallbackIndex: 3 }
    
          // function(/* const rho::String& */ sourceName, /* optional function */ oResult)
        , { methodName: 'clearNotification', nativeName: 'clearNotification', valueCallbackIndex: 1 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'setObjectNotification', nativeName: 'setObjectNotification', persistentCallbackIndex: 0, valueCallbackIndex: 2 }
    
          // function(/* const rho::String& */ sourceName, /* const rho::String& */ object, /* optional function */ oResult)
        , { methodName: 'addObjectNotify', nativeName: 'addObjectNotify', valueCallbackIndex: 2 }
    
          // function(/* optional function */ oResult)
        , { methodName: 'cleanObjectNotify', nativeName: 'cleanObjectNotify', valueCallbackIndex: 0 }
    
          // function(/* const rho::String& */ sourceName, /* optional function */ oResult)
        , { methodName: 'getLastSyncObjectCount', nativeName: 'getLastSyncObjectCount', valueCallbackIndex: 1 }
    
          // function(/* const rho::String& */ sourceName, /* const rho::String& */ propertyName, /* const rho::String& */ propertyValue, /* optional function */ oResult)
        , { methodName: 'setSourceProperty', nativeName: 'setSourceProperty', valueCallbackIndex: 3 }
    
          // function(/* const rho::String& */ sourceName, /* const rho::String& */ propertyName, /* optional function */ oResult)
        , { methodName: 'getSourceProperty', nativeName: 'getSourceProperty', valueCallbackIndex: 2 }
    
    ], apiReq);

    // === RhoConnectClient default instance support ===
    

    rhoUtil.namespace(moduleNS, RhoConnectClient);

    

    

})(Rho.jQuery, Rho, Rho.util);
