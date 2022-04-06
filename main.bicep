//Global Parameters
param tenantId string
param objectId string
param resourcegroupname string
param location string
param environment string
param keyVaultName string
param keyVaultSKU string
param softDeleteRetentionInDays int
param enabledForDeployment bool 
param enabledForTemplateDeployment bool
param enabledForDiskEncryption bool
param enableRbacAuthorization bool 

var tags = {
  Environment: environment
  Portfolio: 'Education and Skills Funding Agency'
  'Service Line': 'Data Operations'
  Service: 'Business Intelligence'
  Product: 'ESFA Adopt Programme'
  'Service Offering': 'ESFA Adopt Programme'
}

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
    tags: tags
 }
}

