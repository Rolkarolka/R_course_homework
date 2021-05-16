# Stworzyæ w³asn¹ funkcjê o nazwie cross.prod(u,v),
# która zwraca iloczyn wektorowy wektorów
# v=(vx,vy,vz) i u=(ux,uy,uz). 
# Skorzystaæ ze znanego wzoru
# Funkcja ma domyœlnie zaokr¹glaæ wyniki do 2 miejsc
# po przecinku i dawaæ mo¿liwoœæ zmiany tej wartoœci.
cross.prod  <-function(u,v, digits=2){
  M <- matrix(c(u,v), byrow=T, 2,length(u))
  cp <- c(det(M[,-1]), -det(M[,-2]), det(M[,-3]))
  return(round(cp, digits))
}

v <- c(0,1,0)
u <- c(1,0,0)
cp <- cross.prod(u,v)
print(cp)