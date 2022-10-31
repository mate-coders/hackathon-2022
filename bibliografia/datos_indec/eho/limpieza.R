library(tidyr)
library(readxl)
library(dplyr)

# EOH 18
columnas <- c('PT','PR','PNR','VT','VR','VNR','DT','DR','DNR')
meses <- c('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre')
p <- read_excel('EOH_cuadros_18/EOH_dic18demanda_cuadros.xls', range = 'San Rafael!A5:AA17')
p2 <- select(p, meses)
p3 <- drop_na(p2)
p4 <- t(p3)
eoh18 <- data.frame(`colnames<-`(p4, columnas))

# EOH 19
p <- read_excel('EOH_cuadros_19/EOH_dic19demanda_cuadros.xls', range = 'San Rafael!A5:AA17')
p2 <- select(p, meses)
p3 <- drop_na(p2)
p4 <- t(p3)
eoh19 <- data.frame(`colnames<-`(p4, columnas))

# EOH 20
p <- read_excel('EOH_cuadros_20/eoh_dic20_demanda_cuadros.xls', range = 'San Rafael!A5:AA17', col_types = "numeric")
p2 <- select(p, meses)
p3 <- slice(p2, c(2:4, 6:8, 10:12))
p4 <- t(p3)
eoh20 <- data.frame(`colnames<-`(p4, columnas))

# EOH 21
p <- read_excel('EOH_cuadros_21/eoh_dic21_demanda_cuadros.xls', range = 'San Rafael!A5:AA17', col_types = "numeric")
p2 <- select(p, meses)
p3 <- slice(p2, c(2:4, 6:8, 10:12))
p4 <- t(p3)
eoh21 <- data.frame(`colnames<-`(p4, columnas))

# EOH 22
p <- read_excel('EOH_cuadros_21/eoh_dic21_demanda_cuadros.xls', range = 'San Rafael!A5:AA17', col_types = "numeric")
p2 <- select(p, meses[])
p3 <- slice(p2, c(2:4, 6:8, 10:12))
p4 <- t(p3)
eoh21 <- data.frame(`colnames<-`(p4, columnas))