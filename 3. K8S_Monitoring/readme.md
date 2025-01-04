# Things to remove before commit

-   VPC_Group
-   Provider key

# How to run the terraform up

terraform init -upgrade # to upgrade

terraform apply -auto-approve
terraform destroy # to shut down

# Guide to setup Pometheus and Grafana

    - [installer_node] Install helm

        curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

        chmod 700 get_helm.sh

        ./get_helm.sh

    - Create prometheus folder

        mkdir prometheus

        cd prometheus

    - Init Helm repo and download helm-chart

        helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

        helm repo add stable https://charts.helm.sh/stable

        helm repo update

        (getting the version of the prometheus-stack - chart version)
        helm search repo prometheus |egrep "stack|CHART"

        (Then add the right chart version)
        helm pull prometheus-community/kube-prometheus-stack --version 67.5.0

        (unzip file)
        tar -xzf kube-prometheus-stack-67.5.0.tgz

        (copy file value)
        cp kube-prometheus-stack/values.yaml values-prometheus.yaml

        (we now can vi values-prometheus.yaml to see configuration)
        For now we're gonna leave as default, only change password

# After the initial setup, we now gonna deploy

    - [installer_node]

        kubectl create ns monitoring

        (install)
        helm -n monitoring install prometheus-grafana-stack -f values-prometheus.yaml kube-prometheus-stack

        (if miss click, uninstall here)
        helm -n monitoring uninstall prometheus-grafana-stack

    - Now, we can see the helm in our cluster

        kubectl get pods -n monitoring

        helm list -A

        helm list -A | grep monitoring

    - Check current service

        kubectl get svc -n monitoring

    - Expose Grafana in type NodePort

        kubectl --namespace monitoring patch svc prometheus-grafana-stack -p '{"spec": {"type": "NodePort"}}'

        now, we can see the port using get svc

        - we access it by <worker_ip>:<port>

    - Expose AlertManager in type NodePort

        kubectl --namespace monitoring patch svc prometheus-grafana-stack-k-alertmanager -p '{"spec": {"type": "NodePort"}}'

    - Expose Prometheus in type NodePort

        kubectl --namespace monitoring patch svc prometheus-grafana-stack-k-prometheus -p '{"spec": {"type": "NodePort"}}'

        We can access web prometheus using <worker_ip>:<port>

        Try filter node_memory_MemTotal_bytes
