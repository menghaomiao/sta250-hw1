#methodnew is a contrast to method2. It also uses pipe to extract numbers then scans them into R.
#The basic idea is to construct a frequency table, then count different arrival delay levels.
#Usage: methodnew(max), where max define the range of the frequency table. Default is 60*24*2.

methodnew=function(max=2880) {
 t=table(factor(levels=-max:max))
 for (i in 1:81) {
  con=pipe(command1[i])
  d=scan(con)
  close(con)
  d=factor(d, levels=-max:max) #To make it has the same size with the original table.
  t=t+table(d)
 }
 freq=as.integer(t)
 arrdelay=as.integer(names(t))[freq!=0]
 freq=freq[freq!=0]
 arrstat(arrdelay, freq)
}
