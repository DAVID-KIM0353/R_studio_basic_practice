library(ggplot2)
bnames <- read.csv('bnames.csv.bz2', stringsAsFactors = FALSE)
library(dplyr)
tbl <- data.frame(color = c('blue', 'black', 'blue', 'blue', 'black'), value = 1 : 5)
tbl
filter(tbl, color == 'blue')
filter(tbl, value %in% c(1, 4))
filter(tbl? value %in% c(1, 6))
head(bnames)
head(filter(bnames, sex == 'girl' & (year == 1900 | (year == 2000))))
select(tbl, color) # 열 선택
tbl
select(tbl, value)
select(tbl, -color)
arrange(tbl, color)
arrange(tbl, desc(value)) # 내림차순
head(bnames)
arrange(bn?mes, desc(prop)) # John
tbl
mutate(tbl, double = 2*value)
tbl
tbl$double <- 2*tbl$value
tbl
drop.scope(tbl, double)
tbl
mutate(tbl, double = 2*value, quadruple = 2*double)
summarise(tbl, total = sum(value))
summarise(tbl, total = sum(value), avg = mean(val?e))
Births
Births <- read.csv('Births.csv')
head(Births)
head(bnames)
left_join(x, y, by = 'name')
inner_join(x, y, )
full_join
semi_join
head(bnames)
head(Births)
left_join(bnames, Births, by = c('year', 'sex'))

bnames2 <- left_join(bnames, Births, by = ?('year', 'sex')) # 1번
a <- mutate(bnames2, n = round(prop * births))
a 
library(reshape2)
head(bnames2)
year_sex <- group_by(bnames2, year, sex)
ranks <- mutate(year_sex, rank = rank(desc(prop)))
head(ranks)
ones <- filter(ranks, rank == 1)
ones
ones <- s?lect(ones, year, name, sex)
ones
dcast(ones, year ~ sex, value = 'name')
ones$name
