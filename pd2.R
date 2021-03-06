# Stworzy� w�asn� funkcj� o nazwie cross.prod(u,v),
# kt�ra zwraca iloczyn wektorowy wektor�w
# v=(vx,vy,vz) i u=(ux,uy,uz). 
# Skorzysta� ze znanego wzoru
# Funkcja ma domy�lnie zaokr�gla� wyniki do 2 miejsc
# po przecinku i dawa� mo�liwo�� zmiany tej warto�ci.
cross.prod  <-function(u,v, digits=2){
  M <- matrix(c(u,v), byrow=T, 2,length(u))
  cp <- c(det(M[,-1]), -det(M[,-2]), det(M[,-3]))
  return(round(cp, digits))
}

v <- c(0,1,0)
u <- c(1,0,0)
cp <- cross.prod(u,v)
print(cp)