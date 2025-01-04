# Things to remove before commit

-   VPC_Group
-   Provider key

# How to run the terraform up

terraform init -upgrade # to upgrade

terraform apply -auto-approve
terraform destroy # to shut down

# We're going to setup the High Availability k8s Cluster

Sometime, what if the master node fail? when we create the new masternode, worker has to rejoin the cluster, then how do we know what's the IP of master
Therefore, we're now gonna design a cluster with LoadBalancerNode to ensure it's high availability

# Setup loadbalancer

    - [lb_node]
        sudo mkdir -p /etc/nginx/tcpconf.d
        sudo vi /etc/nginx/nginx.conf

        <add this into the last line of the file>
        include /etc/nginx/tcpconf.d/*;

    Then, pasted this in
        cat << EOF | sudo tee /etc/nginx/tcpconf.d/kubernetes.conf
        stream {
            upstream kubernetes {
                server 10.140.0.56:6443;
                server 10.140.0.52:6443;
                server 10.140.0.54:6443;
            }
        server {
                listen 6443;
                listen 443;
                proxy_pass kubernetes;
            }
        }
        EOF

    2. Then vi /etc/nginx/tcpconf.d/kubernetes.conf

        fix the ip private address of each node (to masternode)

        <then run this command>
        sudo nginx -s reload

        <check if status is normal>
        sudo systemctl status nginx.service

        netstat -pltn ( check if port is working 6443)

# Set up master node

    - [master_node] the ip is the private ip of loadbalancer

        sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --control-plane-endpoint "140.0.59:6443" --upload-certs

        (apply network)
        mkdir -p $HOME/.kube
        sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
        sudo chown $(id -u):$(id -g) $HOME/.kube/config

        kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

    - After running the above, there's 2 option to join as control-plane and worker

        Join the master, only one master has to run the .kube/ command

    - Finish joining, copy the config and pasted to [installer_node]

        [installer_node] mkdir -p $HOME/.kube

# Set up rancher

    - Set up based on guide on rancher

# Now the High Availability cluster is available, we can try to deploy nginx for testing

    - Run the expose port for nginx to test

        kubectl get deployments.app -n tooa12
        kubectl expose deployment nginx --type=NodePort --port=80  -n tooa12

        (to get port and join from worker:port)
        kubectl get svc -n tooa12

# When a new service is create, a new endpoint will be created

    - [master_node1] kubectl get endpoints -n tooa12
