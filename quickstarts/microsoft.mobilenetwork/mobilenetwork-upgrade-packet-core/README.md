# Create new site

![Azure Public Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/PublicLastTestDate.svg)
![Azure Public Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/PublicDeployment.svg)

![Azure US Gov Last Test Date](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/FairfaxLastTestDate.svg)
![Azure US Gov Last Test Result](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/FairfaxDeployment.svg)

![Best Practice Check](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/BestPracticeResult.svg)
![Cred Scan Check](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/CredScanResult.svg)

![Bicep Version](https://azurequickstartsservice.blob.core.windows.net/badges/quickstarts/microsoft.mobilenetwork/mobilenetwork-upgrade-packet-core/BicepVersion.svg)

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.mobilenetwork%2Fmobilenetwork-upgrade-packet-core%2Fazuredeploy.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.mobilenetwork%2Fmobilenetwork-upgrade-packet-core%2Fazuredeploy.json)

This template upgrades the packet core software on an existing site in a Mobile Network. This process will cause loss of service for up to one hour, so must be performed during a maintenance window.

## Prerequisites

You must have an existing site deployment running on ASE that is ready to be upgraded.

- If you need to create a complete mobile network then start with https://azure.microsoft.com/en-gb/resources/templates/mobilenetwork-create-full-5gc-deployment/
- If you already have a mobile network then you can deploy a site with https://azure.microsoft.com/en-gb/resources/templates/mobilenetwork-create-new-site/

## Deployment steps

You can click the "deploy to Azure" button at the beginning of this document or follow the instructions for command line deployment using the scripts in the root of this repo.

`Tags: Azure Private 5G Core, Resource Manager templates, ARM templates`