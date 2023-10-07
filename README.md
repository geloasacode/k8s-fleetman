# 3-Tier App Deployment with ArgoCD and Kubernetes on Docker Desktop

## Prerequisites

Before you begin, ensure you have the following prerequisites installed:

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Setup

1. **Start Docker Desktop**:

   Ensure Docker Desktop is running on your local machine.

2. **Install ArgoCD**:

   Deploy ArgoCD to your Docker Desktop Kubernetes cluster in your Default namespace:

   ```bash
   wget https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -O argocd-namespace-default.yaml
   kubectl apply -f argocd-namespace-default.yaml
   ```

3. **Port Forward ArgoCD UI**:

   To access the ArgoCD web UI, port forward the service:

   ```bash
   kubectl port-forward svc/argocd-server 8081:443
   ```

   Access the ArgoCD UI at `https://localhost:8081` in your web browser. Log in with the default username (username: `admin`). For password, generate password using the below command:
   
   ```bash
   kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
   ```

4. **Create an Argo CD application manifest** 

   In this example, I stored it in application.yaml. This manifest file essentially tells Argo CD to deploy the contents of the Git repository at the specified path to the target Kubernetes cluster and namespace, with the specified synchronization options.

5. **Deploy the 3-Tier App**:

   Deploy the 3-tier application using kubectl:

   ```bash
   kubectl apply -f application.yaml
   ```

## Accessing the Application

Once the application is deployed, you can access it in your Docker Desktop Kubernetes cluster. Depending on your app's configuration, you may need to retrieve service URLs or ingress endpoints. Provide instructions on how to access your specific app here.

## Cleanup

To remove the deployed application and resources:

```bash
kubectl delete -f application.yaml
kubectl delete -f argocd-namespace-default.yaml
cd main-app/ ; kubectl delete -f .
```

## Additional Resources

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
