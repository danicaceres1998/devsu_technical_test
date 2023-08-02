# How to Deploy to Kubernetes

For this case I have used Google Cloud to deploy all the services.

## Getting Started
### Prerequisites

- kubectl
- A K8s cluster ready for use

### Apply the manifests in the following order
To clarify, to apply the manifests you must use the command `kubectl apply -f #{TARGET}`.

- 00-namespace.yml
- database
- ingress
  - `sh 00-traefik-crd.sh`
  - After the CRD create you can apply the manifests listed on this directory
    - .
    - middlewares
    - routes
- secrets
  - For this step you have to create the following *.txt* files:
    - password.txt
    - secret-key.txt
    - user.txt
  - Then you can run this command `sh create_secrets.sh`
- Remain manifests:
  - 01-service.yml
  - 02-deployment.yml

## Arquitecture
In the following image you can access the architecture of the services that were implemented, a broad description of the kubernetes resources that were described on the diagram are:
- Cluster
- Load Balancer with a public IP
- Ingress
  - `Traefik` for k8s ingress controller
- Nodes
- Deployments

![Anotaciones de Trabajo-71](https://github.com/danicaceres1998/devsu_technical_test/assets/61253216/a6be4d83-aa0d-4922-89dc-dff45efd3ad0)
