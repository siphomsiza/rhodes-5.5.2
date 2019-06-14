#include "common/RhodesApp.h"
#include "api_generator/uwp/MethodResultImpl.h"
#include "../../../../shared/generated/cpp/RhoConnectClientBase.h"
#include "RhoConnectClientRuntime.h"
#include "../../uwp/rhoruntime/common/RhoConvertWP8.h"


namespace rho {

class CRhoConnectClientImpl: public CRhoConnectClientBase
{
private:
    rhoruntime::IRhoConnectClientImpl^ _runtime;
public:
    CRhoConnectClientImpl(const rho::String& strID, rhoruntime::IRhoConnectClientImpl^ runtime): CRhoConnectClientBase(), _runtime(runtime)
    {
        _runtime->setNativeImpl(rho::common::convertStringToWP8(strID), (int64)this);
    }

};

}
