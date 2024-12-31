# Usage
- sometime, we wanted to check the version of each instances
- we wanted to update, etc
- we can found the error in each version
- mostly, when we have many server, this will be the help
- in the scenario if we have 200-500 instances, doing it manually will be pain, however this will provide us a better solution

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

# For better security, we will encrypt the yml file , each time we run, we need to provide password [There are many way to encrypt + decrypt _ read document]

ansible-vault encrypt main.yml
ansible-vault decrypt main.yml

However, we will use the --ask-vault-pass to make it more secure so we dont have to encrypt again
ansible-playbook -i inventory/hosts main.yml --ask-vault-pass

![image](https://github.com/user-attachments/assets/e904828a-7b32-49b6-b494-619aa89ccb02)

