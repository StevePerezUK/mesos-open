# Packer Build
## Setup AWS Permissions
- Create AWS IAM Policy 
  - In the AWS console go to IAM policies and create a policy, Select JSON an put in the contents of packer-build-policy.json.
  - Name the **policy packer-build-policy**
- Create an AWS IAM Role
  - In the AWS console go to IAM roles and create a role, attach the **packer-build-policy**
  - Name the role **packer-build-role**
- Create an AWS User

**If you are using an AWS instance to do the build, you can assign the packer-build-role to the instance and skip this step**

- Create a user, 
  - Name the user **packer-build-user**
  - Tick the programmatic access only, click the Next:Permissions button
  - Press the Attach Existing Policies, select the **packer-build-policy**
  - Add tags if you want, press next
  - Record the Access key and Secret key - You will need this to put into the packer tempate
## Install Packer on your build machine
- Download packer here - **https://www.packer.io/downloads/**
- **If your workstation is running CentOS-7, there is another packer executeable in CentOS 7, if so rename it to packer.io**
## Update the template
- In the **mesos.json** file update,

|Key | Description | Value|
|---|---|---|
| access_key | AWS Credential | As recored when you created the AWS user |
| secret_key | AWS Credential | As recoreded when you created the AWS user |
| region | AWS region | This is currently set to Ireland |
| subnet_id | AWS Subnet | Use your default VPC subnet id | 

## Run packer 
Run the following in the packer directory, with the edited **mesos.json** file 

`
packer.io build mesos.json
`

This will create a new AMI. This will take about 15 minutes to complete so be patient. 







