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
