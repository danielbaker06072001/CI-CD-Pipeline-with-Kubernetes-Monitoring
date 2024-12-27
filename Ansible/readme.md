# initial set up

sudo apt update
sudo apt install docker.io -y
sudo apt install ansible -y

# How to run ansible from EC 2

-   always start with ansible-playbook then -i then name of host, and main.yml
    ansible-playbook -i inventory/hosts main.yml
