variable "public_key" {
    type = string
    default = "../keys/id_rsa.pub"
}

variable "ami" {
    type = string
    default = "ami-00beae93a2d981137"
}

variable "ec2-count" {
    default = 3
}