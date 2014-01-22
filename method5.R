#method5 is to use shell to get frequency table then scan into R.
#The result of scan() will unlist the frequency table. So it has to be rebuilt in R.
#Usage: just run method5() to get the result.

method5=function() {
 t=data.frame(0, 0)
 for (i in 1:81) {
  con=pipe(command2[i])
  d=scan(con) #The result came back is a frequency table. scan() will unlist it.
  close(con)
  y=d[seq(1, length(d), 2)] #The odd position is frequency.
  x=d[seq(2, length(d), 2)] #The even position is arrival delay level.
  nt=data.frame(x, y)
  t=mergetable(t, nt)
 }
 arrdelay=t[[1]]
 freq=t[[2]]
 arrstat(arrdelay, freq)
}
