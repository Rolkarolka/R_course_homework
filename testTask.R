# ZADANIE 1
# wygenerować 50 liczb z rozkładu jednostajnego
x <- runif(50)
# wygenerować 50 elementów ze zbioru {"A", "B", "C"}
# przy czym prawdopodobieństwa wylosowanych poszczególnych elementów to 0.2, 0.6, 0.2
y <- sample(toupper(letters[1:3]), 50, replace=T, prob=c(0.2, 0.6, 0.2))
# traktując wektor symboli jako maskę, policzyć średnią oraz odchylenie standardowe
mean_x <- tapply(x,  y, mean)
sd_x <- tapply(x, y, sd)
# wykonać wykres pudełkowy, traktując wektor symboli jako zmienną objaśniającą
boxplot(x ~ y)
# ---------------------------------------------------------
# ZADANIE 2
# wczytać plik https://jsienkiewicz.pl/R_podstawy/lm.txt
library(fields)
df <- read.table("https://jsienkiewicz.pl/R_podstawy/lm.txt", header=T, stringsAsFactors = T)
x <- df$x
y <- df$y
# wykonać dopasowanie liniowe między kolumną y a kolumną x
plot(x, y)
df.lm <- lm(y ~ x)
summary(df.lm)
# na bazie p-wartości ocenić, który ze współczynników jest istotny statystycznie
# nie istotne
# narysować punkty wraz z dopasowaniem
a <- df.lm$coefficients[2]
b <- df.lm$coefficients[1]
plot(x,y)
lines(x, a*x+b, col="red", lwd=3)
# na wykres nanieść punkty otrzymane z binowania za pomoca stats.bin(),
# wielkością punktu zaznaczając liczbę punktów w binie
df.bin <- stats.bin(df$x, df$y)
points(df.bin$centers, df.bin$stats[2,], col="blue", pch=19)
# --------------------------------------------------------------------
# ZADANIE 3
# wygenerować N=2000 liczb z rozkładu Gaussa dla mi=0, oddzielnie dla sigma=1 i sigma=2
mv <- 0
mk <- 0
sdv <-1
sdk <- 2
v <- rnorm(2000, mv, sdv)
k <- rnorm(2000, mk, sdk)
# wykonać histogram
hv <- hist(v, plot=F)
hk <- hist(k, plot=F)
# na bazie histogramu stworzyć wykresy gęstości prawdopodobieństwa i nanieść na nie krzywe teoretyczne
par(mfrow=c(1,1))
plot(hv$mids, hv$density, t="h", col="lightblue", lwd=20)
curve(dnorm, min(v), max(v), add = T, col = "blue", lwd = 2)

lines(hk$mids, hk$density, t="h", col="lightgreen", lwd=20)
xk <- seq(min(k), max(k), length.out=100)
lines(xk, dnorm(xk, mk,sdk), t="l", col="darkgreen", lwd=2)
# w obu przypadkach policzyć test KS
xv <- seq(min(v), max(v), length.out=100)
ks.test(v, dnorm(xv, mv, sdv))
ks.test(k, dnorm(xk, mk,sdk))
# ----------------------------------------------------------------------
# ZADANIE 4
# wczytać plik tekstowy https://jsienkiewicz.pl/R_podstawy/text.txt
f <- file("https://jsienkiewicz.pl/R_podstawy/text.txt")
text <- readLines(f)
# dla każdego zdania wyznaczyć liczbę znaków
line.length <- lapply(text, nchar)
# dla każdego zadania wyznaczyć liczbę słów
line.words <- sapply(text, function(text) strsplit(text, " ", fixed=T))
line.wcount <- sapply(line.words, length)
# wskazać w którym zdaniu i na którym miejscu jest słowo "die"
line.found <- sapply(text, function(text) gregexpr("\\<die\\>", text))
print(line.found)
# ----------------------------------------------------------------------
# ZADANIE 5
# sprawdzić jakiego typu jest wbudowany zbiór AirPassengers i wykonać jego wykres
par(mfrow=c(1,1))
df <-  AirPassengers
typeof(df)
plot(df)
# dokonać dekompozycji zbioru
df.ts <- ts(df, freq=4)
df.d <- decompose(df.ts)
summary(df.d)
plot(df.d)
# na poprzednio wykonanym wykresie nanieść sumę składowej cyklicznej(seasonal) oraz trend
df.sum <- df.d$seasonal + df.d$trend
plot(df.sum[!is.na(df.sum)], t="l", lwd=2, col="red")
# wyznaczyć autokorelację składowej losowej i zestawić ją z autokorelacją przetasowanych danych
par(mfrow=c(1,2))
acf.random <- acf(df.d$random[!is.na(df.d$random)])
dfs <- sample(df)
acf.dfs <- acf(dfs)
df.acf <- data.frame(lag=acf.random$lag, random=acf.random$acf, shuffle=acf.dfs$acf)
yr <- range(df.acf[,c("random", "shuffle")])
par(mfrow=c(1,1))
plot(df.acf$lag, df.acf$random, ylim = yr, pch = 19)
points(df.acf$lag, df.acf$shuffle, pch = 19, col = "orange")