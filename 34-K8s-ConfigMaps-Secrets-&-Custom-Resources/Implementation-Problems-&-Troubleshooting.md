## 1. Step-by-Step Implementation

Step 1: Create ConfigMap
kubectl apply -f cm.yml

Step 2: Verify
kubectl get cm
kubectl describe cm test-cm

Step 3: Deploy App
kubectl apply -f deployment.yml

Step 4: Check Pod
kubectl get pods

Step 5: Enter Pod
kubectl exec -it <pod-name> -- /bin/bash

Step 6: Check ENV
env | grep DB

Step 7: Check Volume
ls /opt
cat /opt/db-port

Step 8: Update ConfigMap
kubectl edit cm test-cm

Step 9: Verify change (volume auto-updates)

Step 10: Create Secret
kubectl create secret generic test-secret --from-literal=db-port="3306"

Step 11: Decode Secret
echo MzMwNg== | base64 --decode

---

## 5. Problems & Troubleshooting

Problem: kubectl apply failed (connection refused)
Cause: Cluster not running
Solution: Start minikube/kind

Problem: YAML error
Cause: Wrong indentation
Solution: Fix spacing

Problem: Config not updating
Cause: Using ENV method
Solution: Restart deployment or use volume

Problem: File not found
Cause: Wrong path
Solution: Use ls /opt

---

## 6. Mistakes & Things to Remember

- YAML indentation is very important
- ENV variables do not auto-update
- Volume method auto-updates
- Secrets are base64, not encrypted
- Always verify inside container
- Use underscore in env variables
- Always debug using kubectl exec

---

## 7. Quick Revision

ConfigMap = non-sensitive  
Secret = sensitive  

ENV = static  
Volume = dynamic  

os.getenv() = read config  

cat /opt/db-port = read file  

kubectl exec = debug  

rollout restart = refresh pods  

---

## Custom Resources (CRD, CR, Controller)

Kubernetes supports extension using custom resources.

CRD:
Defines new resource type

CR:
Actual object created

Controller:
Watches CR and takes action

Flow:
CRD → CR → Controller

Example:
Istio, ArgoCD, Keycloak

DevOps workflow:
1. Install CRD
2. Install Controller
3. Create CR

Debug:
- Check controller logs
- Check resource status

Language:
Golang preferred

Final:
CRD = define  
CR = use  
Controller = execute
