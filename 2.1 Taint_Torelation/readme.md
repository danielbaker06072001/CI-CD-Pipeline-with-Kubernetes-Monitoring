# Taints

    - It's like a lock

# Tolerations

    - It's like a key that use for a lock and we put it in the deploymnent

# If we logged in to master

    - [master_node] kubectl describe node kube-master

        Then we will see the default taints (NoSchedule)

    - Taint format:

        <key>=<value>:<effect>

        Taints: node-role.kubernetes.io/master:NoSchedule

    - [master_node] kubectl describe pod -n kube-system

        We will see some torelation that can be use to access any node through taint

# Meaning of Taint Effect

Taint only had effected when pod first trying to deploy onto that node, if the pods is already in the node and we add taints to that node, that previously deployed pod will still be deployed on that node

    - NoSchedule: do not allow pod to be deploy on that node

    - PreferNoSchedule: if pod does not deploying on any other node, then it will be deployed on this current node if it had enough RESOURCES

    - NoExecute: it will automatically check all the pod, if there are suitable then it will keep. For example, if we have a current running pod on any worker node, and we add taints NoExecute, then all pod running on that node which does not have tolerations will be removed form the node

# How to add taints to node

    - [node] kubectl taint node kubernetes-master1 node-type=production:NoSchedule

        If we wanted to delete, we can add "-" at the end
