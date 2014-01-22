#Please run this script before implementing any the methods!
#mergetable() is to "add up" two frequency tables, which have to be transformed to data frames before.
#arrstat() is a function to give the mean, standard deviation and median given the arrival delay levels and frequencies.

mergetable=function(t1, t2) { #The first column must be arrival delay levels, and the second is frequencies.
 t=merge(t1, t2, by.x=names(t1)[1], by.y=names(t2)[1], all=T, sort=F)
 t[is.na(t)]=0
 t[2]=t[2]+t[3] #Add up frequencies in the two tables.
 t[3]=NULL
 return(t)
}
arrstat=function(arrdelay, freq) { #arrdelay and freq must be numeric or integer.
 s=sum(arrdelay*freq)
 sq=sum(arrdelay^2*freq)
 n=sum(freq)
 mu=s/n
 sd=sqrt((sq-s^2/n)/(n-1))
 o=order(arrdelay)
 q=cumsum(freq[o])/n
 if (length(which(q==0.5))>0) {
  pos=which(q==0.5)
  med=(arrdelay[o][pos]+arrdelay[o][pos+1])/2
 } else {
  pos=min(which(q>0.5))
  med=arrdelay[o][pos]
 }
 c(mean=mu, sd=sd, median=med)
}
