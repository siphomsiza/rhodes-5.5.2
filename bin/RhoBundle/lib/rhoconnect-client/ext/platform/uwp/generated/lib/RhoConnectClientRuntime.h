#pragma once

#include "../../../../shared/generated/cpp/IRhoConnectClient.h"
#include "api_generator/uwp/IMethodResult.h"

namespace rhoruntime
{
    public interface class IRhoConnectClientImpl
    {
    public:
        int64 getNativeImpl();
        void setNativeImpl(Platform::String^ strID, int64 native);
    };

    public interface class IRhoConnectClientSingletonImpl
    {
    public:
        void getUserName(IMethodResult^ oResult);
        void getPollInterval(IMethodResult^ oResult);
        void setPollInterval(int pollInterval, IMethodResult^ oResult);
        void getSyncServer(IMethodResult^ oResult);
        void setSyncServer(Platform::String^ syncServer, IMethodResult^ oResult);
        void getBulksyncState(IMethodResult^ oResult);
        void setBulksyncState(int bulksyncState, IMethodResult^ oResult);
        void getPageSize(IMethodResult^ oResult);
        void setPageSize(int pageSize, IMethodResult^ oResult);
        void getThreadedMode(IMethodResult^ oResult);
        void setThreadedMode(bool threadedMode, IMethodResult^ oResult);
        void getShowStatusPopup(IMethodResult^ oResult);
        void setShowStatusPopup(bool showStatusPopup, IMethodResult^ oResult);
        void getSslVerifyPeer(IMethodResult^ oResult);
        void setSslVerifyPeer(bool sslVerifyPeer, IMethodResult^ oResult);
        void isLoggedIn(IMethodResult^ oResult);
        void isSyncing(IMethodResult^ oResult);
        void search(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ args, IMethodResult^ oResult);
        void doSync(bool showStatusPopup, Platform::String^ queryParams, bool syncOnlyChangedSources, IMethodResult^ oResult);
        void doSyncSource(Platform::String^ sourceName, bool showStatusPopup, Platform::String^ queryParams, IMethodResult^ oResult);
        void login(Platform::String^ login, Platform::String^ password, IMethodResult^ oResult);
        void logout(IMethodResult^ oResult);
        void stopSync(IMethodResult^ oResult);
        void setNotification(Platform::String^ sourceName, IMethodResult^ oResult);
        void clearNotification(Platform::String^ sourceName, IMethodResult^ oResult);
        void setObjectNotification(IMethodResult^ oResult);
        void addObjectNotify(Platform::String^ sourceName, Platform::String^ object, IMethodResult^ oResult);
        void cleanObjectNotify(IMethodResult^ oResult);
        void getLastSyncObjectCount(Platform::String^ sourceName, IMethodResult^ oResult);
        void setSourceProperty(Platform::String^ sourceName, Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult);
        void getSourceProperty(Platform::String^ sourceName, Platform::String^ propertyName, IMethodResult^ oResult);
    };
    public interface class IRhoConnectClientFactoryImpl
    {
    public:
        IRhoConnectClientImpl^ getImpl(Platform::String^ id);
        IRhoConnectClientSingletonImpl^ getSingletonImpl();
    };

    public ref class RhoConnectClientRuntimeComponent sealed
    {
    public:
        RhoConnectClientRuntimeComponent(IRhoConnectClientImpl^ impl);
    private:
        IRhoConnectClientImpl^ _impl;
        int64 _cppImpl;
        int64 getCppImpl();
    };

    public ref class RhoConnectClientSingletonComponent sealed: public IRhoConnectClientSingletonImpl
    {
    public:
        RhoConnectClientSingletonComponent(IRhoConnectClientSingletonImpl^ impl);
        virtual void getUserName(IMethodResult^ oResult);
        virtual void getPollInterval(IMethodResult^ oResult);
        virtual void setPollInterval(int pollInterval, IMethodResult^ oResult);
        virtual void getSyncServer(IMethodResult^ oResult);
        virtual void setSyncServer(Platform::String^ syncServer, IMethodResult^ oResult);
        virtual void getBulksyncState(IMethodResult^ oResult);
        virtual void setBulksyncState(int bulksyncState, IMethodResult^ oResult);
        virtual void getPageSize(IMethodResult^ oResult);
        virtual void setPageSize(int pageSize, IMethodResult^ oResult);
        virtual void getThreadedMode(IMethodResult^ oResult);
        virtual void setThreadedMode(bool threadedMode, IMethodResult^ oResult);
        virtual void getShowStatusPopup(IMethodResult^ oResult);
        virtual void setShowStatusPopup(bool showStatusPopup, IMethodResult^ oResult);
        virtual void getSslVerifyPeer(IMethodResult^ oResult);
        virtual void setSslVerifyPeer(bool sslVerifyPeer, IMethodResult^ oResult);
        virtual void isLoggedIn(IMethodResult^ oResult);
        virtual void isSyncing(IMethodResult^ oResult);
        virtual void search(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ args, IMethodResult^ oResult);
        virtual void doSync(bool showStatusPopup, Platform::String^ queryParams, bool syncOnlyChangedSources, IMethodResult^ oResult);
        virtual void doSyncSource(Platform::String^ sourceName, bool showStatusPopup, Platform::String^ queryParams, IMethodResult^ oResult);
        virtual void login(Platform::String^ login, Platform::String^ password, IMethodResult^ oResult);
        virtual void logout(IMethodResult^ oResult);
        virtual void stopSync(IMethodResult^ oResult);
        virtual void setNotification(Platform::String^ sourceName, IMethodResult^ oResult);
        virtual void clearNotification(Platform::String^ sourceName, IMethodResult^ oResult);
        virtual void setObjectNotification(IMethodResult^ oResult);
        virtual void addObjectNotify(Platform::String^ sourceName, Platform::String^ object, IMethodResult^ oResult);
        virtual void cleanObjectNotify(IMethodResult^ oResult);
        virtual void getLastSyncObjectCount(Platform::String^ sourceName, IMethodResult^ oResult);
        virtual void setSourceProperty(Platform::String^ sourceName, Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult);
        virtual void getSourceProperty(Platform::String^ sourceName, Platform::String^ propertyName, IMethodResult^ oResult);
    private:
        IRhoConnectClientSingletonImpl^ _impl;
    };

    public ref class RhoConnectClientFactoryComponent sealed
    {
    public:
        static void setImpl(IRhoConnectClientFactoryImpl^ impl);
    };
}
