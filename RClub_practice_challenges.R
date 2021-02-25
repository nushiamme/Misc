dat <- data.frame(
  nest = c("a", "b", "c"),
  treatment = c(1, 1, 2),
  fledged = c(2, 5, 4),
  died = c(3, 0, 1)
)

library(reshape2)
library(tidyr)

dat$total <- dat$fledged+dat$died
melt(dat, id.vars=c("nest", "treatment","fledged", "died"), measure.vars="total")

##spread, gather
dat_long <- data.frame(nest = rep(dat$nest, dat$total),
                       treatment = rep(dat$treatment, dat$total),
                       fedged = NA)

for(i in 1:dat$fledged[dat$nest=="a"]) {
    dat_long$success[i] <-  1
    } for
}












  dat$total <- dat$fledged + dat$died
  dat2 <- data.frame(nest = rep(dat$nest, dat$total),
                     treatment = rep(dat$treatment, dat$total),
                     fledged = NA)
  counter <- 1
  for(i in 1:nrow(dat)){
    dat2$fledged[counter:(counter + dat$fledged[i] - 1)] <- 1
    dat2$fledged[(counter + dat$fledged[i]):(counter + dat$died[i] + 1)] <- 0
    counter <- counter + dat$total[i]
  }
  