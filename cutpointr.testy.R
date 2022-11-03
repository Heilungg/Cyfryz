#cutpointr tutorial
#https://cran.r-project.org/web/packages/cutpointr/vignettes/cutpointr.html
install.packages("cutpointr")
library(cutpointr)
data("suicide")
head(suicide)
table(suicide$dsi)

cp <- cutpointr(suicide, dsi, suicide, 
                method = maximize_metric, metric = sum_sens_spec)

cp
summary(cp)
plot(cp)
#podstawianie nowych wartoœci dla sprawdzenia innych wykresow
wynik <- rnorm(1000, 50, 5)
prawda <- ifelse(wynik > 55, 1, 0)

tabela <- data.frame(wynik, prawda)
head(tabela)

cp <- cutpointr(tabela, wynik, prawda, 
                method = maximize_metric, metric = sum_sens_spec)


cp
summary(cp)
plot(cp)
#zmiana parametru metric
cp <- cutpointr(tabela, wynik, prawda, 
                method = maximize_metric, metric = spec_constrain)

cp
summary(cp)
plot(cp)
#znalezc najlepszy sposob na okreslenie optimal cutpoint