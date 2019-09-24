# Lemon
Assignment from Igor

## Assignment
1. Choose an exotic programming language (haskel, erlang, elixir, crystal, etc.)
	* [Haskell] selected (https://www.haskell.org/ "Haskell")
2. Implement a simple web server that replies with an html/json response describing 
  the received request (headers, path, host, body, etc.):
   Example: { host: 'lambda.aws.....', headers: { "Content-Type": "application/json" }, body: "", ... }
	* ** TODO:** Currently returns values as strings, need to convert values and return as Json
	* **TODO:** Parse Headers? or return as is to Json
	* Supports GET and POST requests
3. Create a docker file for this service.
	* Done
4. Create a pulumi (https://www.pulumi.com/) stack that will deploy the service to AWS (EC2 instance, EKS, Fargate, whatever...) and will have an output of the url of the deployed service.
	* Fargate selected 
	
	
## Build and run localy (dev)
Install dependencies:
```cabal install --only-dependencies```
Run:
``` cabal run```

## Build and push Docker
Open project on Docker hub
https://cloud.docker.com/repository/docker/ittiel/lemon

```docker build -t ittiel/lemon:latset ```
```docker push ittiel/lemon:latset ```

## Deploy on AWS Fargate
Using pulumi, assuming AWS configuration exists
Pulumi configuraton is in the pulumi fodler
Create and deploy:
```pulumi up```
**Output returns the LB address for the service**
Destroy:
```pulumi destroy```

## Test (manually)
Using curl:
curl --data '{"username":"xyz","password":"xy1"}'  [LB Address]:8080/foo/bar
or
curl [LB Address]:8080/foo/bar
