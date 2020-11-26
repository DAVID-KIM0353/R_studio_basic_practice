install.packages(c('maps', 'RColorBrewer'))
library(maps)
library(RColorBrewer)
dimonds[1:6, ]
library(ggplot2)
qplot(x = 1:10, y = 1:10)
diamonds.head()
diamonds[1:6, ]
nrow(diamonds)
head(diamonds, 5)
View(diamonds)
qplot(x , y, data = diamonds)
x <- C(1? 2, 3, 4, 5)
a <- c(1, 2, 3, 4, 5)
a > 3
1 %in% a
a
6 %in% a
c(3, 4, 5, 6) %in% c(2, 3, 4)
a <- (1 : 10)
a
(a > 9) & (a < 3)
b <- 10
(b > 3) & (b < 10)
b
(b > 3) | (b < 10) | (b < 0)
(b > 3) 
(b > 3) & (b < 11) | (b < 5)
b
b
b
XOR((b > 3), (b > 10))
xor((b?> 3), (b > 10))
!(b>3)
(b>3)
!(b>3)
c <- c(3, 4, 5, 6)
c
any(c > 6)
any(c >5 )
c
all(c>3)
all(c > 2)
head(diamonds, 5)
x_zeros <- diamonds$x == 0
head(x_zeros, 5)
diamonds[x_zeros, ]
diamonds[diamonds$x == 0, ]
big <- diamonds[diamonds$x > 10, ]
big
q <- c?1, NA)
q == NA
is.na(q)
w <- c(1, 2, 3, 4, NA)
sum(w)
sum(w, na.rm = TRUE)
qplot(x, y, data = diamonds)
summary(diamonds$x)
is.na(diamonds$x)
diamonds$x[diamonds$x == 0] <- NA
summary(diamonds$x)
summary(diamonds$y)
y_big = diamonds$y[(diamonds$y > 20)|(di?monds$y == 0)] <- NA
diamonds$y <- y_big
diamonds$
rm(diamonds)
diamonds$y
head(diamonds, 5)
rm(diamonds)
head(diamonds, 5)
summary(diamonds$x)
diamonds$x[diamonds$x == 0] <- NA
summary(diamonds$x)
summary(diamonds$y)
y_big = diamonds$y[(diamonds$y >20)&(d?amonds$y == 0)] <- NA
y_big
summary(diamonds$y)
diamonds$y[(diamonds$y > 20)|(diamonds$y == 0)] <- NA
summary(diamonds$y)
head(diamonds$y)
qplot(x, y, data = diamonds)
barplot(diamonds$y)
