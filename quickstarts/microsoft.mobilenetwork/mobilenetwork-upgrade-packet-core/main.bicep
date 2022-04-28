@description('Region where the mobile network will be deployed (must match the resource group region)')
param location string

@description('Name of the existing packet core control plane deployment in the mobile network')
param existingPacketCoreControlPlaneName string

@description('The packet core control plane software version to install on the site')
param packetCoreVersionString string

resource existingPacketCoreControlPlane 'Microsoft.MobileNetwork/packetCoreControlPlanes@2022-03-01-preview' existing = {
  name: existingPacketCoreControlPlaneName
}

resource updatedPacketCoreControlPlane 'Microsoft.MobileNetwork/packetCoreControlPlanes@2022-03-01-preview' = {
  name: existingPacketCoreControlPlaneName
  location: location
  properties: {
    version: packetCoreVersionString
    mobileNetwork: {
      id: existingPacketCoreControlPlane.properties.mobileNetwork.id
    }
    controlPlaneAccessInterface: {
      ipv4Address: existingPacketCoreControlPlane.properties.controlPlaneAccessInterface.ipv4Address
      ipv4Subnet: existingPacketCoreControlPlane.properties.controlPlaneAccessInterface.ipv4Subnet
      ipv4Gateway: existingPacketCoreControlPlane.properties.controlPlaneAccessInterface.ipv4Gateway
      name: existingPacketCoreControlPlane.properties.controlPlaneAccessInterface.name
    }
  }
}
