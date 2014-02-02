#method1 is to read every CSV file into R and extract the arrival delay column.
#Usage: just run method1() to get the result.

method1=function() {
 delays=c()
 for (i in 1:81) {
  d=read.csv(files[i])
  delay=d[[ind1[i]]] #ind1 is the position of arrival delay collumn.
  delays=c(delays, delay)
 }
 funs=c(mean=mean, sd=sd, median=median)
 sapply(funs, function(f) f(delay, na.rm=T))
}
