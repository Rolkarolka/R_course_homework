# stworzyć klasę dane o dwóch slotach x oraz y, każdy ma być wektorem (“vector”)
setClass("dane", slots=c(x="vector", y="vector"))
# do x i y przypisyać 20 wartości z rozkładu Poissona, z parametrem lambda=6
d <- new("dane")
d@x <- rpois(20, lambda = 6)
d@y <- rpois(20, lambda = 6)
print(d)
# stworzyć metodę cor, która bedzie liczyła współczynnik korelacji pomiędzy slotami x i y,
f <- function (dt) {}
setMethod("f", signature(dt="dane"), function (dt) cor(dt@x, dt@y))
print(f(d))
# 3 losowe pola wektora x wypełnić wartościami NA,
d@x[4] <- NA
d@x[12] <- NA
d@x[17] <- NA
print(d@x)
# stworzyć metodę plot, która wyrysuje kolejne wartosci wektora x a brakujące punkty zastąpi medianą i zaznaczy kolorem czerwonym
setMethod("plot", "dane", function(x)  plot(impute(x@x, fun=median)))
plot(d)