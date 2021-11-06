

module "ResourceGroup" {
  source  = "./Module/rg"
  rgname = "resourcegroup"
  location = "west Europe"
}

module "ApplicationInsights" {
  source = "./module/application-insights"
  resourceGroup = module.ResourceGroup.rg
  location = module.ResourceGroup.location
}


