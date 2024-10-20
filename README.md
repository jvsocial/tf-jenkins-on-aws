# Jenkins on AWS - Terraform Setup

This repository provides a Terraform configuration to automate the installation of Jenkins on AWS. Follow the instructions below to fork, clone, modify, and run the Terraform script to deploy Jenkins in your AWS environment.

## Prerequisites

Before you start, make sure you have:

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials (Access Key, Secret Key, and Token) with sufficient permissions to create resources (EC2, IAM, Security Groups, etc.).

## Steps to Run

### 1. Fork the Repository

Since multiple users may need to make their own modifications, **first fork this repository** to your own GitHub account by clicking the "Fork" button in the upper right corner of the repository page.

Here is the original repository link for reference:

```
https://github.com/jvsocial/tf-jenkins-on-aws
```

Once you have forked the repository, you will have your own copy under your GitHub username.

### 2. Clone Your Forked Repository

After forking, clone the repository using the **URL of your own fork**. Make sure to replace `yourusername` with your actual GitHub username in the command below:

```sh
git clone https://github.com/yourusername/tf-jenkins-on-aws.git
cd tf-jenkins-on-aws
```

### 3. Configure AWS Credentials

You need to configure the `terraform.tfvars` file with your AWS credentials. This file contains sensitive information, so handle it securely.

If the file doesn't exist, create it in the root of the repository:

```sh
touch terraform.tfvars
```

Edit the file `terraform.tfvars` and add the following content:

```hcl
aws_access_key = "XXX"    # Replace with your AWS access key
aws_secret_key = "XXX"    # Replace with your AWS secret key
aws_token      = "XXX"    # Replace with your AWS session token
aws_region     = "us-east-1"  # Replace with your desired AWS region (e.g., us-east-1)
```

### 4. Initialize Terraform

Run the following command to initialize the Terraform environment:

```sh
terraform init
```

This will download the necessary provider plugins and set up your workspace.

### 5. Apply the Terraform Plan

Run the following command to apply the Terraform configuration and deploy Jenkins on AWS:

```sh
terraform apply
```

You will be prompted to confirm the actions Terraform will take. Type `yes` and press Enter to proceed. This will provision the necessary infrastructure and install Jenkins.

### 6. Access Jenkins

Once the Terraform script completes, you will get the public IP address or DNS name of the Jenkins server. You can access Jenkins in your web browser using this URL.

The default Jenkins port is `8080`. So, you can access it via:

```
http://<Jenkins_Public_IP>:8080
```

### 7. Clean Up

After you're done with the Jenkins instance, you can destroy all resources by running:

```sh
terraform destroy
```

This will tear down the entire infrastructure created by Terraform.

## Notes

- Make sure you handle the `terraform.tfvars` file securely as it contains sensitive AWS credentials.
- If you encounter any issues, make sure your AWS IAM role has the correct permissions to provision EC2 instances, manage IAM roles, and configure security groups.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
