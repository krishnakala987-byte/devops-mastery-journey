## 5. Step-by-Step Project Implementation

Step 1: Build Docker Image
docker build -t krishna2915/python-sample-app-demo:v1 .

---

Step 2: Create Deployment
kubectl apply -f deployment.yml

---

Step 3: Fix Image Issue (if any)
eval $(minikube docker-env)
docker build -t krishna2915/python-sample-app-demo:v1 .

---

Step 4: Verify Pods
kubectl get pods -o wide

---

Step 5: Create Service (NodePort)
kubectl expose deployment sample-python-app --type=NodePort --port=8000

---

Step 6: Access Application
minikube service python-django-app-service

Use URL:
http://127.0.0.1:<port>/demo

---

Step 7: Convert to LoadBalancer

Edit YAML:
type: LoadBalancer

Apply:
kubectl apply -f service.yml

Run:
minikube tunnel

---

Step 8: Verify Load Balancing (Logs Method)

Terminal 1:
kubectl logs -f <pod1>

Terminal 2:
kubectl logs -f <pod2>

Run:
for i in {1..20}; do curl http://127.0.0.1:<port>/demo/; sleep 1; done

Result:
- Logs visible in both terminals
- Load balancing confirmed

---

Step 9: Verify Using KubeShark

Open:
http://127.0.0.1:8899

Apply filter:
/demo

Check:
Requests going to different pod IPs

---

## 6. Problems Faced & Troubleshooting

Problem: ImagePullBackOff
Cause: Image not available
Solution:
eval $(minikube docker-env)
docker build -t <image> .

---

Problem: Browser not working
Cause: Wrong port or WSL issue
Solution:
minikube service <service-name>

---

Problem: EXTERNAL-IP pending
Cause: Tunnel not running
Solution:
minikube tunnel

---

Problem: Curl works but browser doesn’t
Cause: Network isolation
Solution:
Use Minikube service URL

---

Problem: YAML not updating
Cause: Old config reused
Solution:
Rewrite and apply again

---

Problem: KubeShark confusion
Cause: Too much traffic
Solution:
Use filter /demo or use logs method

---

## 7. Mistakes & Things to Remember

- Pod IP is internal only
- Always use Service to access app
- Labels must match selectors exactly
- NodePort may not work directly in WSL browser
- Always use Minikube service URL
- LoadBalancer requires tunnel
- Ports change frequently
- Kubernetes cannot access local images (except Minikube)
- Logs method is easiest to verify load balancing

---

## 8. Quick Revision Summary

- Pods are temporary → Service provides stability
- Service uses labels to find pods
- NodePort exposes application externally
- LoadBalancer gives external access (needs tunnel)
- kube-proxy handles load balancing
- Pod IP works only inside cluster
- Load balancing = traffic reaches multiple pods
