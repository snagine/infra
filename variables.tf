variable "server_port" {
    description = "The port that server will use to handle HTTP requests"
    default = 8080
    type = number

    validation {
      condition = var.server_port > 0 && var.server_port < 65636
      error_message = "value"
    }
}