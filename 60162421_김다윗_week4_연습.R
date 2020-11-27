library(ggplot2)
diamonds
diamonds$x[diamonds$x == 0] <- NA
diamonds$x[is.na(diamonds$x)] <- 1000
diamonds_0 = diamonds[diamonds$x != 1000,]
diamonds_1 <- diamonds[diamonds$x >= 10,]
diamonds$h <- 1
diamonds$h[(diamonds$x > 1)&(diamonds$y > 2)] <- 100
diam?nds[diamonds$h, ]
diamonds$h[(diamonds$y>6)|(diamonds$z>7)] <- 200
diamonds$h

install.packages('tidyverse')
library(tidyverse)

raw <- read.csv('pew.csv', check.names = F)
head(raw)
install.packages('reshape2')
library(reshape2)
tidy <- melt(raw, id = 're?igion')
head(raw)
head(tidy)
names(tidy) <- c('religion', 'income', 'n')
head(tidy)
tidy <- melt(raw, id = 'religion', variable.name = 'income', value.name = 'n')
head(tidy)
raw <- read.delim('weather.txt', check.names = F, na.strings = '.')
head(raw)
raw ?- melt(raw, id = c('year', 'month', 'element'), variable.name = 'day', value.name = 'value', na.rm = TRUE)
raw <- raw[ , c('year', 'month', 'day', 'element', 'value')]
head(raw)
tidy <- dcast(raw, year + month + day ~ element, value.var = 'value')
head(tid?)
titanic2 <- read.csv('titanic2.csv', stringsAsFactors = FALSE)
head(titanic2)
tidy <- melt(titanic2, id = c('class', 'age', 'fate'), variable.name = 'sex', value.name = 'value')
head(tidy)
tidy <- dcast(tidy, class + age + sex ~ fate, value.var = 'value'?
head(tidy)
tidy$rate <- tidy$rate[(tidy$survived)/(tidy$survived + tidy$perished)]
tidy$rate
tidy$rate <- round((tidy$survived)/(tidy$survived + tidy$perished), 2)
tidy$rate
head(tidy)
