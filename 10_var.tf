#COMMON
variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "key" {
  type = string
  default = "pika-key"
}

variable "ava_zone" {
  type = list
  default = ["a","c"]   
}

variable "name" {
  type = string
  default = "pika"
}

#VPC
variable "cidr_vpc" {
  type = string
  default = "10.0.0.0/16"
}

variable "pub_sub" {
  type = list
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "pri_sub" {
  type = list
  default = ["10.0.2.0/24","10.0.3.0/24"]
}

variable "db_sub" {
  default = ["10.0.4.0/24","10.0.5.0/24"]
}

#INTERNET GATEWAY
variable "cidr_route" {
  type = string
  default = "0.0.0.0/0"
}

variable "cidr_v6" {
  type = string
  default = "::/0"
}

#SECURITY GROUP
variable "ssh" {
  type = string
  default = "ssh"
}

variable "http" {
  type = string
  default = "http"
}

variable "icmp" {
  type = string
  default = "icmp"
}

variable "mysql" {
  type = string
  default = "mysql"
}

variable "port_ssh" {
  type = number
  default = 22
}

variable "port_http" {
  type = number
  default = 80
}

variable "port_mysql" {
  type = number
  default = 3306
}

variable "port_zero" {
  type = number
  default = 0
}

variable "minus" {
  default = -1
}

variable "pro_tcp" {
  type = string
  default = "tcp"
}

variable "pro_udp" {
  type = string
  default = "udp"
}

variable "null" {
  default = null
}

variable "all" {
  default = "ALL"
}

#INSTANCE
variable "f-name" {
  type = string
  default = "name"
}

variable "ami" {
  type = string
  default = "amzn2-ami-hvm-*-x86_64-gp2"
}

variable "f-type" {
  type = string
  default = "virtualization-type"
}

variable "v-type" {
  type = string
  default = "hvm"
}

variable "owner" {
  type = string
  default = "amazon"
}

variable "ins_type" {
    type = string
    default = "t2.micro"
}

variable "pri_ip" {
  type = string
  default = "10.0.0.11"
}

#APPLICATION LOAD BALANCER
variable "app" {
  type = string
  default = "application"
}

variable "HTTP" {
  type = string
  default = "HTTP"
}

variable "h-thres" {
  type = number
  default = 3
}

variable "h-interval" {
  type = number
  default = 5
}

variable "health" {
  type = string
  default = "200"
}

variable "heal_path" {
  type = string
  default = "/health.html"
}

variable "tra_port" {
  type = string
  default = "traffic-port"
}

variable "h-timeout" {
  type = number
  default = 2
}

variable "unh-thres" {
  type = number
  default = 2
}

variable "forward" {
  type = string
  default = "forward"
}


# AUTO SCALING
variable "role" {
  type = string
  default = "admin_role"
}

variable "pla-group" {
  type = string
  default = "cluster"
}

variable "min_size" {
  type = number
  default = 2
}

variable "max_size" {
  type = number
  default = 10
}

variable "health_gp" {
  type = number
  default = 60
}

variable "disired-capacity" {
  type = number
  default = 2
}

variable "health_type" {
  type = string
  default = "EC2"
}

# DATABASE
variable "allocated_storage" {
  type = number
  default = 20
}

variable "storage_type" {
  type = string
  default = "gp2"
}

variable "engine_ver" {
  type = string
  default = "8.0"
}

variable "db_ins" {
  type = string
  default = "db.t2.micro"
}

variable "db_name" {
  type = string
  default = "pikadb"
}

variable "db_iden" {
  type = string
  default = "pikadb"
}

variable "db_user" {
  type = string
  default = "pika"
}

variable "db_passwd" {
  type = string
  default = "wlsldjdtm5"
}

variable "db_pgn" {
  type = string
  default = "default.mysql8.0"
}