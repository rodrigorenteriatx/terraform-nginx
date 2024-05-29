# Terraform Setup for Nginx Deployment with Ansible

This repository contains Terraform configurations to provision a VPC with two subnets (public and private), security groups for Nginx servers and a proxy, an internet gateway, and instances with Nginx installed. Additionally, it includes Ansible playbooks to meet prerequisites for Nginx installation and deploy Nginx on the provisioned instances.

## Features

- Automatically configure a VPC with public and private subnets.
- Create security groups for Nginx servers and a proxy.
- Provision instances with Nginx installed.
- Assign SSH keys from the local machine to the instances.
- Setup an internet gateway for internet access.
- Populate an inventory file for Ansible playbooks.
- Enable passwordless SSH and disable host checking for seamless Ansible usage.

WILL ADD A GETTING STARTED WHEN FINISHED

## Notes

- Ensure that you have the necessary AWS credentials configured locally.
- Review the Terraform configurations and Ansible playbooks before deploying to ensure they meet your requirements.
- After deployment, test the Nginx installation by accessing the public IP addresses of the instances in a web browser.
