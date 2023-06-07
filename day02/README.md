kubectl api-resources | less

kubectl create -f mypod.yaml
kubectl get pod -n myns
kubectl describe po/my-pod -n myns

kubectl port-forward po/my-pod -n myns 8080:3000

kubectl delete -f mypod.yaml --force --grace-period=0

kubectl delete ns/myns # deletes everything in NS

kubectl get pod/my-pod -n myns -o yaml 

kubectl logs -f po/my-pod -n myns

# must have /bin/sh for the container
kubectl exec -ti -n myns po/my-pod -- /bin/sh

kubectl port-forward -ndov-ns deploy/dov-deploy 8080:3000

kubectl scale deploy/dov-deploy -n dov-ns --replicas=2

# multi info
kubectl get po,deploy,rs -n dov-ns -owide

# use apply instead of create - create is imperative, apply is declarative (idempotent)
kubectl apply -f dov-bear.yaml

kubectl delete po -l name=dov-po -n dov-ns

kubectl create deploy dov-deploy -n dov-ns --image <the image> --replicas=3 -o yaml --dry-run=client

# port forward to SVC 
kubectl port-forward -ndov-ns service/dov-svc 8080:8080

kubectl explain deploy.spec.template.spec ....


kubectl rollout status deploy/bggapp-deploy -n bggns
kubectl rollout history deploy/bggapp-deploy -n bggns

kubectl rollout undo -n bggns deploy/bggapp-deploy --to-revision=1

kubctl cofig set-context --current --namespace=<namespace>