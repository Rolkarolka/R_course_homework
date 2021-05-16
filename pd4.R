# wygenerowaæ 1000 liczb z rozk³adu wyk³adniczego (exp) o parametrze rate=0.1,
v <- rexp(1000, rate=0.1) 
par(mfrow=c(1,2))
# na jednym wykresie porównaæ gêstoœæ prawdopodobieñstwa 
# tak wygenerowanych punktów z gêstoœci¹ teoretyczn¹,
h <- hist(v, plot=F)
plot(h$mids, h$density, col="lightblue", t="h", lwd=10)
x <- seq(min(v), max(v), length.out=100)
lines(x, dexp(x, rate=0.1), col="red", lwd=2)
# na jednym wykresie porównaæ dystrybuantê
# tak wygenerowanych punktów z dystrybuant¹ teoretyczn¹
# (mo¿na wykorzystaæ albo funkcjê cumsum albo skorzystaæ 
# z funkcji plot(ecdf(x)))
d <- pexp(x, rate=0.1)
plot(ecdf(v), lwd=3)
lines(x, pexp(x, rate=0.1), col="red", lwd=2)
# stworzyæ 2 serie danych x i y, gdzie zarówno x jak i y
# pochodz¹ z rozk³adu jednostajnego na przedziale [0,1)
# genereacjê powtórzyæ 10000 razy
x <- runif(100)
y <- runif(100)
M <- replicate(1000, cbind(runif(100), runif(100)))
# i w ka¿dym przypadku policzyæ wspó³czynnik korelacji
# pomiedzy x i y,
cor_m <- sapply(1:1000, function(x) cor(M[,1,x], M[,2,x]))
# w ka¿dym ze 10000 przypadków dokonaæ przetasowania danych
sM <- sapply(1:1000, function(x) sample(M[,1,x]))
# dla danych przetasowanych równiez policzyæ
# wspó³czynnik korelacji
cor_sm <- sapply(1:1000, function(x) cor(sM[,x], M[,2,x]))
# zestawiæ histogramy wspó³czynników korelacji
# na jednym wykresie
h_m <- hist(cor_m)
h_sm <-hist(cor_sm)
par(mfrow=c(1,1))
plot(h_m$mids, h_m$density, pch=19, col="red")
points(h_sm$mids, h_sm$density,pch=19, col="blue")
# dlaczego te wykresy s¹ prawie identyczne