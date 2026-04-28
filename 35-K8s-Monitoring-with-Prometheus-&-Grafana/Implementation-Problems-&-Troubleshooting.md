# 1. Step-by-Step Implementation

Step 1:
kubectl get pods

Step 2:
kubectl get svc

Step 3:
Open app:
http://localhost:<NodePort>

Step 4:
kubectl get endpoints sample-python-service

Step 5 (Fix if needed):
kubectl delete svc sample-python-service

kubectl expose deployment sample-python-app \
  --type=NodePort \
  --port=80 \
  --target-port=8000 \
  --name=sample-python-service

Step 6:
Open Prometheus → http://localhost:9090
Run query → up

Step 7:
Open Grafana → http://localhost:3000

Step 8:
Generate traffic:
while true; do curl http://localhost:<port>; done

Step 9:
Check Grafana dashboards

---

# 5. Problems & Troubleshooting

Problem: Grafana shows "No Data"  
Cause: No traffic  
Solution: Hit app multiple times  

---

Problem: App not opening  
Cause: Service not connected  
Solution:
kubectl get endpoints sample-python-service

If empty → recreate service

---

Problem: Few graphs  
Cause: Low traffic  
Solution: Increase requests  

---

Problem: Confusion about Prometheus  
Cause: Thinking browser must stay open  
Solution: Only service needs to run  

---

# 6. Mistakes & Things to Remember

- Pod running ≠ App accessible
- Service config must be correct
- targetPort must match container port
- No traffic = No metrics
- Always check endpoints
- Grafana depends on Prometheus

---

# 7. Quick Revision

- Deploy app
- Expose using NodePort
- Open app in browser
- Check Prometheus (up)
- Open Grafana
- Generate traffic
- Debug using:
  kubectl get pods
  kubectl get svc
  kubectl get endpoints
