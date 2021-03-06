<<<<<<< HEAD
#```{r pacakges&data, message=FALSE, warning=FALSE}
=======

>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71
library(tidyverse)
library(sf)
library(sp)
library(gstat)
library(rgdal)
library(maptools)
library(mapdata)
library(rworldmap)
library(RColorBrewer)
#library(grDevices)
library(wesanderson)
library(viridis)

happy2015 <- read_csv("2015.csv")
happy2016 <- read_csv("2016.csv")
happy2017 <- read_csv("2017.csv")
longlat <- read_csv("latlong.csv")


#Individual years dataframes
<<<<<<< HEAD
#```{r combine_data}
=======
>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71
# Add year column
happy2015$Year <- rep(2015, 158)

# Reorder to put year on the left
happy2015 <- happy2015[,c(13,1,2,3,4,5,6,7,8,9,10,11,12)]
happy2015 <- happy2015 %>% 
  select("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")
colnames(happy2015) <- c("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

# Same process for 2016
happy2016$Year <- rep(2016, 157)
happy2016 <- happy2016[,c(14,1,2,3,4,5,6,7,8,9,10,11,12,13)]
happy2016 <- happy2016 %>% 
  select("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")
colnames(happy2016) <- c("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

# Same Process for 2017
happy2017$Year <- rep(2017, 155)
happy2017 <- happy2017[,c(13,1,2,3,4,5,6,7,8,9,10,11,12)]
happy2017 <- happy2017 %>% 
  select("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")
colnames(happy2017) <- c("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

#happy2017$Country <- as.character(happy2017$Country)
#summary(happy2017)


#Dataframe with years combines vertically
# Combine all years into stacked data
# vertical_years <- rbind(happy2017,happy2016,happy2015)


#Dataframe with years combined horizontally
# Combine all data horizontally
full_happy <- full_join(happy2015, happy2016, by = "Country")
horizontal <- full_join(full_happy, happy2017, by = "Country")

# Add country codes
horizontal$ISO <- c("AFG","ALB","DZA","AGO","ARG","ARM","AUS","AUT","AZE","BHR","BGD","BLR","BEL","BEN","BTN","BOL","BIH","BWA","BRA","BGR","BFA","BDI","KHM","CMR","CAN","CAF","TCD","CHL","CHN","COL","COM","COG","COD","CRI","HRV","CYP","CZE","DNK","DJI","DOM","ECU","EGY","SLV","EST","ETH","FIN","FRA","GAB","GEO","DEU","GHA","GRC","GTM","GIN","HTI","HND","HKG","HUN","ISL","IND","IDN","IRN","IRQ","IRL","ISR","ITA","CIV","JAM","JPN","JOR","KAZ","KEN","XKX","KWT","KGZ","LAO","LVA","LBN","LSO","LBR","LBY","LTU","LUX","MKD","MDG","MWI","MYS","MLI","MLT","MRT","MUS","MEX","MDA","MNG","MNE","MAR","MOZ","MMR","NPL","NLD","NZL","NIC","NER","NGA","NA","NOR","OMN","PAK","PSE","PAN","PRY","PER","PHL","POL","PRT","QAT","ROU","RUS","RWA","SAU","SEN","SRB","SLE","SGP","SVK","SVN","SOM","ZAF","KOR","ESP","LKA","SDN","SUR","SWZ","SWE","CHE","SYR","TWN","TJK","TZA","THA","TGO","TTO","TUN","TUR","TKM","UGA","UKR","ARE","GBR","USA","URY","UZB","VEN","VNM","YEM","ZMB","ZWE","PRI","BLZ","SOM","NAM","SSD")

#Reorder to put "ISO" column nect to "Country"
horizontal <- horizontal[,c(1,2,29, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28)]

#Rename columns
colnames(horizontal) <- c("Year15","Country","ISO","Rank15","Score15","GDP15","Family15","Health15","Freedom15","Trust15","DysRes15","Year16","Rank16","Score16","GDP16","Family16","Health16","Freedom16","Trust16","DysRes16","Year17","Rank17","Score17","GDP17","Family17","Health17","Freedom17","Trust17","DysRes17")


iso15 <- horizontal %>% 
  select(Year15, Country, ISO, Rank15, Score15, GDP15, Family15, Health15, Freedom15, Trust15, DysRes15) %>% 
  filter(Year15 !="NA")
colnames(iso15) <- c("Year","Country","ISO","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

iso16 <- horizontal %>% 
  select(Year16, Country, ISO, Rank16, Score16, GDP16, Family16, Health16, Freedom16, Trust16, DysRes16) %>% 
  filter(Year16 !="NA")
colnames(iso16) <- c("Year","Country","ISO","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

iso17 <- horizontal %>% 
  select(Year17, Country, ISO, Rank17, Score17, GDP17, Family17, Health17, Freedom17, Trust17, DysRes17) %>% 
  filter(Year17 !="NA")
colnames(iso17) <- c("Year","Country","ISO","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

vertical <- rbind(iso15,iso16,iso17)

vertical_table2 <- vertical_table %>% 
  select("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust")

vertical_table2$Score <- round(vertical$Score,digits=c(2))
vertical_table2$GDP <- round(vertical$GDP,digits=c(2))
vertical_table2$Family <- round(vertical$Family,digits=c(2))
vertical_table2$Health <- round(vertical$Health,digits=c(2))
vertical_table2$Freedom <- round(vertical$Freedom,digits=c(2))
vertical_table2$Trust <- round(vertical$Trust,digits=c(2))


iso15<- horizontal %>% 
  select(Year15, Country, Rank15, Score15, GDP15, Family15, Health15, Freedom15, Trust15, DysRes15) %>% 
  filter(Year15 !="NA")
colnames(iso15) <- c("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

iso16 <- horizontal %>% 
  select(Year16, Country, Rank16, Score16, GDP16, Family16, Health16, Freedom16, Trust16, DysRes16) %>% 
  filter(Year16 !="NA")
colnames(iso16) <- c("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

iso17 <- horizontal %>% 
  select(Year17, Country,  Rank17, Score17, GDP17, Family17, Health17, Freedom17, Trust17, DysRes17) %>% 
  filter(Year17 !="NA")
colnames(iso17) <- c("Year","Country","Rank","Score","GDP","Family","Health","Freedom","Trust","DysRes")

vertical_table <- rbind(iso15, iso16, iso17)
vertical_table$Year <- as.character(vertical_table$Year)




#-Datasets for mapping with rworldmap (no coordinates)
<<<<<<< HEAD
#```{r}
=======
>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71
#10 happiest
top10_15<-horizontal%>% 
  select("Country","ISO","Rank15") %>% 
  arrange(Rank15) %>% 
  head(10)

top10_16<-horizontal%>% 
  select("Country","ISO","Rank16") %>% 
  arrange(Rank16) %>% 
  head(10)

top10_17<-horizontal%>% 
  select("Country","ISO","Rank17") %>% 
  arrange(Rank17) %>% 
  head(10)


#Horizontal dataframe with lat long. 
#add coordinates to horizontal
#horizontal_longlat <- full_join(horizontal, longlat, by = "Country")

# Add specital component with long/lat coordinates
#horizontal_geom <- st_as_sf(horizontal_longlat, coords = c("long","lat"))


# Basic world map
#map('worldHires')



#Basic world map
#countries <- st_read(dsn=".",layer = "TM_WORLD_BORDERS-0.3")
#plot(countries)


#Top 10 rankings for each year with long/lat coordinates
#```{r}
map_15 <- full_join(happy2015, longlat, by = "Country") %>% 
  filter(Year !="NA") %>% 
  st_as_sf(coords=c("lat","long"))

map_16 <- full_join(happy2016, longlat, by = "Country") %>% 
  filter(Year !="NA") %>% 
  st_as_sf(coords=c("lat","long"))

map_17 <- full_join(happy2017, longlat, by = "Country") %>% 
  filter(Year !="NA") %>% 
  st_as_sf(coords=c("lat","long"))


#Countries with bubbles
#```{r bubbles_on_countries}
## Cdf coordinate systems
#st_crs(map_15) <- 4326
#st_crs(countries) <- 4326

#ggplot(map_15)+
#  geom_sf(data=countries) +
#  geom_sf(aes(color = Rank))+
#  scale_color_gradient(low="red",high="green")+
#  theme_bw()


#Whole world happiness
# map("world")

# Data for whole world happiness ranking
world_happiness <- horizontal %>% 
  filter(Year15 == "2015") %>% 
  select("Country","ISO","Rank15")

# Prep data for mapping with rworldmap
vertical2 <- joinCountryData2Map(vertical
                                 , joinCode = "ISO3"
                                 , nameJoinColumn="ISO")

# Trying to find the unicorn palette...
spectral <- brewer.pal(155,"Spectral")
RdYlBu <- brewer.pal(155,"RdYlBu")
greens <- brewer.pal(155,"Greens")
RdBu <- c("#B2182B", "#D6604D", "#F4A582", "#FDDBC7", "#D1E5F0", "#92C5DE", "#4393C3", "#2166AC")

#show_col(viridis_pal()(10))

spectral <- rwmGetColours(spectral, 10)

rwmGetColours("Spectral", 10)

as.vector(RdBu)

zissou <- wes_palette("Zissou", 155, type = c("continuous"))
#rushmore <- wes_palette("Rushmore", type = "continuous")

<<<<<<< HEAD
=======
mypalette<-brewer.pal(7,"Greens")
>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71

# Map data using rworld map

# Map data using rworld map
map_all_2015 <- mapCountryData(vertical2, 
                               nameColumnToPlot = "Rank",
                               numCats = 140,
                               catMethod = 'FixedWidth',
                               colourPalette = spectral,
                               missingCountryCol = "grey80",
                               mapTitle = "Global Happniness Rankings",
                               addLegend = TRUE)




#Prep data to be mapped with rworldmap - 10 Happiest for each year.
<<<<<<< HEAD
#```{r}
=======
>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71
top10_15map <- joinCountryData2Map(top10_15
                                   , joinCode = "ISO3"
                                   , nameJoinColumn="ISO")

top10_16map <- joinCountryData2Map(top10_16
                                   , joinCode = "ISO3"
                                   , nameJoinColumn="ISO")

top10_17map <- joinCountryData2Map(top10_17
                                   , joinCode = "ISO3"
                                   , nameJoinColumn="ISO")
<<<<<<< HEAD


=======
>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71
#Create top10 maps

mapCountryData(top10_15map, 
               nameColumnToPlot = "Rank15",
               catMethod = 'categorical',
               colourPalette = zissou)

mapCountryData(top10_16map, 
               nameColumnToPlot = "Rank16",
               catMethod = 'categorical',
               colourPalette = zissou)

mapCountryData(top10_17map, 
               nameColumnToPlot = "Rank17",
               catMethod = 'categorical',
               colourPalette = zissou)

<<<<<<< HEAD


=======
>>>>>>> 58526c5d23e36be03b684be8bc500a01213dae71
vert15 <- vertical %>% 
  filter(Year =="2015")

vert16 <- vertical %>% 
  filter(Year =="2016")

vert17 <- vertical %>% 
  filter(Year =="2017")

vert15 <- joinCountryData2Map(vert15
                              , joinCode = "ISO3"
                              , nameJoinColumn="ISO")

vert16 <- joinCountryData2Map(vert16
                              , joinCode = "ISO3"
                              , nameJoinColumn="ISO")
vert17 <- joinCountryData2Map(vert17
                              , joinCode = "ISO3"
                              , nameJoinColumn="ISO")


