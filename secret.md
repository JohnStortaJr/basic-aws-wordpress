A `secrets.tfvars` file is needed to hold the configuration details that 
should not be publically visible. Note that the file does not need to
be called `secrets.tfvars`, but should have an extension of `.tfvars`
so that it is recognized by the `.gitignore` file and not pushed to 
the main branch.

## Sample entries
The entries below are needed in order to use this configuration.

CIDR notation for your internet IP. Note that the IP you need is the public IP provided by your ISP, not your local desktop IP
If specifying a single IP, then use /32 as the netmask.

```
aws_access_source = "127.0.0.1/32"
```