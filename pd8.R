# wykonać wykres autokorelacji dla przetasowanych danych z kolumny “comments” w przykładzie 8.27 (wykorzystując funkcję sample())
df <- read.table("https://jsienkiewicz.pl/R_podstawy/P08/cyber.dat")
par(mfrow=c(2,2))
df.comments <- sample(df$comments)
acf(df.comments)
# to samo, co powyżej, lecz dla kolumny “emo”
df.emo <- sample(df$emo)
acf(df.emo)
# to samo, co powyżej, lecz dla kolumny “emo”, ale w przypadku zmian wartości (tj. nie samych wartości, tylko ich różnic),
acf(diff(df.emo))
# wykonać wykres autokorelacji dla danych indkesu giełdowego WIG20 https://jsienkiewicz.pl/R_podstawy/wig20.dat - druga kolumna,
df.wig <- read.table("https://jsienkiewicz.pl/R_podstawy/wig20.dat")
par(mfrow=c(2,1))
acf(df.wig$V2)
# wykonać również wykres drugiej kolumny od pierwszej (po przekształceniu pierwszej na typ POSIXct)
wig.V1 <- as.POSIXct(sprintf("2021-01-12 %s", df.wig$V1), "%Y-%M-%D %H:%M:%S")
plot(wig.V1, df.wig$v2, t="l")
x.i <- which(wig.V1 < as.POSIXct("2021-01-12 08:00:00"))
plot(wig.V1[-x.i], df.wig$V2[-x.i], t="l")
# dla tych samych danych (WIG20, druga kolumna) wykonać wykres autokoralcji dla losowej składowej (random) otrzymanej po usunięciu trendu.
df.wig.index <- ts(rev(df.wig$V2), freq=4)
df.wig.index.d <- decompose(df.wig.index)
acf(df.wig.index.d$random[!is.na(df.wig.index.d$random)])