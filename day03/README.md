# on internet
helm search hub nginx

# on local machine
helm search repo nginx

# just add the reference (not in cluster yet)
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm repo ls

# just looking at what we are installing
helm template my-ingress ingress-nginx/ingress-nginx -n ingress-nginx > ingress.yaml

# --create-namespace if doesn't exist
helm install <our release name> <repo>/<chart> -n <namespace> --create-namespace 


kubectl exec -ti po/webserver -- /bin/sh
kubectl get sc

kubectl get pvc,pv -n db-ns

# fancy features goes to Annotations
# in K8 Ingress is Reverse Proxy

# search
kubectl api-resources | grep <search>


# create genrsa

# generate the private key
openssl genrsa -out code.key 4096

# self signed certificate
openssl req -new -key code.key

# create a CSR
openssl req -new -key code.key -out code.csr \
    - subj '/CN=code-159.89....' \
    - addext 'subjectAltName= DNS:myserver.com, IP:...' \
    - addext 'keyUsage = keyEncipherment, digitalSignature' \
    - addext 'extendedKeyUsage = serverAuth'

# self signed certiciate
openssl req -new -key code.key -out code.csr -subj '/CN=code-104.248.99.248' -days 365 -addext 'keyUsage = keyEncipherment, digitalSignature' -addext 'extendedKeyUsage = serverAuth'

# check
openssl x509 -in code.cert -nout -text | less

# TLS cert
# generate a TLS secret
kubectl create secret tls NAME --cert=.. --key=..


