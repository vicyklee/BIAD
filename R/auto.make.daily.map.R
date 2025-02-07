#------------------------------------------------------------------
sql.command <- "SELECT * FROM BIAD.Sites"
d <- sql.wrapper(sql.command,user,password,hostname,hostuser,keypath,ssh)
#------------------------------------------------------------------
xmn <- min(d$Longitude, na.rm=T)
xmx <- max(d$Longitude, na.rm=T)
ymn <- min(d$Latitude, na.rm=T)
ymx <- max(d$Latitude, na.rm=T)
#-----------------------------------------------------------------
require(ggplot2)
require(sf)
require(rnaturalearth)
require(rnaturalearthdata)

xmean <- mean(d$Longitude, na.rm=T)
ymean <- mean(d$Latitude, na.rm=T)

crs <- paste("+proj=ortho +lat_0=",ymean," + lon_0=",xmean,sep='')

points <- st_as_sf(d, coords = c('Longitude','Latitude'), crs=4326)
points <- st_transform(points, crs=crs)

world <- ne_countries(scale='medium',returnclass='sf')
world <- st_transform(world, crs=crs)

map <- ggplot() + 
geom_sf(data=world, color='grey90',fill='grey') +
geom_sf(data = points, color = 'firebrick', pch=20, size=2) +
coord_sf(xlim=st_bbox(points$geometry)[c('xmin','xmax')],ylim=st_bbox(points$geometry)[c('ymin','ymax')]) + 
theme(panel.background=element_rect(fill='steelblue2'))

ggsave(file = '../tools/plots/map.svg', plot=map, width = 20, height = 15 )
#------------------------------------------------------------------

#-----------------------------------------------------------------