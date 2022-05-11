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
param tags object

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: vaultName
  location: location
  tags: tags
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
/*
param AZGroupAccessGroup string = 's161-ESFADataScience-Managers USR'
resource AZRoleDefinition 'Microsoft.Authorization/roleDefinitions@2018-01-01-preview' existing = {
  name: AZGroupAccessGroup
}

//add s161-ESFADataScience-Managers USR to DBR
resource kVRoleAssign 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  scope: keyvault
  name: guid(keyvault.id, AZRoleDefinition.id, 'contributor')
  properties: {
    roleDefinitionId: AZRoleDefinition.id
    principalId: keyvault.id
    principalType: 'Group'
  }
  dependsOn: [
    AZRoleDefinition
  ]
}
*/
