library(tidyr)
library(readxl)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggthemes)

demanda
# pt = Pernoctaciones Totales
# pr = Pernoctaciones Residentes
# pnr = Pernoctaciones No Residentes
# vt = Viajeros Totales
# vr = Viajeros Residentes
# vnr = Viajeros No Residentes
# dt = Duración de estadía promedio de los turistas totales
# dr = Duración residentes
# dnr = Duración No Residentes

ofertaydemanda
# et = Establecimientos totales
# eh = Establecimientos hoteleros
# eph = Establecimientos para hoteleros
# hudt = Habitaciones o unidades disponibles totales
# hudh = Habitaciones o unidades disponibles hoteleros
# hudph = Habitaciones o unidades disponibles para hoteleros
# huot = Habitaciones o unidades ocupadas total
# huoh = Habitaciones o unidades ocupadas hoteleros
# huoph = Habitaciones o unidades ocupadas para hoteleros
# pdt = Plazas disponibles total
# pdh = Plazas disponibles hoteleros
# pdph = plazas disponibles para hoteleros
# pot = Plazas ocupadas total
# poh = plazas ocupads hoteleros
# poph = plazas ocupadas para hoteleros
# pohut = porcentaje ocupación habitaciones o unidades total
# pohuh = Porcentaje ocupación habitaciones o unidades hoteleros
# pohuph = Porcentaje ocupación habitaciones o unidades para hoteleros
# popt = Porcentaje ocupaciones de plazas totales
# poph1 = Porcentaje ocupacion de plazas hoteleros
# popph = Porcentaje ocupacion de plazas para hoteleros
# vt = Viajeros totales
# vh = Viajeros hoteleros
# vph = Viajeros para hoteleros
# det = Duración de estadía promedio de los turistas total
# deh = Duracion de estadía promedio de los turistas hoteleros
# deph = Duración de estadía pormedio de los turistas para hoteleros


# Graficos para la oferta
of <- ggplot(ofertaydemanda)
of + geom_line(aes(date, PDT))
of + geom_line(aes(date, HUDT))

# Graficos de la demanda
ggplot(ofertaydemanda) +
  aes(x = date, y = VT) +
  geom_line(size = 0.8, colour = "#FF8C00") +
  labs(
    x = "Fecha",
    y = "Cantidad de viajeros por mes",
    title = "Viajeros Totales"
  ) +
  theme_economist() +
  theme(
    plot.title = element_text(size = 18L,
                              face = "bold.italic",
                              hjust = 0.5)
  )

ggplot(ofertaydemanda) +
  aes(x = date, y = POPT) +
  geom_line(size = 0.8, colour = "#FF8C00") +
  labs(
    x = "Fecha",
    y = "Porcentaje de ocupacion de plazas totales",
    title = "Ocupacion de plazas"
  ) +
  theme_economist() +
  theme(
    plot.title = element_text(size = 18L,
                              face = "bold.italic",
                              hjust = 0.5)
  )

ggplot(ofertaydemanda) +
  aes(x = date, y = DET) +
  geom_line(size = 0.8, colour = "#FF8C00") +
  labs(
    x = "Fecha",
    y = "Dias",
    title = "Duracion de estadía promedio de los turistas"
  ) +
  theme_economist() +
  theme(
    plot.title = element_text(size = 18L,
                              face = "bold.italic",
                              hjust = 0.5)
  )

# Estos graficos no me convencen tanto
ggplot(demanda) +
  aes(x = date, y = VT) +
  geom_line(size = 0.8, colour = "#FF8C00") +
  labs(
    x = "Fecha",
    y = "Cantidad de viajeros por mes",
    title = "Viajeros Totales"
  ) +
  theme_economist() +
  theme(
    plot.title = element_text(size = 18L,
                              face = "bold.italic",
                              hjust = 0.5)
  )
ggplot(demanda) +
  aes(x = date, y = VR) +
  geom_line(size = 0.8, colour = "#FF8C00") +
  labs(
    x = "Fecha",
    y = "Cantidad de viajeros por mes",
    title = "Viajeros Residentes de Argentina"
  ) +
  theme_economist() +
  theme(
    plot.title = element_text(size = 18L,
                              face = "bold.italic",
                              hjust = 0.5)
  )
ggplot(demanda) +
  aes(x = date, y = VNR) +
  geom_line(size = 0.8, colour = "#FF8C00") +
  labs(
    x = "Fecha",
    y = "Cantidad de viajeros por mes",
    title = "Viajeros No Residentes de Argentina"
  ) +
  theme_economist() +
  theme(
    plot.title = element_text(size = 18L,
                              face = "bold.italic",
                              hjust = 0.5)
  )


