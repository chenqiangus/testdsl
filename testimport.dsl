
            ${APP_COMPONENT_NAME}DeploymentNode = deploymentNode "Infrastructure view: pattern Azure PostgreSQL" {
                infrastructureDeploymentNodesfor${APP_COMPONENT_NAME_ACRONYM} = deploymentNode "infra nodes for pattern postgreSQL" {
                    infra${APP_COMPONENT_NAME} = infrastructureNode "infra node of PostfreSQL CPF Product"
                }
                    
            }
