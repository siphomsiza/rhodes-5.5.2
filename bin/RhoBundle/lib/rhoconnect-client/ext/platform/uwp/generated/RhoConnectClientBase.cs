using System;
using System.Collections.Generic;
using System.Net;
using Windows.UI.Core;
using System.Threading.Tasks;
using rhoruntime;
using rhodes;

namespace rho {

namespace RhoConnectClientImpl
{
    abstract public class RhoConnectClientBase : IRhoConnectClientImpl
    {
        protected string _strID = "1";
        protected long _nativeImpl = 0;
        protected CoreDispatcher dispatcher = null;
        protected RhoConnectClientRuntimeComponent _runtime;

        public RhoConnectClientBase(string id)
        {
            _strID = id;
            _runtime = new RhoConnectClientRuntimeComponent(this);
            try{dispatcher = MainPage.getDispatcher();
            }catch(Exception e){deb("Can't get access to dispatcher");}
        }

        public static void deb(String s, [System.Runtime.CompilerServices.CallerMemberName] string memberName = "")
        {
            if (memberName.Length != 0) {memberName = memberName + " : ";}
            System.Diagnostics.Debug.WriteLine(memberName + s);
        }

        public long getNativeImpl()
        {
            return _nativeImpl;
        }

        public virtual void setNativeImpl(string strID, long native)
        {
            _strID = strID;
            _nativeImpl = native;
        }

        public void dispatchInvoke(Action a)
        {
            if (dispatcher != null) {
              var ignore = dispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
              {try{a();} catch (Exception ex) {System.Diagnostics.Debug.WriteLine("Invoke in UI Thread exception");} });
            }else{a();}
        }

    }

    abstract public class RhoConnectClientSingletonBase : IRhoConnectClientSingletonImpl
    {

        protected SortedDictionary<string, RhoConnectClientBase> keeper = new SortedDictionary<string, RhoConnectClientBase>();

        public IRhoConnectClientImpl getRhoConnectClientByID(string id)
        {
            if (keeper.ContainsKey(id))
            {
                return keeper[id];
            }
            else
            {
                RhoConnectClientBase impl = new RhoConnectClient(id);
                keeper.Add(id, impl);
                return impl;
            }
        }

        protected RhoConnectClientSingletonComponent _runtime;

        public RhoConnectClientSingletonBase()
        {
              try{dispatcher = MainPage.getDispatcher();
              }catch(Exception e){deb("Can't get access to dispatcher");}
              _runtime = new RhoConnectClientSingletonComponent(this);
        }

        public static void deb(String s, [System.Runtime.CompilerServices.CallerMemberName] string memberName = "")
        {
            if (memberName.Length != 0) {memberName = memberName + " : ";}
            System.Diagnostics.Debug.WriteLine(memberName + s);
        }

        public void dispatchInvoke(Action a)
        {
            if (dispatcher != null) {
              var ignore = dispatcher.RunAsync(CoreDispatcherPriority.Normal, () =>
              {try{a();} catch (Exception ex) {System.Diagnostics.Debug.WriteLine("Invoke in UI Thread exception");} });
            }else{a();}
        }
        protected CoreDispatcher dispatcher = null;


        abstract public void getUserName(IMethodResult oResult);
        abstract public void getPollInterval(IMethodResult oResult);
        abstract public void setPollInterval(int pollInterval, IMethodResult oResult);
        abstract public void getSyncServer(IMethodResult oResult);
        abstract public void setSyncServer(string syncServer, IMethodResult oResult);
        abstract public void getBulksyncState(IMethodResult oResult);
        abstract public void setBulksyncState(int bulksyncState, IMethodResult oResult);
        abstract public void getPageSize(IMethodResult oResult);
        abstract public void setPageSize(int pageSize, IMethodResult oResult);
        abstract public void getThreadedMode(IMethodResult oResult);
        abstract public void setThreadedMode(bool threadedMode, IMethodResult oResult);
        abstract public void getShowStatusPopup(IMethodResult oResult);
        abstract public void setShowStatusPopup(bool showStatusPopup, IMethodResult oResult);
        abstract public void getSslVerifyPeer(IMethodResult oResult);
        abstract public void setSslVerifyPeer(bool sslVerifyPeer, IMethodResult oResult);
        abstract public void isLoggedIn(IMethodResult oResult);
        abstract public void isSyncing(IMethodResult oResult);
        abstract public void search(IReadOnlyDictionary<string, string> args, IMethodResult oResult);
        abstract public void doSync(bool showStatusPopup, string queryParams, bool syncOnlyChangedSources, IMethodResult oResult);
        abstract public void doSyncSource(string sourceName, bool showStatusPopup, string queryParams, IMethodResult oResult);
        abstract public void login(string login, string password, IMethodResult oResult);
        abstract public void logout(IMethodResult oResult);
        abstract public void stopSync(IMethodResult oResult);
        abstract public void setNotification(string sourceName, IMethodResult oResult);
        abstract public void clearNotification(string sourceName, IMethodResult oResult);
        abstract public void setObjectNotification(IMethodResult oResult);
        abstract public void addObjectNotify(string sourceName, string object, IMethodResult oResult);
        abstract public void cleanObjectNotify(IMethodResult oResult);
        abstract public void getLastSyncObjectCount(string sourceName, IMethodResult oResult);
        abstract public void setSourceProperty(string sourceName, string propertyName, string propertyValue, IMethodResult oResult);
        abstract public void getSourceProperty(string sourceName, string propertyName, IMethodResult oResult);
    }

    public class RhoConnectClientFactoryBase : IRhoConnectClientFactoryImpl
    {
        protected static RhoConnectClientSingleton instance = null;
        public virtual IRhoConnectClientImpl getImpl(string id) {
            getSingletonImpl();
            return instance.getRhoConnectClientByID(id);
        }
        public IRhoConnectClientSingletonImpl getSingletonImpl() {
            if (instance == null){instance = new RhoConnectClientSingleton();}
            return instance;
          
        }
    }
}

}
