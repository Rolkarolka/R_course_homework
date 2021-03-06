#Nale�y wczyta� plik i wykona� przebieg zmiennej 
#(za pomoc� plot) przy pomocy opcji t=�h�
# zaznaczaj�c warto�ci powy�ej zera kolorem niebieskim, 
# a ujemne czerwonym.
v <- scan("https://jsienkiewicz.pl/R_podstawy/zad3.txt")
par(mfrow=c(1,2))
plot(v, t="h", col=ifelse(v>0,"blue", "red"), lwd=10)
# Wykonac r�wnie� histogra
# m (bez rysowania) a jego efekty przedstawi� na rysnuku
# obok za pomoc� plot i opcji t=�s�. 

h <- hist(v, plot=F, breaks=20)
plot(h$mids, h$density, t="s", col="red", )
# Oddzielnie policzy� warto�� sredni� zmiennej powy�ej 
# oraz poni�ej zera (np. za pomoc� funkcji tapply).

m <- tapply(v, v>0, mean)
print(m)