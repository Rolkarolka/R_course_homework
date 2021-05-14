# Zbudowaæ trójkolumnow¹ ramkê danych o nazwie df,
# w której kolejnych kolumnach o nazwach calkowite,
# litery i logiczne znajduj¹ siê: liczby od 1 do 10,
# kolejne 10 ma³ych liter alfabetu ³aciñskiego, 
# korzystaj¹c z wbudowanego w R wektora letters,
# logiczne okreœlenie, czy kolejna liczba od 1 do 10 liczba 
# jest parzysta (TRUE) czy nie (FALSE) - 
# nale¿y skorzystaæ z wbudowanej w R funkcji %%, 
# daj¹cej resztê z dzielenia.

df <- data.frame(calkowite=1:10, litery=letters[1:10], logiczne=1:10%%2==0)

# Nastêpnie nale¿y wypisaæ pierwszy oraz trzeci rz¹d ramki df,
# a tak¿e drug¹ kolumnê, u¿ywaj¹c zarówno indkesu liczbowego 
# jak i nazwy.

df[c(1,3)]; df[,2]

# Zbudowaæ listê o nazwie L, posiadaj¹c¹ trzy pola
# o nazwach x, y i z, gdzie x to liczby ca³kowite od 10 do 1,
# y to litery a, z i g, a z to dwie wartoœci TRUE i FALSE

L <- list(x=1:10,y=c("a", "z", "g"),z=c(T,F))

# Wypisaæ drugi element listy L, 
# u¿ywaj¹c zarówno indeksu liczbowego jak i nazwy,

L[[2]]; L$y;

# Zbudowaæ macierz A o wymiarach 3 x 3 x 3 i wype³niæ
# j¹ kolejnymi liczbami od 1 do 9. W jaki sposób,
# korzystaj¹c z indeksów macierzy A (np. A[,2,2]),
# uzyskaæ wektory (5,5,5) oraz (1,4,7).
# Który z tych wektorów mo¿na uzyskac na kilka sposobów?

A <- array(1:9, dim=c(3,3,3))
A[2, 2,]
A[1,,1]; A[1,,2]; A[1,,3]
