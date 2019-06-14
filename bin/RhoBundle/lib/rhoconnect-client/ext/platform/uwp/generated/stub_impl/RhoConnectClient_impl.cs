using System;
using System.Collections.Generic;
using System.Net;
using Windows.UI.Core;
using System.Threading.Tasks;
using rhoruntime;

namespace rho {

namespace RhoConnectClientImpl
{
    public class RhoConnectClient : RhoConnectClientBase
    {
        public RhoConnectClient(string id) : base(id)
        {
            // initialize class instance in C# here
        }
    }

    public class RhoConnectClientSingleton : RhoConnectClientSingletonBase
    {
        public RhoConnectClientSingleton()
        {
            // initialize singleton instance in C# here
        }

        public override void getUserName(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getPollInterval(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setPollInterval(int pollInterval, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getSyncServer(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setSyncServer(string syncServer, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getBulksyncState(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setBulksyncState(int bulksyncState, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getPageSize(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setPageSize(int pageSize, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getThreadedMode(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setThreadedMode(bool threadedMode, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getShowStatusPopup(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setShowStatusPopup(bool showStatusPopup, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getSslVerifyPeer(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setSslVerifyPeer(bool sslVerifyPeer, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void isLoggedIn(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void isSyncing(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void search(IReadOnlyDictionary<string, string> args, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void doSync(bool showStatusPopup, string queryParams, bool syncOnlyChangedSources, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void doSyncSource(string sourceName, bool showStatusPopup, string queryParams, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void login(string login, string password, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void logout(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void stopSync(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setNotification(string sourceName, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void clearNotification(string sourceName, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setObjectNotification(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void addObjectNotify(string sourceName, string object, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void cleanObjectNotify(IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getLastSyncObjectCount(string sourceName, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void setSourceProperty(string sourceName, string propertyName, string propertyValue, IMethodResult oResult)
        {
            // implement this method in C# here
        }

        public override void getSourceProperty(string sourceName, string propertyName, IMethodResult oResult)
        {
            // implement this method in C# here
        }
    }

    public class RhoConnectClientFactory : RhoConnectClientFactoryBase
    {
    }
}

}
