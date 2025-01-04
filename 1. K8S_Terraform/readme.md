# Things to remove before commit

-   VPC_Group
-   Provider key

# How to run the terraform up

terraform init -upgrade # to upgrade

terraform apply -auto-approve
terraform destroy # to shut down

# After running terraform apply

-   1. after that, we need to init kubeadm to crate a new network
       1.1 sudo kebeadm init --pod-network-cidr=10.255.0/16
-   2. set hostnamectl for each node
       2.1 sudo hostnamectl set-hostname master
       2.1 sudo hostnamectl set-hostname worker1
       2.1 sudo hostnamectl set-hostname worker1
-   2. then we will join the network from each worker

# When finish, run these command

-   [master_node] sudo kubeadm init --pod-network-cidr=10.255.0.0/16
    Then copy the join command
    Run these command to get config:

        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config

    Apply the pod network (weave if on cloud)

        kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

        kubectl cluster-info (for checking cluster info)

        For on prem there are 2 option
            - Flannel
            - Calico

-   [worker_node] sudo <join_command>
-   [master_node] kubectl get nodes (to see the cluster)

        [naming]

        kubectl label node worker1 node-role.kubernetes.io/worker=worker

# Get config so we can control from installer node

-   [master_node] ls -la .kube/
    Get the config and pass it to [installer_node]

-   [installer_node] mkdir -p $HOME/.kube

        after copying, we can now use kubectl

        kubectl get nodes

# Set up rancher

-   [rancher_node] ssh into rancher and get password (use sudo)

    import existing > generic > run second command on [master_node] > run third command on [master_node]
    After that, wait for cluster to be active on rancher

# Create a deployment

-   [master_node] kubectl create ns tooa12 (namespace)

        kubectl create deployment tooa12nginx --image=nginx -n <namspace_name>
        kubectl get pods -n tooa12 -o wide (view pods)

-   we can scale deployement either in UI or command line

        kubectl scale deployment <deployment_name> --replicas=3 -n <namespace>
        kubectl scale deployment tooa12nginx --replicas=3 -n tooa12

# after deploy, we need to expose the port from k8s > user

-   [master_node] kubectl expose deployment/be-tooa12 --type="NodePort" --port 8080 -n default

        kubectl expose deployment/<name_of_deployment> --type="NodePort" --port 8080 -n <name_space>

        access <ip>:31909/swagger-ui.html#/Contact_form_api
