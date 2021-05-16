# wczytać plik znajdujący się pod adresem https://jsienkiewicz.pl/R_podstawy/publikacje.data - jest to plik zapisany za pomocą polecenia save(),
load("publikacje.data") # in data var
# sprawdzic jaką struktura jest zbiór danych,
typeof(data)
# w polu author znajduje się lista autorów - należy dla każdej publikacji wyznaczyc ilu ich jest a następnie zhistogramowac wynik,
authors <- strsplit(data$author, ";", fixed=T)
authors.length <- sapply(authors, length)
h <- hist(authors.length, plot=F, breaks = 1000)
plot(h$mids, h$density, log="xy", pch=19, tcl=.25, col="lightblue", xlab="liczba autorow", ylab="ilosc praw.")
# w polu author_affiliate odnajdziemy afiliacje autorów - proszę spróbowac wyodrębnić wszystkie kraje, a następnie je zhistogramować,
author.aff <- strsplit(data$author_affiliate, ";", fixed=T)
author.aff <- lapply(author.aff, function(x) strsplit(x, ",", fixed = T))
author.aff <- sort(table(unlist(lapply(author.aff, function (x) lapply(x, function(y) y[length((y))])))), decreasing = T)[1:30]
plot(author.aff, t="h", lwd=15,col="orange", xaxt="n", xlab="")
axis(1, at=1:length(author.aff), label=names(author.aff), las=2, cex=0.5)
# podać w ilu procentach publikacji w tytule pojawia się wyrażenie complex networks
cn <- grep("(C|c)omplex (N|n)etwork", data$title)
round(100*length(cn)/nrow(data),2)