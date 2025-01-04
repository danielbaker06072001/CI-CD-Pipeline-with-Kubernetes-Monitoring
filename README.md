# High Availability Kubernetes CI/CD Pipeline

**Author:** Duc Minh Nguyen

**Description:**  
This project demonstrates a complete end-to-end CI/CD pipeline using Jenkins, Kubernetes, and Terraform. It ensures high availability, automated deployments, and comprehensive monitoring. The initial study and development time for this project was around 6 months, completed during my winter break.

** Required Server:
- 3 Master Instances
- 1 Load Balancer
- 3 Worker Instances
- 1 Installer Instances installing Jenkin Slave 
- 1 Jenkin Master Instances
- 1 Sonarqube Instances 
---

## Demo Video, Follow in order

https://github.com/user-attachments/assets/863f4a5c-71e0-419e-9d96-f69aa7991fbd


[SECOND VIDEO OVER HERE]
https://youtu.be/JuYIE03daUA



https://github.com/user-attachments/assets/1df6327c-b1c7-41a4-95ca-12a46ddd63aa


## Project Structure

1. **K8S_Terraform**  
   Contains Terraform scripts to set up a basic Kubernetes cluster.  
   *[Refer to the `README.md` inside for setup instructions]*

2. **K8S_Terraform_HighAvailability**  
   Terraform scripts for setting up a high availability Kubernetes cluster.  
   *[Refer to the `README.md` inside for setup instructions]*

3. **Taint_Toleration**  
   Guide and scripts for Kubernetes taint and toleration configuration.  
   *[Refer to the `README.md` inside for setup instructions]*

4. **K8S_Monitoring**  
   Configuration for monitoring the Kubernetes cluster using Prometheus and Grafana.  
   *[Refer to the `README.md` inside for setup instructions]*

5. **Jenkin_Pipeline**  
   Jenkins pipeline configuration for continuous integration and deployment.  
   *[Refer to the `README.md` inside for setup instructions]*

6. **Ansible**  
   Ansible playbooks for automating configuration tasks.  
   *[Refer to the `README.md` inside for setup instructions]*

---

## How to Get Started

1. Clone this repository.
2. Navigate to each folder and follow the specific `README.md` for detailed setup and deployment instructions.
3. Ensure you have the necessary tools installed: 
   - **Terraform**
   - **Kubernetes (kubectl)**
   - **Jenkins**
   - **Docker**
   - **Ansible**

---

## Features

- High availability Kubernetes cluster with automatic failover.
- CI/CD pipeline using Jenkins for automated builds, code scanning with SonarQube, and deployment.
- Dockerized applications with images published to Docker Hub.
- Continuous monitoring with Prometheus, Grafana, and alerting using Alertmanager.

---

Feel free to reach out if you have any questions or need further guidance!
