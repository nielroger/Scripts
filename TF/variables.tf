variable "tags" {
  default = { "name" : "manish" }
  type    = map(string)
}
variable "awssecretkey" {
  default = ""
}
variable "awsaccesskey" {
  default = ""
}

