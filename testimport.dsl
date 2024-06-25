       defaultDeploymentTemplateShellApp = deploymentEnvironment "default deployment template" {
            shellDeploymentNode = deploymentNode "Infrastructure view: pattern Azure PostgreSQL" {
                infrastructureDeploymentNodesforPostfreSQL = deploymentNode "infra nodes for pattern postgreSQL" {
                    infraPostgreSQLProduct = infrastructureNode "infra node of PostfreSQL CPF Product"
                }
                    
            }
        }
