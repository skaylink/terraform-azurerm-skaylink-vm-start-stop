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

locals {
  parameters_body = {
    actionType = {
      value = var.action_type
    }
    vmName = {
      value = var.vm_name
    }
    clientId = {
      value = var.sp_client_id
    }
    clientSecret = {
      value = var.sp_client_secret
    }
    runHours = {
      value = var.hours
    }
    runMinutes = {
      value = var.minutes
    }
    runWeekDays = {
      value = var.week_days
    }
    timeZone = {
      value = var.time_zone
    }
  }
}

resource "azurerm_resource_group_template_deployment" "logicapp" {
  name                = "${var.action_type}-deployment"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  parameters_body     = jsonencode(local.parameters_body)
  template_body       = file("${path.module}/main.json")
}