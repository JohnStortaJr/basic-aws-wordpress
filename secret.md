<<<<<<< HEAD
<<<<<<< HEAD
A `secret.tfvars` file is needed to hold the configuration details that 
should not be publically visible.

## Sample entries
The entries below are needed in order to use this configuration.

<<<<<<< HEAD
=======
A secret.tfvars file is needed to hold the configuration details that 
=======
A `secret.tfvars` file is needed to hold the configuration details that 
>>>>>>> 80a657e (Update to markdown format)
should not be publically visible.

## Sample entries
>>>>>>> 96f689c (Update to markdown format)
=======
>>>>>>> 28144a5 (Update to markdown format)
CIDR notation for your internet IP. Note that the IP you need is the public IP provided by your ISP, not your local desktop IP

```
aws_access_source = "127.0.0.1/8"
```

<<<<<<< HEAD
<<<<<<< HEAD
Your public SSH key. The default key is usually located in `~/.ssh/id_rsa.pub`. Paste the full contents of this file inside the double quotes
=======
Your public SSH key. The default key is usually located in ~/.ssh/id_rsa.pub. Paste the full contents of this file inside the double quotes
>>>>>>> 96f689c (Update to markdown format)
=======
Your public SSH key. The default key is usually located in `~/.ssh/id_rsa.pub`. Paste the full contents of this file inside the double quotes
>>>>>>> 74a0465 (Update to markdown format)
```
aws_key = "ssh-rsa rEa||y_l0ng*key comment"
```