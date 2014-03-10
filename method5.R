#method5 is to use shell to get frequency table then scan into R.
#The result of scan() will unlist the frequency table. So it has to be rebuilt in R.
#Usage: just run method5() to get the result.

method5=function() {
 t=data.frame(0, 0)
 for (i in 1:81) {
  con=pipe(command2[i])
  d=readLines(con)
  close(con)
  dcon=textConnection(d) #Make a text connection because it has two columns.
  nt=read.table(dcon)
  t=mergetable(t, nt)
 }
 arrdelay=t[[1]]
 freq=t[[2]]
 arrstat(arrdelay, freq)
}
