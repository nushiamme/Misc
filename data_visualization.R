## Test with Casey's data visualization tutorial
## Anusha Shankar
## April 12, 2016

## "ggplot" means grammar of graphics


## Packages
library(ggplot2)
library(devtools)

## Setwd and read in file
setwd("C:\\Users\\ANUSHA\\Desktop\\")

test <- read.csv("gapminder-FiveYearData.csv")


## geom_point(alpha=...) controls transparency. Plots lines for each group separately because col=
test_transparent <- ggplot(test, aes(lifeExp, gdpPercap)) +
  geom_point(alpha=0.2) + theme_bw() 

## scale_y_log10
## Makes an axis log10
## Now plots lines for each group separately because col=continent
## can use scale_y_continuous(trans='log')
## Or... trans = asn, exp, identitiy, log, log10, log2, logit, pow10, probit, recip, reverse, sqrt
test_log_col <- ggplot(test, aes(lifeExp, gdpPercap, col=continent)) +
  geom_point(alpha=0.2) + theme_bw() + scale_y_log10() + geom_smooth(method='lm')



## Line plot
test_log_country <- ggplot(test, aes(year, lifeExp, by=country)) +
  geom_line() + theme_bw()
test_log_country

## Color lines by country
test_log_country_col <- ggplot(test, aes(year, lifeExp, by=country, col=continent)) +
  geom_line() + theme_bw()
test_log_country_col

## Color lines by country, added points
test_log_country_col <- ggplot(test, aes(year, lifeExp, by=country, col=continent)) +
  geom_line() + theme_bw() + geom_point()
test_log_country_col

## Boxplot, violin plots
ggplot(test, aes(continent, lifeExp)) +
  geom_boxplot()

## Boxplot, violin plots, plotted by country, colored by continent
ggplot(test, aes(country, lifeExp, col=continent)) + theme_classic() +
  geom_boxplot() + theme(axis.text.x=element_blank())

## Store basic plot as object and then add on to it

## Emojis
devtools::install_github('dill/emoGG')
library(emoGG)
emoji_search('penguin')

ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_emoji(emoji='1f427')

ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_emoji(emoji='1f414') + add_emoji('1f426') + theme_bw()
