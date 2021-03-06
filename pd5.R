#funkcja rysuj�ca wykres
f.plot <- function(x,y, trans){
  plot(x, y, pch=19, xlab="x", ylab="p(x)", tcl=0.25, log=trans, main=trans)
}

# wczyta� dane z pliku zad.txt
v <- scan("https://jsienkiewicz.pl/R_podstawy/zad5.txt")
# wykona� histogram i korzystaj�c z niego zaproponowa� posta� dopasowania,
K <- 5
bins <- seq(min(v), max(v), length.out=K+1)
h <- hist(v, plot=FALSE, breaks = bins)
# wykona� dopasowanie za pomoc� regresji i przedstawi� je na wykresie (dane + dopasowanie)
#sprawdzenie relacji
par(mfrow=c(2,2))
transformacja <- c("", "x", "xy", "y")
lapply(transformacja, function(x) f.plot(h$mids, h$density, x))
par(mfrow=c(1,1))
#dopasowanie
xy.lm <- with(h, lm(log(density) ~ mids))
A <- exp(xy.lm$coefficients[1])
alfa <- xy.lm$coefficients[2]
summary(xy.lm)
with(h, f.plot(mids,density,"y"))
curve(A*exp(alfa*x),0,30,add=TRUE, lwd=2, lty=2, col="red")
# wykona� test KS i oceni� jego wynik.
ks.test(x, "pexp", -alfa)
ks.test(x, rexp(200, -alfa))
