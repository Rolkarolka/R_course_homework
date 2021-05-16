#Nale¿y wczytaæ plik i wykonaæ przebieg zmiennej 
#(za pomoc¹ plot) przy pomocy opcji t=“h”
# zaznaczaj¹c wartoœci powy¿ej zera kolorem niebieskim, 
# a ujemne czerwonym.
v <- scan("https://jsienkiewicz.pl/R_podstawy/zad3.txt")
par(mfrow=c(1,2))
plot(v, t="h", col=ifelse(v>0,"blue", "red"), lwd=10)
# Wykonac równie¿ histogra
# m (bez rysowania) a jego efekty przedstawiæ na rysnuku
# obok za pomoc¹ plot i opcji t=“s”. 

h <- hist(v, plot=F, breaks=20)
plot(h$mids, h$density, t="s", col="red", )
# Oddzielnie policzyæ wartoœæ sredni¹ zmiennej powy¿ej 
# oraz poni¿ej zera (np. za pomoc¹ funkcji tapply).

m <- tapply(v, v>0, mean)
print(m)