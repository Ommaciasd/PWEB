# Changelog

## Version [1.0.0]

Initial release

### Date: 04/07/2023

- Deploy   : many instances for a list with the names of all the current Linux Apps in Nanaykuna for every enviroment.
- Integrate: Networking on Module for deploy.
- Migrate  : True for the new instances with the script from this module.

## Version [1.1.0]

Update release

### Date: 05/07/2023

- Integrate: Add Environment Variable "ASPNETCORE_ENVIRONMENT" for Application Settings in every Linux Web App with DotNet & Node.
- Integrate: Random String on Module Apps in Nanaykuna for nexts deploys.
- Integrate: Add Environment Variable "API_KEY_SECRET" for Application Settings in every Linux Web App with DotNet & Node.

![Alt text][node]

### Date: 23/11/2023

- Integrate: Add static web apps resource.

- Deploy   : Deploy static web apps resource.
![Alt text][node-swa]

[node]: ./src/img/png/node-settings.png
[node-swa]: ./src/img/png/node-static-web-app.png

### Date: 04/12/2023

- Fix: Resources exists on global resource's name!!!

![Alt text][swa]

[swa]: swa_blocked.png

### Date: 06/12/2023

- Fix: removing `virtual_network_subnet_id` association for Web App:
 (Site Name "" / Resource Group ""): web

 AppsClient#DeleteSwiftVirtualNetwork
 Failure sending request: StatusCode=409
 -- Original Error: autorest/azure: Service returned an error

```markdown
 Status=<nil></nil>
```

Run the following Azure's commands

```bash
az account set --subscription "$SUSCRIPTION_NAME"
az account show
az webapp show --name "$RESOURCE_NAME" --resource-group "$RESOURCE_GROUP_NAME"
```

```json
"inProgressOperationId": null,
```

if returns null, then

```bash
terraform init -upgrade
terraform apply -auto-approve 2>&1 | tee terraform_apply.log
cat terraform_apply.log
```
