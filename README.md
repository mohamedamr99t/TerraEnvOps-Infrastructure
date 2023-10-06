# TerraEnvOps-Infrastructure
A Terraform-driven infrastructure orchestration project for managing multiple environments with automated notifications, powered by Jenkins, AWS SES, and Lambda functions
## Create two workspaces: dev and prod. 
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/34150c5b-100e-4778-9319-8b42809d7c3d)
## Create two variable definition files (.tfvars) for the dev and prod environments.
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/680e10b6-9973-4378-9d24-c7dcc9f0029c)
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/d947672f-bfea-4fe9-bf26-ce3508056d44)
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/b094b873-e476-4816-ba7d-d91e5b8b2a64)
## Separate network resources into a network module.
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/ef5227c7-594b-4fcb-ba68-ce48bfdfccd5)
## Apply Code to Create Environments
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/6d2bd6a3-8eca-4ac9-8056-e15de5cd7066)
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/ce853da5-4203-401f-918c-b6ddc5af3f3d)
## Run the local-exec provisioner to print the public IP of the bastion EC2.
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/8c00108b-7c1c-4727-98fd-868e560138f9)
## Upload Infrastructure Code on GitHub
## create dockerfile 
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/c8004ca9-7309-4393-957d-388b84e56347)
## Create a pipeline that takes an env-param to apply the Terraform code on a certain environment.
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/ec0c2dd8-ec8e-4c86-a245-3bc69498069d)
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/ee99af83-dbad-4a2a-b2a3-824a3a3c6cbd)
## Verify Email in SES Service
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/f30c21ad-8a43-4a2e-afd2-af9c2e2cbb4d)
## Create Lambda Function
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/a7ef2cb8-5885-4480-a33b-7ef3bcb3b49f)
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/9ef8564e-5e6a-4b08-8b04-a2a320044d00)
## Create a trigger to detect changes in the state file and send an email when changes are detected.
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/15ba9134-35b9-4b40-9a13-3cc60bc4741d)
![image](https://github.com/mohamedamr99t/TerraEnvOps-Infrastructure/assets/139065575/2eac1fa6-d65a-4c3d-8b3e-e45b1ada713f)




