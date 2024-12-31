# Practise on Pods

-   [installer_node] create new name space

        kubectl create ns tooa12

    We can either create new pod on UI or command

-   [installer_node] deploy a pod using .yml in nodes

        vi pod.yml
        <insert .yml content>

        There are 2 ways
        1. kubectl create -f pod.yml
        2. kubectl run ngixn --image=nginx -n tooa12

! However, we commonly in practise, we don't wanna create pods like this, if we accidentally delete it or someone get a hands on it, that's why we use other ways to create pods

# Way 2: using replicas set

https://collabnix.github.io/kubelabs/pods101/deploy-your-first-nginx-pod.html

    -   [installer_node]

        <create replica set yml file - read docs for .yml file >

        vi replicaset.yml
        kubectl create -f replicaset.yml

        <command to get replica set>
        kubectl get rs -n tooa12

        <now if we try to delete pods, it will automatically recreated>

# Way 3: using Deployment (the most efficient)

https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/

    -   [installer_node]

        kubectl create deployment tooa12 --image=nginx -n tooa12

        <command to get depployments>
        kubectl get deployments.apps -n tooa12

# Way 4: Using stateful set

    - We can create on UI or yml file , same with above, how this work is interesting
    - we have to first create a service before we can create stateful set, however we can bypass creating service for demo, to see how it would work

# Way 5: creating jobd

https://kubernetes.io/docs/concepts/workloads/controllers/job/

    - same with above, we can creat UI
    - job can only create pods when it first run, if needed it need to use cronjob to create it

# Way 6: Cron jobd

    - this will call into the job when it run, it can be scheduled
    - When cronjob is created, it will create job, then pods will be created
