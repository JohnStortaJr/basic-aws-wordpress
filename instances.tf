/*
  Resource blocks are used to create resources in AWS.
  The first parameter is the type of resource to be created. In this case
  we are creating several aws_instances (EC2). Be sure to look up the default user
  for whatever image you use. For our image, the default user is ubuntu.
*/

#The name provided on the first line is for Terraform
#The Tag Name provided within the block is the name you will see within AWS
#Note that the names given are NOT the hostnames of the instances
resource "aws_instance" "basicec2labaz1" {
    #The security group and key pair must be created before the instances are built
    depends_on = [
        aws_key_pair.basicec2lab-key01,
        aws_security_group.basicec2lab-ssh-sg
    ]

    #How many instances should be created with this configuration
    count = 2
    ami                     = "ami-0c7217cdde317cfec"                    #The AMI for this image (We are using Ubuntu22.04 LTS x86_64)
    instance_type           = "t2.micro"                                 #The size of the instance (t2.micro is free tier eligible)
    availability_zone       = "us-east-1a"
    key_name                = "basicec2lab-key01"                        #The key pair that will allow SSH access to this instance
    vpc_security_group_ids  = [aws_security_group.basicec2lab-ssh-sg.id] #The security group that will allow SSD access to this instance from your IP
    
    /*
        This is the AWS name for each instance created
        We are creating multiple instances as indicated by the count property
        The count.index starts at 0 and will increment automatically for each instance (this is a built-in Terraform variable)
        This name is what we will see on the AWS console for the instance, but it is not the hostname of the instance
    */
    tags = {
        Name = "Basic EC2 Lab Server az120${count.index}"
    }
}

#This block is the same as above, but deploys the instances in availability zone 2
resource "aws_instance" "basicec2labaz2" {
    depends_on = [
        aws_key_pair.basicec2lab-key01,
        aws_security_group.basicec2lab-ssh-sg
    ]

    count = 2
    ami                     = "ami-0c7217cdde317cfec"
    instance_type           = "t2.micro"
    availability_zone       = "us-east-1b"
    key_name                = "basicec2lab-key01"
    vpc_security_group_ids  = [aws_security_group.basicec2lab-ssh-sg.id]
    
     tags = {
        Name = "Basic EC2 Lab Server az220${count.index}"
    }
}