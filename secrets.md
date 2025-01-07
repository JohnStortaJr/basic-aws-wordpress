A `secrets.tfvars` file is needed to hold the configuration details that 
should not be publicly shared. The file does not need to
be called `secrets.tfvars`, but it should have an extension of `.tfvars`
so that it is recognized by the `.gitignore` file and not pushed to 
the main branch of the repository.

## Sample entries
The entries below are needed in order to use this configuration.

Use CIDR notation for your internet IP. The IP you need is 
the public IP provided by your ISP, not your local desktop IP
If specifying a single IP, then use /32 as the netmask.

The value for the public key variable is the path to the public
key that you will use when connecting to the EC2 instances. This will
be provided when building the key pair and you will need to use the
private key from this pair when SSHing to the instance.

```
local_source_ip = "234.158.113.98/32"

ssl_public_key_path = "~/.ssh/mypublicsslkey.pub"

```