resource "aws_instance" "basicec2lab" {
    count = 4
    ami                    = "ami-05a5f6298acdb05b6"
    instance_type          = "t2.micro"
    key_name               = "terraform-key03"
    vpc_security_group_ids = [aws_security_group.basicec2lab-ssh-sg.id]
    
    tags = {
        Name = "Basic EC2 Lab Server 20${count.index}"
    }
    
    depends_on = [
        aws_key_pair.trainer01_keypair01,
        aws_security_group.basicec2lab-ssh-sg
    ]
}