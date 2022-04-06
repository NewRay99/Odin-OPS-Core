param kvprivatednsname string = 'privatelink.vaultcore.azure.net'
param vnetId string
param autoVmRegistration bool = false

resource privateDnsZone_kv 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: kvprivatednsname
  location: 'global'
}

resource virtualNetworkLink_kv 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${privateDnsZone_kv.name}/${privateDnsZone_kv.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: autoVmRegistration
    virtualNetwork: {
      id: vnetId
    }
  }
}

param sasuffix string = environment().suffixes.storage
param saprivatednsname string = 'privatelink.blob.${sasuffix}'

resource privateDnsZone_sa 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: saprivatednsname
  location: 'global'
}

resource virtualNetworkLink_sa 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${privateDnsZone_sa.name}/${privateDnsZone_sa.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: autoVmRegistration
    virtualNetwork: {
      id: vnetId
    }
  }
}

param adlssuffix string = environment().suffixes.storage
param adlsprivatednsname string = 'privatelink.dfs.${adlssuffix}'

resource privateDnsZone_adls 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: adlsprivatednsname
  location: 'global'
}

resource virtualNetworkLink_adls 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${privateDnsZone_adls.name}/${privateDnsZone_adls.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: autoVmRegistration
    virtualNetwork: {
      id: vnetId
    }
  }
}

param sqlsuffix string = environment().suffixes.sqlServerHostname
var sqlprivatednsname = 'privatelink${sqlsuffix}'

resource privateDnsZone_sql 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: sqlprivatednsname
  location: 'global'
}

resource virtualNetworkLink_sql 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${privateDnsZone_sql.name}/${privateDnsZone_sql.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: autoVmRegistration
    virtualNetwork: {
      id: vnetId
    }
  }
}

param fssuffix string = environment().suffixes.storage
param fsprivatednsname string = 'privatelink.file.${fssuffix}'

resource privateDnsZone_fs 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: fsprivatednsname
  location: 'global'
}

resource virtualNetworkLink_fs 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${privateDnsZone_fs.name}/${privateDnsZone_fs.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: autoVmRegistration
    virtualNetwork: {
      id: vnetId
    }
  }
}

param adfsuffix string = 'datafactory.azure.net'
param adfprivatednsname string = 'privatelink.${adfsuffix}'

resource privateDnsZone_adf 'Microsoft.Network/privateDnsZones@2018-09-01' = {
  name: adfprivatednsname
  location: 'global'
}

resource virtualNetworkLink_adf 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2018-09-01' = {
  name: '${privateDnsZone_adf.name}/${privateDnsZone_adf.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: autoVmRegistration
    virtualNetwork: {
      id: vnetId
    }
  }
}

output outkvdnsId string = privateDnsZone_kv.id
output outsadnsId string = privateDnsZone_sa.id
output outsqldnsId string = privateDnsZone_sql.id
output outadfdnsId string = privateDnsZone_adf.id

