infrastructureDeploymentNodesfor${APP_COMPONENT_NAME_ACRONYM} = deploymentNode "Grouping of infrastructure nodes from pattern Azure PostgreSQL" {
    subscriptionWideNetworkBoundaryfor${APP_COMPONENT_NAME_ACRONYM} = deploymentNode "Azure Subcription Network Boundary" {
        infraSecretMgmt${APP_COMPONENT_NAME} = infrastructureNode "Infra for Secret Mgmt" "Infrastrucutre Node for Secret Mgmt" {
            technology "Azure KeyVault"
        }
        infraCRUDAPIfor${APP_COMPONENT_NAME_ACRONYM} = infrastructureNode "Infra Node for CRUD API" {
            technology "Azure Functions"
        }

        tags "Network Boundary"
    }

    azureWideNetworkBoundaryfor${APP_COMPONENT_NAME_ACRONYM} = deploymentNode "Azure-wide Network Boundary" {
        infraDNSfor${APP_COMPONENT_NAME_ACRONYM} = infrastructureNode "Infra Node for Private DNS" "Infrastructure Node for Private DNS" {
            technology "Azure DNS"
        }
        
        tags "Network Boundary"
    }

    nonRoutableNetworkBoundaryfor${APP_COMPONENT_NAME_ACRONYM} = deploymentNode "Non-Routable Virtual Sub-net Boundary" {
        infraDatabasefor${APP_COMPONENT_NAME_ACRONYM} = infrastructureNode "Infra for Database" {
            technology "Azure PostgreSQL FlexServer"
            properties {
                "technology type" "PaaS"
            }
        }

        tags "Network Boundary"
    }
}

//Infra Node level Relationshp specifications

infraCRUDAPIfor${APP_COMPONENT_NAME_ACRONYM} -> infraSecretMgmt${APP_COMPONENT_NAME} "Secret Retrieval"

infraCRUDAPIfor${APP_COMPONENT_NAME_ACRONYM} -> infraDatabasefor${APP_COMPONENT_NAME_ACRONYM} "CRUD Business Logics"

infraDNSfor${APP_COMPONENT_NAME_ACRONYM} -> infraDatabasefor${APP_COMPONENT_NAME_ACRONYM} "Resolve DNS for" {
    tags "DNS Resolution"
}
infraCRUDAPIfor${APP_COMPONENT_NAME_ACRONYM} -> infraDNSfor${APP_COMPONENT_NAME_ACRONYM} "for Private DNS Resolution" {
    tags "DNS Resolution"
}
