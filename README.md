# terraform_ec2

Use Terraform to spin up a new EC2 instance


This is working for a file, and for spinning up an EC2 instance.  

To prepare, set the AWS credentials.  
export AWS_ACCESS_KEY_ID=`cat ~/.aws/....`
export AWS_SECRET_ACCESS_KEY=`cat ~/.aws/....`
export THE_VAR_server_port=22
echo "Key: $AWS_ACCESS_KEY_ID"
echo "sec: $AWS_SECRET_ACCESS_KEY"
echo "server port: $THE_VAR_server_port"


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
```
export INST_IP=`terraform output public_ip  | tr -d '"' `  
ssh -i ~/.ssh/.....pem ec2-user@$INST_IP
```

To undo the deployment:\
`terraform destroy`


---

I implemented this for creating AWS Lamdba function layers.

Install a specific version of Python:\
`sudo yum update `\
`sudo amazon-linux-extras install python3.8 `

Virtual environment:\
`pip3 install virtualenv`\
`virtualenv -p /usr/bin/python3.8 py38`   # the location of python3.8 may differ.  This works for AWS Linux
`cd py38`\
`source bin/activate`




