module "service_plan_function" {
  source                   = "./modules/service-plan-function"
  name-plan-func           = "${var.env}-func-b1"   
  resource_group_name      = var.resource_group_name
  location-name            = var.location-name      
}