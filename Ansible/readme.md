# initial set up

sudo apt update
sudo apt install docker.io -y
sudo apt install ansible -y

# How to run ansible from EC 2

-   always start with ansible-playbook then -i then name of host, and main.yml
    ansible-playbook -i inventory/hosts main.yml

# How this run
- Initially, I set up 1 ansible control server to run all command to other server

- ![image](https://github.com/user-attachments/assets/dab5644f-81d4-437b-a77d-d2eed61a6ddf)

- The ansible will be installed in the ansible-control server, and run install on many different machines with different groups using variable, etc
![image](https://github.com/user-attachments/assets/26ae5862-0359-4282-8bec-d0ed7b8223b2)

# For better security, we will encrypt the yml file , each time we run, we need to provide password

![image](https://github.com/user-attachments/assets/e904828a-7b32-49b6-b494-619aa89ccb02)

