//Global Parameters
//param resourcePrefix string
param resourcegroupname string
param location string
param environment string
//param corerg string = 's161d01-core'
//param corevnet string = 's161d01-core-vn-01'
param keyVaultName string
param keyVaultSKU string
param softDeleteRetentionInDays int

//Action Group
//var actionGroupName = '${resourcePrefix}-ag-mgr'
//param actionGroupEmail string 

//module actiongp 'Modules/actionGroup.bicep' = {
//  scope: resourceGroup('${resourcegroupname}')
//  name: 'actiongp'
//  params: {
//    actionGroupName: actionGroupName
//    actionGroupEmail: actionGroupEmail
//    environment: environment
// }
//}

//Key Vault - MOVE TO PARAM FILE
param tenantId string
param objectId string
param enabledForDeployment bool = true
param enabledForTemplateDeployment bool = true
param enabledForDiskEncryption bool = true
param enableRbacAuthorization bool = false

param networkAcls object = {
  ipRules: []
  virtualNetworkRules: []
}

param tenant string = tenantId 
param accessPolicies array = [
  {
    tenantId: tenant
    objectId: objectId 
    permissions: {
      keys: [
        'Get'
        'List'
        'Update'
        'Create'
        'Import'
        'Delete'
        'Recover'
        'Backup'
        'Restore'
      ]
      secrets: [
        'Get'
        'List'
        'Set'
        'Delete'
        'Recover'
        'Backup'
        'Restore'
      ]
      certificates: [
        'Get'
        'List'
        'Update'
        'Create'
        'Import'
        'Delete'
        'Recover'
        'Backup'
        'Restore'
        'ManageContacts'
        'ManageIssuers'
        'GetIssuers'
        'ListIssuers'
        'SetIssuers'
        'DeleteIssuers'
      ]
    }
  }
]

module kv 'Modules/keyvault.bicep' = {
  scope: resourceGroup('${resourcegroupname}')
  name: 'kv'
  params: {
    enabledForDeployment: enabledForDeployment
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enableRbacAuthorization: enableRbacAuthorization
    softDeleteRetentionInDays: softDeleteRetentionInDays
    networkAcls: networkAcls
    vaultName: keyVaultName
    location: location
    sku: keyVaultSKU
    tenant: tenant
    accessPolicies: accessPolicies
    environment: environment
 }
}

//resource corevnetid 'Microsoft.Network/virtualNetworks@2020-07-01' existing = {
//  name: corevnet
//  scope: resourceGroup(corerg)
//}

//module dns 'Modules/privatednszone.bicep' = {
//  scope: resourceGroup('${resourcegroupname}')
//  name: 'dns'
// params: {
//    vnetId: corevnetid.id
   //vnetId: '/subscriptions/81703de1-ec12-47e5-91f8-ef521199196e/resourceGroups/s161d01-core/providers/Microsoft.Network/virtualNetworks/s161d01-core-vn-01'
//  }
//}
