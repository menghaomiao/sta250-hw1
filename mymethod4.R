#mymethod4 is the only method not required to run affiliated_functions.R.
#mymethod4 is a contrast to method4. The common thing is that they all read block by block.
#But in mymethod4, it put arrival delays into several intervals, like (-Inf, -20], (-20, 30]...
#Compute the quantile of different groups and get the median.
#The intervals have to be estimated before. One way is to use FastCSVSample package, which is in method7.
#Usage: Just run mymethod4() to get the result.

mymethod4=function() {
 n=0
 s=0
 sq=0
 t=0
 for (i in 1:81) {
  con=pipe(command1[i], 'r')
  repeat {
   d=scan(con, nmax=10000, quiet=T)
   if (length(d)==0) {break}
   dd=d[!is.na(d)]
   s=s+sum(dd)
   sq=sq+sum(dd^2)
   n=n+length(dd)
   g=cut(dd, c(-Inf, -20:30, Inf)) #If the cut points are too few, it may miss the true median.
   t=t+table(g) #If tables have different size, it will lead to error. So the first and the last cut point cannot be too large.
  }
  close(con)
 }
 mu=s/n
 sd=sqrt((sq-s^2/n)/(n-1))
 q=cumsum(t)/n
 if (length(which(q==0.5))==1) {
  med=which(q==0.5)-20.5
 } else {
  med=min(which(q>0.5))-21
 }
 c(mean=mu, sd=sd, median=med)
}
