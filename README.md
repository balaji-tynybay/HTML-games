# Terraform Infrastructure Project

This project uses Terraform to define and deploy infrastructure resources on AWS. It automates the provisioning of a simple web application using Infrastructure as Code (IaC) principles.

## Features

- Automates the creation of AWS resources (VPC, EC2 instances, security groups, etc.).
- Deploys a sample web application on the provisioned EC2 instances.

## Getting Started

Follow these steps to set up and deploy the infrastructure using Terraform.

### Prerequisites

1. [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your local machine.
2. [Configure your AWS credentials](#terraform-configuration).
3. The Terraform code is organized into three levels: level0, level1, and level2.
   - level0
       - This level contains the basic infrastructure resources: an S3 bucket for remote state storage and a DynamoDB table for state locking.

   - level1
       - This level sets up the backend configuration to use the S3 bucket and DynamoDB table created in level0. It defines a VPC, subnets, an internet gateway, and           a route table.

   - level2
       - This level further extends the infrastructure and uses data from level1 to create an AWS Load Balancer, security groups, IAM roles, and instance profiles.

- Navigate with respective to order directory:

  ```
  cd level(0 , 1 and 2)

- Initialize Terraform:

  ```
  terraform init

## Next, provide a section that explains your project's folder structure. You can use code blocks to illustrate the structure visually:
   ## Folder Structure

<pre>
## Folder Structure

```
├── .github/
│   └── workflows/
│       └── terraform-deployment.yml
├── level0/
│   ├── main.tf
│   ├── terraform.tfstate
│   └── provider.tf
├── level1/
│   ├── data.tf
│   ├── data_source.tf
│   └── outputs.tf
│   └── route_table.tf
│   └── subnet.tf
│   └── terraform.tfvars
│   └── variables.tf
│   └── vpc.tf   
├── level2/
│   ├── aws_instance.tf
│   ├── data.tf
│   └── data_source.tf
│   └── iam.tf
│   └── load_balancer.tf
│   └── outputs.tf
│   └── security_groups.tf
│   └── terraform.tfvars
│   └── userdata.sh
│   └── variables.tf

```
</pre>
By using the preformatted text enclosed in three backticks and specifying the language as "plaintext," you should be able to display your folder structure in a neat and aligned manner in your README. Just copy and paste the above code into your README file.







 
## Usage

1. Review and customize the Terraform configuration files in the `terraform` directory to match your requirements.

2. Run a plan to see what changes Terraform will make:

   ```bash
   terraform plan
   
## Terraform Configuration

Configure your AWS credentials by following these steps:

1. Install the AWS CLI and configure it with your access key, secret key, and desired region:

   ```bash
   aws configure

## Deployment

After provisioning the infrastructure, you can access the deployed web application by navigating to the public IP address of the EC2 instance in your web browser.

These are the games that got ready

- [X] 2048
- [x] floppybird
- [x] javascript-pong
- [x] javascript-tetris
- [x] minesweeper
- [ ] pacman
- [ ] tictoctoe



## Contributing

Contributions are welcome! If you find a bug or have an improvement, please open an issue or submit a pull request.
