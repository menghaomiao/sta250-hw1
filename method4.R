#method4 also uses pipe to extract data and then scans it into R.
#But in method4, it reads block by block.
#Usage: method4(blocksize), where blocksize is the rows read in one run. The default value is 10000.

method4=function(blocksize=10000) {
 t=data.frame(0, 0)
 for (i in 1:81) {
  con=pipe(command1[i], open='r') #To ensure that it can read from the previous block.
  repeat {
   d=scan(con, nmax=blocksize, quiet=T)
   if (length(d)==0) {break}
   nt=as.data.frame(table(d))
   t=mergetable(t, nt)
   }
  close(con)
 }
 arrdelay=as.integer(t[[1]])
 freq=t[[2]]
 arrstat(arrdelay, freq)
}
