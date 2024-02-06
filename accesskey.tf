resource "aws_key_pair" "trainer01_keypair01" {
  key_name   = "terraform-key03"
  public_key = var.aws_key
}