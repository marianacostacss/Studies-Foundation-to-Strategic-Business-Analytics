
# Final Presentation of the Module

### Dataset ###

install.packages(c("ggplot2", "plyr", "dplyr"))

#Package for data visualization
library(ggplot2)

# Dataset
mpg
?mpg
View(mpg)



# Creating the first chart
ggplot(mpg, aes(displ, cty)) +
  geom_point()

#package for data modeling
library(plyr)

# change some names of the variables and doing the bkp in carros dataset
carros <- rename(mpg, c("manufacturer" = "Marca",
                       "displ" = "Cilindradas",
                       "cty" = "Consumo",
                       "drv" = "Tração",
                       "class" = "Tipo"))

names(mpg)
names(carro)


### Gráficos ###

# Consumo x Cilindradas
ggplot(carros, aes(Cilindradas, Consumo)) +
  geom_point()

# Consumo x Cilindradas x Tipo x Tração
ggplot(carros, aes(Cilindradas, Consumo,
                   Size = Tração,
                   Color = Tipo)) +
  geom_point()


carros$Consumo
summary(carros$Consumo)
table(carros$Consumo)
prop.table(table(carros$Consumo))
round(prop.table(table(carros$Consumo))*100)

ggplot(carros, aes(Consumo)) +
  geom_histogram()


### Manipulação com Dplyr ###
# pacotes para manipulação de dados
library(dplyr)

# Apenas carros com sonsumo = 9
carros %>% filter(Consumo == 9)
View(carros %>% filter(Consumo == 9))

m <- carros %>%
  select(Marca, Consumo) %>%
  filter(Consumo <= 11)
View(m)

m %>% group_by(Marca) %>%
  tally()

m %>% group_by(Marca) %>%
  summarise(mean(Consumo))

# BI x Ciência de Dados

### Regressão Linear ###

# Consumo x Cilindradas x Tipo x Tração
ggplot(carros, aes(Cilindradas, Consumo)) +
  geom_point(aes(size = Tração, color = Tipo)) +
  geom_smooth(method = "lm")
