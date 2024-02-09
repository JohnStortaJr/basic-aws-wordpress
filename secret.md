A `secret.tfvars` file is needed to hold the configuration details that 
should not be publically visible. 

## Sample entries
The entries below are needed in order to use this configuration.

CIDR notation for your internet IP. Note that the IP you need is the public IP provided by your ISP, not your local desktop IP

```
aws_access_source = "127.0.0.1/8"
```

Your public SSH key. The default key is usually located in `~/.ssh/id_rsa.pub`. Paste the full contents of this file inside the double quotes
```
aws_key = "ssh-rsa rEa||y_l0ng*key comment"
```