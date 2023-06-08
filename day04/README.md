# AWS EKS -> Node Scaling -> Karpenter

kubectl top node
kubectl top po -A --sort-by=memory

kubectl get hpa ..

# service is associated with an endpoint
kubectl get ep 

# going to create a pod (runs in default namespace)
kubectl run netshoot --image=nicolaka/netshoot -ti --rm

# stateful is good when using master-slave node setup. need master to setup first then the node.

containaers:
    image: ...
    env:
    -name: POD_NAME
    valueFrom:
        fieldRef:
            fieldPath: metadata.name

volumeClaimTemplates -> this pod will ALWAYS attach to this volume.