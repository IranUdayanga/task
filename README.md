Document Summary ----------------
The document provides a comprehensive guide for provisioning an Azure Key Vault using Terraform scripts and GitHub Actions. It outlines the steps to automate the deployment process and ensure consistency and reliability in managing Azure resources.

Here's a summary of the key points covered in the document:

01. Objective: The primary goal is to deploy an Azure Key Vault securely using Terraform and automate the deployment process using GitHub Actions.

02. Tools Used: The document utilizes Terraform for infrastructure as code (IaC) to define and provision Azure resources and GitHub Actions for continuous integration and deployment (CI/CD).

03. Terraform Configuration: It provides Terraform configuration files (main.tf, variables.tf, outputs.tf) to define the Azure Key Vault resource, including its properties, such as name, location, access policies, and permissions.

04 GitHub Actions Workflow: A GitHub Actions workflow file (deploy_key_vault.yml) is included to automate the deployment process. It triggers the Terraform commands to initialize, plan, and apply the infrastructure changes.

05 Azure Service Principal: Guidance is provided on how to create an Azure service principal, which is required for authenticating Terraform with Azure during deployment. The document outlines steps for creating the service principal using Azure CLI or Azure Portal and obtaining the necessary credentials (client ID, client secret).

06. GitHub Secrets: It emphasizes the importance of securely storing sensitive information, such as service principal credentials, as GitHub Secrets. These secrets are then used within the GitHub Actions workflow to authenticate with Azure.

07 Execution: 
--------------------


Terraform Configuration

main.tf:
This file contains the actual Terraform configuration to define the Azure Key Vault resource and its properties. Here's a breakdown of what it typically includes:
Provider Configuration: Defines the Azure provider and any necessary configurations, such as specifying the Azure region.
Resource Configuration: Specifies the Azure Key Vault resource using the azurerm_key_vault resource block. Within this block, you define properties such as name, location, resource group, SKU, access policies, and other settings related to the Key Vault.

Access Policies: Within the azurerm_key_vault resource block, you can define access policies for managing access to the Key Vault. This includes specifying permissions for different entities, such as users, groups, or service principals.

variables.tf:
This file is used to declare input variables that are used within the Terraform configuration. It allows for parameterizing the configuration to make it more flexible and reusable. Here's what it typically includes:
Input Variables: Declares input variables such as key_vault_name, location, resource_group_name, sku_name, tenant_id, object_id, etc. These variables represent values that may vary between different deployments or environments.

Variable Types and Defaults: Optionally, you can specify the type of each variable and provide default values if desired.

outputs.tf:
This file is used to define output values that you want to extract from the deployed Azure resources. Outputs can be useful for retrieving information about resources after they have been provisioned. Here's what it typically includes:

Output Variables: Declares output variables such as key_vault_id, key_vault_uri, key_vault_name, etc. These variables represent information you want to extract from the deployed Azure Key Vault resource.

Value Extraction: Specifies how to extract the desired information from the Azure Key Vault resource. This typically involves referencing attributes of the resource using interpolation syntax.
---------------------------------------------------------------------

Azure Service Principal:

Using Azure CLI:
Log in to Azure: Run the following command to log in to your Azure account:

az login

Create the Service Principal: Run the following command to create the service principal.

az ad sp create-for-rbac --name <SP_NAME>
Replace <SP_NAME> with the name you want to give to your service principal.

Note down the Credentials, output the details of the service principal, including the appId (client ID) and password (client secret).
-----------------------------------------------------------------------

GitHub Secrets

To add a secret to your repository:

Navigate to GitHub repository.
>Go to the "Settings" tab.
>In the left sidebar, click on "Secrets".
>Click on the "New repository secret" button.
>Enter a name for your secret (e.g.,CLIENT_ID,CLIENT_SECRET, SUBSCRIPTION_ID, TENANT_ID ) and paste the value from SP_NAME creation steup into the "Value" field.
>Click on "Add secret" to save the secret.


--------------------------------------------------------------------------
Execution of workflow
Trigger Workflow: Navigate to the "Actions" tab in your repository, select the desired workflow ("Deploy Key Vault"), and manually trigger it by clicking "Run workflow".

