## 4. Project Implementation

### Step 1: Deploy app and service

### Step 2: Verify service
curl http://<ip>:<nodeport>/demo

---

### Step 3: Enable ingress
minikube addons enable ingress

---

### Step 4: Create ingress.yml

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-example
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /demo/
spec:
  ingressClassName: nginx
  rules:
  - host: foo.bar.com
    http:
      paths:
      - path: /testpath
        pathType: Prefix
        backend:
          service:
            name: python-django-app-service
            port:
              number: 80

---

### Step 5: Apply ingress
kubectl apply -f ingress.yml

---

### Step 6: Map domain
sudo vim /etc/hosts

Add:
192.168.49.2 foo.bar.com

---

### Step 7: Test
curl -L http://foo.bar.com/testpath

---

## 5. Problems & Troubleshooting

Problem: Host not resolving  
Cause: No hosts entry  
Solution: Add in /etc/hosts  

---

Problem: 404 from nginx  
Cause: Path mismatch  
Solution: Fix ingress path  

---

Problem: 404 from Django  
Cause: Wrong rewrite  
Solution: Use /demo/  

---

Problem: curl stuck  
Cause: Redirect loop  
Solution: Fix rewrite  

---

Problem: HOST shows *  
Cause: No host defined  
Solution: Add host  

---

Problem: YAML error  
Cause: Missing apiVersion/kind  
Solution: Fix YAML  

---

## 6. Mistakes & Things to Remember

- Ingress needs controller
- Rewrite must match app routes
- Redirect paths must be handled
- Use curl -L for redirects
- Always configure /etc/hosts locally
- YAML indentation is critical
- Ingress only handles incoming request, not redirected ones

---

## 7. Quick Revision

- Ingress = external smart router
- Service = internal load balancer
- Host + Path = routing logic
- Rewrite = URL transformation
- /etc/hosts = local DNS
- Debug using curl

---
