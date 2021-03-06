# Zbudowa� tr�jkolumnow� ramk� danych o nazwie df,
# w kt�rej kolejnych kolumnach o nazwach calkowite,
# litery i logiczne znajduj� si�: liczby od 1 do 10,
# kolejne 10 ma�ych liter alfabetu �aci�skiego, 
# korzystaj�c z wbudowanego w R wektora letters,
# logiczne okre�lenie, czy kolejna liczba od 1 do 10 liczba 
# jest parzysta (TRUE) czy nie (FALSE) - 
# nale�y skorzysta� z wbudowanej w R funkcji %%, 
# daj�cej reszt� z dzielenia.

df <- data.frame(calkowite=1:10, litery=letters[1:10], logiczne=1:10%%2==0)

# Nast�pnie nale�y wypisa� pierwszy oraz trzeci rz�d ramki df,
# a tak�e drug� kolumn�, u�ywaj�c zar�wno indkesu liczbowego 
# jak i nazwy.

df[c(1,3)]; df[,2]

# Zbudowa� list� o nazwie L, posiadaj�c� trzy pola
# o nazwach x, y i z, gdzie x to liczby ca�kowite od 10 do 1,
# y to litery a, z i g, a z to dwie warto�ci TRUE i FALSE

L <- list(x=1:10,y=c("a", "z", "g"),z=c(T,F))

# Wypisa� drugi element listy L, 
# u�ywaj�c zar�wno indeksu liczbowego jak i nazwy,

L[[2]]; L$y;

# Zbudowa� macierz A o wymiarach 3 x 3 x 3 i wype�ni�
# j� kolejnymi liczbami od 1 do 9. W jaki spos�b,
# korzystaj�c z indeks�w macierzy A (np. A[,2,2]),
# uzyska� wektory (5,5,5) oraz (1,4,7).
# Kt�ry z tych wektor�w mo�na uzyskac na kilka sposob�w?

A <- array(1:9, dim=c(3,3,3))
A[2, 2,]
A[1,,1]; A[1,,2]; A[1,,3]
