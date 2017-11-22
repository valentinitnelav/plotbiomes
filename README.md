
<!-- README.md is generated from README.Rmd. Please edit that file -->
plotbiomes
==========

R package containing data for plotting [Whittaker' biomes](https://en.wikipedia.org/wiki/Biome#Whittaker_.281962.2C_1970.2C_1975.29_biome-types) with [ggplot2](https://github.com/tidyverse/ggplot2).

The original graph is Figure 5.5 in *Ricklefs, R. E. (2008), The economy of nature. W. H. Freeman and Company.* (Chapter 5, Biological Communities, The biome concept). The figure was processed and brought into an R friendly format. Details are given in [Whittaker\_biomes\_dataset](https://rawgit.com/valentinitnelav/plotbiomes/master/inst/doc/Whittaker_biomes_dataset.html) vignette, or after package installation, run `RShowDoc("Whittaker_biomes_dataset", package = "plotbiomes")`

Plotting Whittaker' biomes was also addressed in [BIOMEplot](https://github.com/kunstler/BIOMEplot) by Georges Kunstler.

Installation
------------

You can install `plotbiomes` from github with:

``` r
# install.packages("devtools")
devtools::install_github("valentinitnelav/plotbiomes")
```

Example
-------

Check examples at [Whittaker\_biomes\_examples](https://rawgit.com/valentinitnelav/plotbiomes/master/html/Whittaker_biomes_examples.html).

Simple example of plotting Whittaker' biomes:

``` r
require(plotbiomes)
require(ggplot2)
# Plot Whittaker' biomes with ggplot()
ggplot() +
 geom_polygon(data = Whittaker_biomes,
              aes(x      = temp_c,
                  y      = precp_cm,
                  fill   = biome,
                  group  = biome_id),
              colour = "gray98", # colour of polygon border
              size   = 0.5) +    # thickness of polygon border
 # fill polygons with predefined colors (as in Ricklefs, 2008)
 scale_fill_manual(name   = "Whittaker biomes",
                   breaks = names(Ricklefs_colors),
                   labels = names(Ricklefs_colors),
                   values = Ricklefs_colors)
```

![](man/figures/README-example-1.png)
