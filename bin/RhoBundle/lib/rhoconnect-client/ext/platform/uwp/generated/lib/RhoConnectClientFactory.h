#pragma once

#include "../../../../shared/generated/cpp/RhoConnectClientBase.h"
#include "RhoConnectClientRuntime.h"


namespace rho {
class CRhoConnectClientFactory: public CRhoConnectClientFactoryBase
{
private:
    static rhoruntime::IRhoConnectClientFactoryImpl^ _impl;
public:
    static void setImpl(rhoruntime::IRhoConnectClientFactoryImpl^ impl) { _impl = impl; }
    ~CRhoConnectClientFactory(){}
    virtual IRhoConnectClientSingleton* createModuleSingleton();
    virtual IRhoConnectClient* createModuleByID(const rho::String& strID);
};

}
