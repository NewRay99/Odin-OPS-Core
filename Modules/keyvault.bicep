param enabledForDeployment bool 
param enabledForTemplateDeployment bool 
param enabledForDiskEncryption bool 
param enableRbacAuthorization bool 
param softDeleteRetentionInDays int 
param networkAcls object 
param vaultName string  
param location string 
param sku string 
param tenant string
param accessPolicies array
param environment string

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: vaultName
  location: location
  tags: {
    Environment: environment
    Portfolio: 'Education and Skills Funding Agency'
    'Service Line': 'Data Science (CEDD)'
    Service: 'Business Intelligence (CEDD)'
    Product: 'Data Platform Infrastructure'
    'Parent Business': ''
    'Service Offering': 'ESFA Adopt Programme'
  }
  properties: {
    tenantId: tenant
    sku: {
      family: 'A'
      name: sku
    }
    accessPolicies: accessPolicies
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    softDeleteRetentionInDays: softDeleteRetentionInDays
    enableRbacAuthorization: enableRbacAuthorization
    networkAcls: networkAcls
  }
}

