#do param vary USDS
#index scores diff at each site / USDS
#nutrient US v DS

data <- data %>%
  mutate(SiteGroup = if_else(str_detect(Site, "^DS"), "DS", "US"))
#mark each site as up or downstream
