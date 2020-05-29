# Packer Build
## Setup AWS Permissions
- Create AWS IAM Policy 
  - In the AWS console go to IAM policies and create a policy, Select JSON an put in the contents of packer-build-policy.json.
  - Name the policy packer-build-policy
- Create an AWS IAM Role
  - In the AWS console go to IAM roles and create a role, attach the packer-build-policy
  - Name the role packer-build-role
- Create an AWS User

##If you are using an AWS instance in your account to do the build, you can assign the packer-build-role to the instance##
 
 - Create a user, 
  - Name the user packer-build-user
  - Tick the programmatic access only
  - Attach the packer-build-role to the user
  - Add tags if you want, press next
  - Record the Access key and Secret key - You will need this to put into the packer tempate
## Install Packer on your build machine
- Download packer here
- Change the name of the packer executable to packer.io ##There is another packer executeable in CentOS 7##
## Update the template
- 
