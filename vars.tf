variable "AWS_REGION" {
  default = "ap-southeast-2"
}

variable "PATH_TO_PRIVATE_KEY" {
 default = "bhanu-key"
}

variable "PATH_TO_PUBLIC_KEY" {
 default = "bhanu-key.pub"
}

variable "AMIS" {
 type = map(string)
 default = {
 ap-southeast-2 = "ami-0f39d06d145e9bb63"
 ap-south-1 = "ami-04bde106886a53080"
 us-east-2 = "ami-059d836af932792c3"
 us-west-2 = "ami-0a7d051a1c4b54f65"
 eu-west-1 = "ami-04c58523038d79132"
 }
}
