@description('Region where the Mobile Network will be deployed (must match the resource group region)')
param location string = resourceGroup().location

@description('Name of the Mobile Network to add a sim policy to')
param existingMobileNetworkName string

@description('Name of the existing slice to use for sim policy definition')
param existingSliceName string

@description('Name of the existing data network to use for sim policy definition')
param existingDataNetworkName string

@description('The name of the service')
param serviceName string = 'Allow-all-traffic'

@description('The Maximum Bit Rate (MBR) for uploads across all service data flows that will be included in data flow policy rules configured on the generic service')
param serviceUplinkMaximumBitRate string = '2 Gbps'

@description('The Maximum Bit Rate (MBR) for downloads across all service data flows that will be included in data flow policy rules configured on the generic service')
param serviceDownlinkMaximumBitRate string = '2 Gbps'

@description('The precendence value for the service being deployed.')
@maxValue(255)
@minValue(0)
param servicePrecedence int = 253

@description('The name of the traffic rule that will be created for this service.')
param trafficRuleName string = 'All-traffic'

@description('The precendence value for the traffic rule being created.')
@maxValue(255)
@minValue(0)
param trafficRulePrecedence int = 253

@description('Whether flows matching this traffic rule are permitted or blocked.')
@allowed([
  'Enabled'
  'Blocked'
])
param trafficControlOperation string = 'Enabled'

@description('Which protocols match this traffic rule. This should be either a list of IANA protocol numbers or the special value "any"')
param flowRuleProtocols array = [
  'ip'
]

@description('The direction of the flow to match with this traffic rule.')
@allowed([
  'Uplink'
  'Downlink'
  'Bidirectional'
])
param flowRuleDirection string = 'Bidirectional'

@description('The remote IP addresses that UEs will connect to for this flow. This should be either a list of IP addresses or the special value "any"')
param flowRuleRemoteIpList array = [
  'any'
]

@description('The name of the SIM policy')
param simPolicyName string = 'Default-policy'

@description('The Maximum Bit Rate (MBR) for uploads across all data flows for a paricular UE to which the data flow policy rules configured on the generic SIM policy apply')
param ueUplinkMaximumBitRate string = '2 Gbps'

@description('The Maximum Bit Rate (MBR) for downloads across all data flows for a paricular UE to which the data flow policy rules configured on the generic SIM policy apply')
param ueDownlinklinkMaximumBitRate string = '2 Gbps'

@description('The Maximum Bit Rate (MBR) for uploads across for a particular session for a paricular UE to which the data flow policy rules configured on the generic SIM policy apply')
param sessionUplinkMaximumBitRate string = '2 Gbps'

@description('The Maximum Bit Rate (MBR) for downloads across for a particular session for a paricular UE to which the data flow policy rules configured on the generic SIM policy apply')
param sessionDownlinkMaximumBitRate string = '2 Gbps'

resource existingMobileNetwork 'Microsoft.MobileNetwork/mobileNetworks@2022-03-01-preview' existing = {
  name: existingMobileNetworkName

  resource existingDataNetwork 'dataNetworks@2022-03-01-preview' existing = {
    name: existingDataNetworkName
  }

  resource existingSlice 'slices@2022-03-01-preview' existing = {
    name: existingSliceName
  }

  resource exampleService 'services@2022-03-01-preview' = {
    name: serviceName
    location: location
    properties: {
      servicePrecedence: servicePrecedence
      serviceQosPolicy: {
        maximumBitRate: {
          uplink: serviceUplinkMaximumBitRate
          downlink: serviceDownlinkMaximumBitRate
        }
      }
      pccRules: [
        {
          ruleName: trafficRuleName
          rulePrecedence: trafficRulePrecedence
          trafficControl: trafficControlOperation
          serviceDataFlowTemplates: [
            {
              templateName: trafficRuleName
              protocol: flowRuleProtocols
              direction: flowRuleDirection
              remoteIpList: flowRuleRemoteIpList
            }
          ]
        }
      ]
    }
  }

  resource exampleSimPolicy 'simPolicies@2022-03-01-preview' = {
    name: simPolicyName
    location: location
    properties: {
      ueAmbr: {
        uplink: ueUplinkMaximumBitRate
        downlink: ueDownlinklinkMaximumBitRate
      }
      defaultSlice: {
        id: existingSlice.id
      }
      sliceConfigurations: [
        {
          slice: {
            id: existingSlice.id
          }
          defaultDataNetwork: {
            id: existingDataNetwork.id
          }
          dataNetworkConfigurations: [
            {
              dataNetwork: {
                id: existingDataNetwork.id
              }
              sessionAmbr: {
                uplink: sessionUplinkMaximumBitRate
                downlink: sessionDownlinkMaximumBitRate
              }
              allowedServices: [
                {
                  id: exampleService.id
                }
              ]
            }
          ]
        }
      ]
    }
  }
}
