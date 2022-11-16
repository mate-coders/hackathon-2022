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

# Plazas Provincia de Mendoza
plazas_pm <- c(14100, 9009, 6198, 3137, 2727, 2276, 5533)
n_plazas_pm <- c("Hoteles", "Campings", "Cabañas", "PAT", "Apart Hotel", "Hostel", "Otros")
pie(plazas_pm, labels = n_plazas_pm, main = "Plazas disponibles prov. Mendoza")

# Plazas dpto San Rafael
plazas_sr <- c(2540, 2376, 1640, 1017, 2452)
n_plazas_sr <- c("Cabañas", "Campings", "Hoteles", "PAT", "Otros")
pie(plazas_sr, labels = n_plazas_sr, main = "Plazas disponibles Dpto. San Rafael") 


