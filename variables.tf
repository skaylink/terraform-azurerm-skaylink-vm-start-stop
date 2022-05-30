# A Terraform module to create a subset of cloud components
# Copyright (C) 2022 Skaylink GmbH

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# For questions and contributions please contact info@iq3cloud.com

variable "resource_group_name" {
  type        = string
  description = "name of resorcegroup. Should be the same as the parrent virtual machine"
}

variable "action_type" {
  type        = string
  description = "The Type of action. must be 'StartVm' or 'StopVm'."
}

variable "vm_name" {
  type        = string
  description = "The name of the VM to be stopped or started."
}

variable "sp_client_id" {
  type        = string
  description = "Service principal clientID."
}

variable "sp_client_secret" {
  type        = string
  description = "Service principal secret value."
}

variable "hours" {
  type        = list(string)
  default     = ["12"]
  description = "Hour when the scheduler should start."
}

variable "minutes" {
  type        = list(number)
  default     = [0]
  description = "Minute of hour when the scheduler should start."
}

variable "week_days" {
  type        = list(string)
  default     = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  description = "week days when the scheduler should be executed"
}

variable "time_zone" {
  type        = string
  default     = "W. Europe Standard Time"
  description = "Time zone. default is 'W. Europe Standard Time'."
}
