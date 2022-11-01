library(tidyr)
library(readxl)
library(dplyr)
fecha <- function(meses, anio){
  x <- 1
  for (mes in meses){
    meses[x] <- paste(mes, anio, sep = "-")
    x <- x + 1
  }
  return (meses)
}


# EOH demanda 18
columnas <- c('PT','PR','PNR','VT','VR','VNR','DT','DR','DNR')
meses <- c('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
p <- read_excel('EOH_cuadros_18/EOH_dic18demanda_cuadros.xls', range = 'San Rafael!A5:AA17')
p2 <- select(p, meses)
p3 <- drop_na(p2)
p4 <- t(p3)
filas <- fecha(meses, "18")
eoh18 <- data.frame(`colnames<-`(p4, columnas), row.names = filas)

# EOH demanda 19
p <- read_excel('EOH_cuadros_19/EOH_dic19demanda_cuadros.xls', range = 'San Rafael!A5:AA17')
p2 <- select(p, meses)
p3 <- drop_na(p2)
p4 <- t(p3)
filas <- fecha(meses, "19")
eoh19 <- data.frame(`colnames<-`(p4, columnas), row.names = filas)

# EOH demanda 20
p <- read_excel('EOH_cuadros_20/eoh_dic20_demanda_cuadros.xls', range = 'San Rafael!A5:AA17', col_types = "numeric")
p2 <- select(p, meses)
p3 <- slice(p2, c(2:4, 6:8, 10:12))
p4 <- t(p3)
filas <- fecha(meses, "20")
eoh20 <- data.frame(`colnames<-`(p4, columnas), row.names = filas)

# EOH demanda 21
p <- read_excel('EOH_cuadros_21/eoh_dic21_demanda_cuadros.xls', range = 'San Rafael!A5:AA17', col_types = "numeric")
p2 <- select(p, meses)
p3 <- slice(p2, c(2:4, 6:8, 10:12))
p4 <- t(p3)
filas <- fecha(meses, "21")
eoh21 <- data.frame(`colnames<-`(p4, columnas), row.names = filas)

# EOH demanda 22
p <- read_excel('EOH_cuadros_21/eoh_dic21_demanda_cuadros.xls', range = 'San Rafael!A5:AA17', col_types = "numeric")
p2 <- select(p, meses[1:8])
p3 <- slice(p2, c(2:4, 6:8, 10:12))
p4 <- t(p3)
filas <- fecha(meses[1:8], "22")
eoh22 <- data.frame(`colnames<-`(p4, columnas), row.names = filas)

tabla_demanda <- bind_rows(eoh18,eoh19,eoh20,eoh21,eoh22)


columnas <- c("ET", "EH", "EPH", "HUDT", "HUDH", "HUDPH", "HUOT", "HUOH", "HUOPH", "PDT", "PDH", "PDPH", "POT", "POH", "POPH", "POHUT", "POHUH", "POHUPH", "POPT", "POPH", "POPPH", "VT", "VH", "VPH", "DET", "DEH", "DEPH")
# EOH oferta y demanda 18
p <- read_excel('EOH_cuadros_18/EOH_dic18ofyde_establecimientos.xls', range = 'San Rafael!A5:AA50', col_types = "numeric")
p <- select(p, meses)
p <- drop_na(p)
p <- t(p)
filas <- fecha(meses, "18")
eoh_oyd_18 = data.frame(`colnames<-`(p, columnas), row.names = filas)

# EOH oferta y demanda 19
p <- read_excel('EOH_cuadros_19/EOH_dic19ofyde_establecimientos.xls', range = 'San Rafael!A5:AA50', col_types = "numeric")
p <- select(p, meses)
p <- drop_na(p)
p <- t(p)
filas <- fecha(meses, "19")
eoh_oyd_19 = data.frame(`colnames<-`(p, columnas), row.names = filas)

# EOH oferta y demanda 20
p <- read_excel('EOH_cuadros_20/eoh_dic20_oyd_cuadros.xls', range = 'San Rafael!A5:AA50', col_types = "numeric")
p <- select(p, meses)
p <- slice(p, c(3:5, 8:10, 13:15, 18:20, 23:25, 28:30, 33:35, 38:40, 43:45))
p <- t(p)
filas <- fecha(meses, "20")
eoh_oyd_20 = data.frame(`colnames<-`(p, columnas), row.names = filas)

# EOH oferta y demanda 21
p <- read_excel('EOH_cuadros_21/eoh_dic21_oyd_cuadros.xls', range = 'San Rafael!A5:AA50', col_types = "numeric")
p <- select(p, meses)
p <- slice(p, c(3:5, 8:10, 13:15, 18:20, 23:25, 28:30, 33:35, 38:40, 43:45))
p <- t(p)
filas <- fecha(meses, "21")
eoh_oyd_21 = data.frame(`colnames<-`(p, columnas), row.names = filas)

# EOH oferta y demanda 22
p <- read_excel('EOH_cuadros_22/eoh_ago22_oyd_cuadros.xls', range = 'San Rafael!A5:AA50', col_types = "numeric")
p <- select(p, meses[1:8])
p <- slice(p, c(3:5, 8:10, 13:15, 18:20, 23:25, 28:30, 33:35, 38:40, 43:45))
p <- t(p)
filas <- fecha(meses[1:8], "22")
eoh_oyd_22 = data.frame(`colnames<-`(p, columnas), row.names = filas)

tabla_oyd = bind_rows(eoh_oyd_18, eoh_oyd_19, eoh_oyd_20, eoh_oyd_21, eoh_oyd_22)

# Graficos


