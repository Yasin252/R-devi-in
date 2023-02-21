---
  title: "Veri Manipülasyonu, Özetleme, Raporlama, Regresyon Analizi ve Normallik Testi
R Ödevi"
author: "Yasin Açıkgöz"
date: "`r format(Sys.time(), '%B %d, %Y')`"
output: html_document
---
  
  install.packages("dplyr")
install.packages("ggpubr")
install.packages("scales") 
library(scales)
library(dplyr)
library(ggpubr)
library(ggplot2)

data(mtcars)
head(mtcars)
summary(mtcars)

mtcars %>% 
  group_by(cyl) %>% 
  summarize(mean_hp = mean(hp), 
            mean_mpg = mean(mpg)) 

ggplot(data = mtcars, aes(x = hp, y = mpg, color = factor(cyl))) + 
  geom_point() + 
  labs(title = "Motor Gücü ve Yakıt Ekonomisi", 
       x = "Motor Gücü", 
       y = "Yakıt Ekonomisi",
       color = "Silindir Sayısı")
model <- lm(mpg ~ hp, data = mtcars)
summary(model)
ggarrange(
  ggplot(mtcars, aes(x = mpg)) + 
    geom_histogram(aes(y=..density..), colour = "green", fill = "white") + 
    geom_density(alpha = .2, fill="#FF6668") + 
    labs(title = "Histogram of MPG"),
  ggplot(mtcars, aes(sample = mpg)) + 
    stat_qq() + 
    stat_qq_line() + 
    labs(title = "Normal Probability Plot of MPG")
)
