# terraform_ec2

Use Terraform to spin up a new EC2 instance


This is working for a file, and for spinning up an EC2 instance.  

To prepare, set the AWS credentials.  For example, see `thekeys.sh`

To deploy:\
`terraform init`\
`terraform plan`\
`terraform apply`

The instance should be running and file `filea.txt` is created:\
`cat filea.txt`

Look at status:\
`terraform state`

Look at details:\
`terraform show`

Get the IP address:\
`terraform show | grep public_`

Log in (with IP address from above):\
`ssh -i ~/.ssh/.....pem ec2-user@public-ip-address`

To undo the deployment:\
`terraform destroy`


---

I implemented this for creating AWS Lamdba function layers.

Install a specific version of Python:\
`sudo amazon-linux-extras install python3.8 `

Virtual environment:\
`pip3 install virtualenv`\
`virtualenv -p /usr/bin/python3.8 py38`
`cd py38`\
`source bin/activate`




