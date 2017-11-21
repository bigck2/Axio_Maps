library(tidyverse)
library(ggmap)

axio <- read_csv("Axio Data.csv", col_types = cols(.default = "c"))

table(axio$`Pipeline Stage`)

axio <- axio %>%
        rename(lon = Longitude,
               lat = Latitude) %>%
        mutate(lon = as.numeric(lon),
               lat = as.numeric(lat),
               `Year Built` = as.numeric(`Year Built`),
               Level = as.numeric(Level),
               Units = as.numeric(Units))


my_location <- c(lon = mean(axio$lon), lat = mean(axio$lat))


my_map_1 <- get_map(my_location)

ggmap(my_map_1)


my_map_2 <- get_map(my_location, maptype = "toner-2010", source = "stamen")

ggmap(my_map_2, extent = "device")




ggmap(my_map_2, extent = "device", 
      base_layer = ggplot(data = axio, 
                          aes(x = lon, y = lat, 
                              color = Submkt,
                              size = Units))) +
  geom_point(size = 3, alpha = 0.5)















