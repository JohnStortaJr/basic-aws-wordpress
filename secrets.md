A `secrets.tfvars` file is needed to hold the configuration details that 
should not be publicly shared. Note that the file does not need to
be called `secrets.tfvars`, but should have an extension of `.tfvars`
so that it is recognized by the `.gitignore` file and not pushed to 
the main branch of the repository.

## Sample entries
The entries below are needed in order to use this configuration.

CIDR notation for your internet IP. Note that the IP you need is the public IP provided by your ISP, not your local desktop IP
If specifying a single IP, then use /32 as the netmask.

```
local_source_ip = "234.158.113.98/32"
```