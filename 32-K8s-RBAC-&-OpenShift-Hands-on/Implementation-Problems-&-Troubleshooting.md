## 4. Step-by-Step Implementation

Step 1:
oc login

Step 2:
oc create deployment nginx --image=nginx

Step 3:
oc get pods

Step 4:
oc expose deployment nginx --port=80

Step 5:
oc expose svc nginx

Step 6:
oc get route

---

## 5. Problems & Troubleshooting

Problem: CrashLoopBackOff  
Cause: nginx needs root access  
Solution:
oc new-app nginxinc/nginx-unprivileged

Problem: Application not available  
Cause: Service not connected  

Check:
oc get endpoints

Problem: Endpoints = none  
Cause: selector mismatch  

Fix:
Match service selector with pod labels

Problem: Route not working  
Cause: router delay  

Solution:
- wait
- incognito
- port-forward

---

## 6. Mistakes & Things to Remember

- Service selector must match pod labels
- Always check endpoints
- Debug order:
  1. Pod
  2. Logs
  3. Service
  4. Endpoints
  5. Route
