// RhoConnectClientRuntime.cpp
#include "RhoConnectClientRuntime.h"
#include "RhoConnectClientFactory.h"
#include "RhoConnectClient_impl.h"
#include "../../uwp/rhoruntime/common/RhoConvertWP8.h"

using namespace Platform;
using namespace rho::apiGenerator;

using namespace rho;

namespace rhoruntime
{

RhoConnectClientRuntimeComponent::RhoConnectClientRuntimeComponent(IRhoConnectClientImpl^ impl):
    _impl(impl), _cppImpl(0)
{
    // TODO: implement runtime component constructor
}

int64 RhoConnectClientRuntimeComponent::getCppImpl()
{
    if (_cppImpl == 0)
    {
        _cppImpl = _impl->getNativeImpl();
    }
    return _cppImpl;
}

RhoConnectClientSingletonComponent::RhoConnectClientSingletonComponent(IRhoConnectClientSingletonImpl^ impl):
    _impl(impl)
{
    // TODO: implement singleton component constructor
}

void RhoConnectClientSingletonComponent::getUserName(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getUserName(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getPollInterval(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getPollInterval(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setPollInterval(int pollInterval, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setPollInterval(pollInterval, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getSyncServer(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getSyncServer(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setSyncServer(Platform::String^ syncServer, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setSyncServer(rho::common::convertStringAFromWP8(syncServer), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getBulksyncState(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getBulksyncState(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setBulksyncState(int bulksyncState, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setBulksyncState(bulksyncState, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getPageSize(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getPageSize(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setPageSize(int pageSize, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setPageSize(pageSize, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getThreadedMode(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getThreadedMode(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setThreadedMode(bool threadedMode, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setThreadedMode(threadedMode, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getShowStatusPopup(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getShowStatusPopup(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setShowStatusPopup(bool showStatusPopup, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setShowStatusPopup(showStatusPopup, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getSslVerifyPeer(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getSslVerifyPeer(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setSslVerifyPeer(bool sslVerifyPeer, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setSslVerifyPeer(sslVerifyPeer, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::isLoggedIn(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->isLoggedIn(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::isSyncing(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->isSyncing(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::search(Windows::Foundation::Collections::IMapView<Platform::String^, Platform::String^>^ args, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->search(rho::common::convertHashFromWP8(args), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::doSync(bool showStatusPopup, Platform::String^ queryParams, bool syncOnlyChangedSources, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->doSync(showStatusPopup, rho::common::convertStringAFromWP8(queryParams), syncOnlyChangedSources, *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::doSyncSource(Platform::String^ sourceName, bool showStatusPopup, Platform::String^ queryParams, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->doSyncSource(rho::common::convertStringAFromWP8(sourceName), showStatusPopup, rho::common::convertStringAFromWP8(queryParams), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::login(Platform::String^ login, Platform::String^ password, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->login(rho::common::convertStringAFromWP8(login), rho::common::convertStringAFromWP8(password), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::logout(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->logout(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::stopSync(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->stopSync(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setNotification(Platform::String^ sourceName, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setNotification(rho::common::convertStringAFromWP8(sourceName), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::clearNotification(Platform::String^ sourceName, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->clearNotification(rho::common::convertStringAFromWP8(sourceName), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setObjectNotification(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setObjectNotification(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::addObjectNotify(Platform::String^ sourceName, Platform::String^ object, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->addObjectNotify(rho::common::convertStringAFromWP8(sourceName), rho::common::convertStringAFromWP8(object), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::cleanObjectNotify(IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->cleanObjectNotify(*(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getLastSyncObjectCount(Platform::String^ sourceName, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getLastSyncObjectCount(rho::common::convertStringAFromWP8(sourceName), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::setSourceProperty(Platform::String^ sourceName, Platform::String^ propertyName, Platform::String^ propertyValue, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->setSourceProperty(rho::common::convertStringAFromWP8(sourceName), rho::common::convertStringAFromWP8(propertyName), rho::common::convertStringAFromWP8(propertyValue), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientSingletonComponent::getSourceProperty(Platform::String^ sourceName, Platform::String^ propertyName, IMethodResult^ oResult)
{
    //((CRhoConnectClientImpl*)getCppImpl())->getSourceProperty(rho::common::convertStringAFromWP8(sourceName), rho::common::convertStringAFromWP8(propertyName), *(CMethodResult*)(oResult->getNative()));
}

void RhoConnectClientFactoryComponent::setImpl(IRhoConnectClientFactoryImpl^ impl)
{
    CRhoConnectClientFactory::setImpl(impl);
}

}