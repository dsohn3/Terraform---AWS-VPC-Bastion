# Terraform—AWS-VPC-Bastion

# Infrastructure Summary
- Public Subnet (3)
- Private Subnet (3)
- IGW
- VPC
- Security Groups/Route Tables
- Bastion Host w/ EIP (EC2) inside Public Subnet 1
- Private EC2 inside Private Subnet 1

The security groups, route tables, and subnets are all configured so that you are only able to connect to the bastion host via SSH which can SSH into the private EC2 instance only from Public Subnet 1.

# Launch Steps
1. This configuration is setup for US-East-1 across six total subnets and three availability zones.  You can make your necessary adjustments in ‘variables.tf’.  If you make changes to the naming conventions just make sure that it is consistent across the code.

2. The SSH key pair in this infrastructure uses an already existing key pair.  You’ll need to use or create your own key pair in the AWS Console.  For ‘key pair type’ I selected ‘RSA’ and for private key format I selected ‘.pem’.  In ‘bastionhost.tf’ rename ‘bastion-host-tf’ for your SSH key in the ‘key_name’ argument for the bastion host and private EC2 instance.

3. After making your custom configurations and you’ve successfully launched the infrastructure, go to the AWS Console and click ‘Connect’ and follow AWS’ instructions on how to SSH into the bastion host.

4. After you’ve connected to your bastion host, locate your private key in your terminal and type ‘cat yoursshkey.pem’ which will give transcribe your private key for you which you will copy in its entirety.  

4. Back to your bastion host, in the terminal we will create a file that will contain your private key:
- ‘touch yoursshkey.pem’
- vi yoursshkey.pem’
- Paste the private key and save quit (:wq) out of VI.  In this step, make certain that your private key is identical to this file to access the private EC2.

6. Go back to the AWS Console to retrieve the private IP address of the private EC2 and follow the steps as you did in #3 to successfully SSH into your private EC2 from your bastion host.

*This is an Terraform infrastructure intended to only demonstrate a base VPC infrastructure within AWS and how one would access a private EC2 instance from a bastion host inside a VPC.
