library(tidyr)
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(esquisse)

demanda <- read_csv("demanda.csv", col_types = 'Dnnnnnnnnn')
ofertaydemanda <- read_csv("demandayoferta.csv")

i <- ggplot(demanda, aes(date, PT))
i + geom_line()

i + geom_col()

i + geom_area()

p <- ggplot(ofertaydemanda, aes(date, POPT))
p + geom_area()

d <- ggplot(demanda, aes(date,DT))
d + geom_smooth(method = ) +
  theme_minimal()
