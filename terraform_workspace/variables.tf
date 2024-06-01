variable "public_key" {
    type = string
    default = "~/.ssh/my_keys/id_ed25519.pub"
}

variable "ami" {
    type = string
    default = "ami-00beae93a2d981137"
}

variable "ec2-count" {
    default = 1
}