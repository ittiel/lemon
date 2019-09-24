import * as awsx from "@pulumi/awsx";

// Create a load balancer to listen for requests and route them to the container.
let lb = new awsx.lb.NetworkListener("lemonade", { port: 8080 });

// Define the service, building and publishing our "../Dockerfile", and using the load balancer.
let service = new awsx.ecs.FargateService("lemonade", {
    desiredCount: 2,
    taskDefinitionArgs: {
        container: {
            image: "ittiel/lemon:latest",
            portMappings: [ lb ],
        },
    },
});

// Export the URL so we can easily access it.
export const url = lb.endpoint.hostname;