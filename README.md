# Final Task

___Terraform:___
- create VPC in GCP/Azure
- create instance with External IP
- prepare managed DB (MySQL)

___Ansible:___
- perform basic hardening (keyless-only ssh, unattended upgrade, firewall)
- (optional) perform hardening to reach CIS-CAT score at least 80 (please find https://learn.cisecurity.org/cis-cat-lite)
- deploy K8s (single-node cluster via Kubespray)

___Kubernetes:___
- prepare ansible-playbook for deploying Wordpress
- deploy WordPress with connection to DataBase

================================================================================

## Terraform


For the first task, I created 3 terraform modules. The first creates a VPC in GCP, the second creates an instance (on which kubernetes cluster will be installed later), and the third creates a database.

As a result of execution, the following was created:
- vpc (network, sybnetwork, firewall, IP address, private connection);
- instance;
- datebase.

![vm instance](images/instance.png)
![vpc network](images/vpc.png)
![bd sql](images/bd-sql.png)


## Ansible


In the next step, I prepared an ansible role that improves the hardening of my virtual machine.
![hardening](images/hardering.png)
Before the role, the CIS-CAT security score was at the level of 56%.
![before hardening](images/before-hardering.png)
And after hardening 74%.
![after hardening](images/after-hardering.png)

 ### Deploy K8s single-node cluster via Kubespray

For this task, I cloned the Kubespray release repository to my local machine. In the next step, I configured the inventory files and ran execute container.
After successful execution, Kubernetes was installed.
![setup Kubernetes](images/ansible.png)

## Kubernetes

In this part of the final task, I prepared a Helm Chart that installs wordpress in a Kubernetes cluster and connects to it the SQL database created in the first step.

I used ansible to deliver the files to the VM and also to start the execution.

As a result, we have wordpress installed.

![wp install](images/wp-install.png)
![wp admin](images/wp-admin.png)
