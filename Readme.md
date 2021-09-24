1) Add global.json file if you want to change the default .net version in the prject
   dotnet new
2) Create the web api project using CLI command
   dotnet new webapi -n myterraformwebapi
3) Add docker file to the project to build the image of the web api
   docker build -t vipindocker1/myterraformwebapi .
4) Test the image on local machine
   docker run -p 8080:80 vipindocker1/myterraformwebapi:latest
5) Push the image to your docker hub account
docker push vipindocker1/myterraformwebapi:latest
6) setup github repository
   create a new repository into github or azure devops etc..
7)Intialize the project folder with github
   git init
8)add all the files to git and commit locally
   git status (this can be used to check which files needs to be added)
   git add .
   git commit -m "commit messsage"
9)push to remote github repository created in step 6
   git remote add origin 'your_url_name 
   git push -u origin master
10)Download terraform https://www.terraform.io/downloads.html
11) Add the folder path to terraform exe in Environment variables  = > system variable => Path
12) Install Azure CLI https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
13) Add azure terraform extension, HashiCorp Terraform for visual studio code
14) add the main.tf file and add the provider, resource group, container
15) add the init command 
terraform init
az login 
az account set --subscription befc9deb-ffbe-4198-8518-e64741c6f5f7
terraform plan
terraform apply
16)create a service pricipal to create resources in azure and give subscription level contributor access to this SP
goto AAD => Appregistration => Create new APP => Create new secret
17) Copy ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID and add it onto environemnt user variables for your machine. 
setx variablename value

setx ARM_CLIENT_ID 94834485-d7ac-41bb-8126-8f84712fdaf1
setx ARM_CLIENT_SECRET Phj7Q~mAHoz2Fu0RJ9izlPa04UBao5Ay2xQZt
setx ARM_TENANT_ID e9f1b7d9-dbf9-4b5a-9b98-fc3918d9dec0
setx ARM_SUBSCRIPTION_ID befc9deb-ffbe-4198-8518-e64741c6f5f7

18)run terraform apply again
==============================Azure Devops Setup==================================
19) Got azure devops microsoft portal Create new project 
20)Goto project setting => create service connections to docker hub and azure resource manager
21)create a pipline add github respository