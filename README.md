# terraform_ec2

Use Terraform to spin up a new EC2 instance

This is work in progress.


This is working for a file.  To deploy:\
`terraform init`\
`terraform apply`

The file `filea.txt` is created:\
`cat filea.txt`

Look at status:\
`terraform state`

Look at details:\
`terraform show`

Get the IP address:\
`terraform show | grep public_`

Log in (with IP address from above):\
ssh -i ~/.ssh/wk.pem ec2-user@public-ip-address

To undo the deployment:\
`terraform destroy`


---

Install a specific version of Python:\
`sudo amazon-linux-extras install python3.8 `

Virtual environment:\
`pip3 install virtualenv`\
`virtualenv -p /usr/bin/python3.8 py38`
`cd py38`\
`source bin/activate`




