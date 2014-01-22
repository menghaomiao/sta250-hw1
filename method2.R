#method2 is to use shell to piping data into R then transform it into a frequency table.
#Usage: just run method2() to get the result.

method2=function() {
 t=data.frame(0, 0) #This is the primary frequency table with arrival level 0 and frequency 0.
 for (i in 1:81) {
  con=pipe(command1[i])
  d=scan(con) #scan() return a number directly to R.
  close(con)
  nt=as.data.frame(table(d))
  t=mergetable(t, nt)
 }
 arrdelay=as.integer(t[[1]])
 freq=t[[2]]
 arrstat(arrdelay, freq)
}
