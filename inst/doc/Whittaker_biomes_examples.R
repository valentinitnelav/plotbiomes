## ----echo = TRUE, message = FALSE, fig.align = 'center', fig.width = 18/2.54, fig.height = 10/2.54, fig.cap = 'Simple example of Whittaker biome polygons with ggplot'----

require(plotbiomes)
require(ggplot2)

plot_1 <- ggplot() +
  # add biome polygons
  geom_polygon(data = Whittaker_biomes,
               aes(x      = temp_c,
                   y      = precp_cm,
                   fill   = biome,
                   group  = biome_id),
               # adjust polygon border
               colour = "gray98",
               size   = 1)
plot_1

## ----echo = TRUE, fig.align = 'center', fig.width = 18/2.54, fig.height = 10/2.54, fig.cap = 'Whittaker biomes - original colors'----

plot_2 <- plot_1 +
  # fill the polygons with predefined colors
  scale_fill_manual(name   = "Whittaker biomes",
                    breaks = names(Ricklefs_colors),
                    labels = names(Ricklefs_colors),
                    values = Ricklefs_colors)
plot_2

## ---- echo = TRUE, message = FALSE---------------------------------------
require(raster)
# Read temperature and precipitation as raster stack
path <- system.file("extdata", "temp_pp.tif", package = "plotbiomes")
temp_pp <- stack(path)
names(temp_pp) <- c("temperature", "precipitation")

set.seed(66) # random number generator
# Create random locations within the bounding box of the raster
points <- spsample(as(temp_pp@extent, 'SpatialPolygons'), 
                   n = 1000, 
                   type = "random")
# Extract temperature and precipitation values from raster
extractions <- extract(temp_pp, points)
extractions <- data.frame(extractions)
# Adjust temperature values to "usual" scale because
# WorldClim temperature data has a scale factor of 10.
extractions$temperature <- extractions$temperature/10

## ---- echo = TRUE, message = FALSE, out.width = '45%', fig.align = 'center', fig.cap = 'Random locations'----
plot(temp_pp[[1]]/10)
plot(points,add=T)

## ---- echo = TRUE, message = FALSE, fig.align = 'center', fig.width = 18/2.54, fig.height = 10/2.54, fig.cap = 'Example of plot with superimposed data extracted from WorldClim'----
plot_3 <- plot_2 +
  # add extraction points
  geom_point(data = extractions, 
             aes(x      = temperature, 
                 y      = precipitation/10), 
             size   = 2,
             shape  = 21,
             colour = "Blue 4", 
             bg     = "Deep Sky Blue 4",
             alpha  = 0.6) +
  # set axes label names
  labs(x = expression("Mean annual temperature ("~degree~"C)"),
       y = "Mean annual precipitation (cm)") +
  # set range on OY axis and adjust the distance (gap) from OX axis
  scale_y_continuous(limits = c(-5, round(max(extractions$precipitation/10, 
                                              na.rm = TRUE)/50)*50), 
                     expand = c(0, 0)) +
  theme_bw() +
  theme(legend.justification = c(0, 1),     # anchor the upper left corner of the legend box
        legend.position = c(0.01, 0.99),    # adjust the position of the corner relative to axes
        panel.grid.minor = element_blank()) # eliminate minor grids

plot_3

