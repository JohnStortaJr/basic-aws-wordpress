variable "aws_access_source" {
    default = "127.0.0.1/8"
    description = "Single IP allowed to access the ec2 instance"
    type = string
    sensitive = true
}

variable "aws_key" {
    description = "SSL key for accessing the ec2 instance"
    type = string
    sensitive = true
}