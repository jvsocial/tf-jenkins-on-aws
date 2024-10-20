# Jenkins on AWS - Terraform Setup

This repository provides a Terraform configuration to automate the installation of Jenkins on AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials with permissions to create resources.

## Steps to Run

### 1. Fork and Clone the Repository

Fork the repository to your own GitHub account, then clone it using your forked repository's URL:

```sh
git clone https://github.com/yourusername/tf-jenkins-on-aws.git
cd tf-jenkins-on-aws
```

### 2. Configure AWS Credentials

Create and edit the `terraform.tfvars` file:

```hcl
aws_access_key = "XXX"    # Replace with your AWS access key
aws_secret_key = "XXX"    # Replace with your AWS secret key
aws_token      = "XXX"    # Replace with your AWS session token
aws_region     = "us-east-1"  # Replace with your desired AWS region
```

### 3. Initialize and Apply Terraform

```sh
terraform init
terraform apply
```

### 4. Access Jenkins

- You will get the public IP address from the terminal where `terraform apply` was run.
- It may take some time for Jenkins to fully initialize. Once ready, access Jenkins on port `8080`:

```
http://<Jenkins_Public_IP>:8080
```

### 5. Retrieve Initial Admin Password

To log in to Jenkins, connect to the EC2 VM where Jenkins is installed and run:

```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### 6. Install Jenkins Plugins

After logging into Jenkins, install the following plugins:

1. Go to `Manage Jenkins` → `Manage Plugins` → `Available` tab.
2. Search and install these plugins:
   - **Docker Pipeline**
   - **Delivery Pipeline**
   - **Docker Commons Plugins**
3. Click `Install without restart` and wait for the installation to complete.

### 7. Cleanup

After you're done, destroy all resources:

```sh
terraform destroy
```

## Delivery Details

- EC2 VM Created
- Ansible Installed
- Jenkins Installed via Ansible
