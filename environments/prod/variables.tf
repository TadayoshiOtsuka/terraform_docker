variable "region" {
  description = "リージョン"
  type        = string
}

variable "project_name" {
  description = "プロジェクトの名前"
  type        = string
}

variable "default_tags" {
  description = "リソースへ共通で設定するタグ"
  type        = map(string)
}

variable "env" {
  description = "prod/stgなどの環境"
  type        = string
  default     = "prod"

  validation {
    condition     = contains(["prod"], var.env)
    error_message = "Only \"prod\" is allowed in this variable."
  }
}
