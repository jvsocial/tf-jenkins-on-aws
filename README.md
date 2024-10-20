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

### 3. Create or Use an Existing AWS Key Pair

You will need an AWS key pair (a `.pem` file) to SSH into your EC2 instance. If you don't already have one, follow these steps to create and download one:

1. **Go to AWS EC2 Console**:

   - Log in to your [AWS Management Console](https://aws.amazon.com/console/).
   - Navigate to the **EC2 Dashboard**.

2. **Create a Key Pair**:

   - On the left-hand side, click on **Key Pairs** under **Network & Security**.
   - Click the **Create Key Pair** button.
   - Name your key pair (e.g., `my-jenkins-key`), choose **RSA** as the key type, and choose **.pem** as the private key file format.
   - Click **Create Key Pair**, and your key will be automatically downloaded as a `.pem` file. Save this file securely, as you will use it to SSH into your instance.

   > **Important:** If you lose this `.pem` file, you will not be able to connect to your EC2 instance using SSH. Make sure it's stored securely.

3. **Modify Security Groups**:
   - Ensure that the security group attached to your EC2 instance allows inbound SSH (port 22) traffic from your IP.

### 4. Initialize and Apply Terraform

```sh
terraform init
terraform apply
```

### 5. Access Jenkins

- You will get the public IP address from the terminal where `terraform apply` was run.
- It may take some time for Jenkins to fully initialize. Once ready, access Jenkins on port `8080`:

```
http://<Jenkins_Public_IP>:8080
```

### 6. Retrieve Initial Admin Password

To log in to Jenkins, you will need to connect to the EC2 instance where Jenkins is installed. There are two methods to connect:

#### **Method 1: Using SSH (Linux/macOS/Windows with PuTTY)**

1. **Go to AWS EC2 Console**:

   - Log in to your [AWS Management Console](https://aws.amazon.com/console/).
   - Navigate to the **EC2 Dashboard**.
   - Under **Instances**, find the EC2 instance created by Terraform.

2. **Get the Instance's Public IP or DNS**:

   - Select the instance and check the **Public IPv4 address** or **Public DNS** in the instance details.

3. **Connect to the EC2 Instance via SSH**:

   - Click the **Connect** button at the top of the instance details page.
   - Under **SSH Client**, you’ll see an SSH command. Copy it, which will look like this:

   ```sh
   ssh -i /path/to/your-key.pem ec2-user@<Public_IP>
   ```

   - Replace `/path/to/your-key.pem` with the actual path to your private key file (`.pem`) that you downloaded earlier.
   - Run the SSH command in your terminal (Linux/macOS) or use PuTTY (Windows) to connect.

4. **Run the Following Command to Retrieve Admin Password**:
   Once connected via SSH, run the following command to retrieve the Jenkins initial admin password:

   ```sh
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```

#### **Method 2: Using EC2 Instance Connect (Browser-based)**

1. **Go to AWS EC2 Console**:

   - Log in to your [AWS Management Console](https://aws.amazon.com/console/).
   - Navigate to the **EC2 Dashboard**.
   - Under **Instances**, find the EC2 instance created by Terraform.

2. **Get the Instance's Public IP or DNS**:

   - Select the instance and check the **Public IPv4 address** or **Public DNS** in the instance details.

3. **Connect Using EC2 Instance Connect**:

   - Select your instance and click the **Connect** button.
   - Choose the **EC2 Instance Connect** tab.
   - Click **Connect** at the bottom of the page.

4. **Run the Following Command to Retrieve Admin Password**:
   Once connected through the browser, run the following command:

   ```sh
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```

### 7. Install Jenkins Plugins

After logging into Jenkins, install the following plugins:

1. Go to `Manage Jenkins` → `Manage Plugins` → `Available` tab.
2. Search and install these plugins:
   - **Docker Pipeline**
   - **Delivery Pipeline**
   - **Docker Commons Plugins**
3. Click `Install without restart` and wait for the installation to complete.

### 8. Cleanup

After you're done, destroy all resources:

```sh
terraform destroy
```

## Delivery Details

- EC2 VM Created
- Ansible Installed
- Jenkins Installed via Ansible
