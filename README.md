---

# Server Setup for Nginx Deployment using Ansible, Terraform, and AWS

This repository contains Terraform configurations to provision a VPC with two subnets (public and private), security groups for Nginx servers and a proxy, an internet gateway, and instances with Nginx installed. Additionally, it includes Ansible playbooks to meet prerequisites for Nginx installation and deploy Nginx on the provisioned instances.

## Features

- Automatically configure a VPC with public and private subnets.
- Create security groups for Nginx servers and a proxy.
- Provision instances with Nginx installed.
- Assign SSH keys from the local machine to the instances.
- Setup an internet gateway for internet access.
- Populate an inventory file for Ansible playbooks.
- Enable passwordless SSH and disable host checking for seamless Ansible usage.

## Additional Functionality

- Configures Nginx as a web server and implements SSH security with Ansible.
- Generates SSL certificates and associates them with the Nginx servers using Certbot.
- Associates DNS records from a Route 53 domain to the provisioned instances using AWS Lambda and API Gateway.
- Utilizes Ansible to configure and install Nginx, as well as installing and configuring Certbot (alternative to snap using pip).
- Automates the creation of new certificates, enabling secure access to rodrigonginx.com with HTTPS enabled.
- All of this is automated with Python, Bash, AWS, Terraform, and Ansible.

## Getting Started

WILL ADD A GETTING STARTED WHEN FINISHED

## Notes

- Ensure that you have the necessary AWS credentials configured locally.
- Review the Terraform configurations and Ansible playbooks before deploying to ensure they meet your requirements.
- After deployment, test the Nginx installation by accessing the public IP addresses of the instances in a web browser.

---

Feel free to customize the "Getting Started" section once you've completed it. This README provides a comprehensive overview of the project's features and functionality.
