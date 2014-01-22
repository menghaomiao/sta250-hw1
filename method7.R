#method7 requires FastCSVSample package. And it can only be run on UNIX and Mac OS.
#method7 is the only method without using other language.
#method7 is to sample lines from those CSV files by using FastCSVSample package.
#Since the first 21 file was in year and the last 60 files was in month, then different sample size should be used.
#Usage: method7(n1, n2), where n1, n2 is the smaple size for the first 21 files and the last 60 files, respectively.

method7=function(n1=1000, n2=100) {
 d=integer(n1*21+n2*60) #The overall sample size.
 a=c(seq(1, n1*21, n1), seq(n1*21+1, n1*21+n2*60, n2))
 b=c(seq(n1, n1*21, n1), seq(n1*21+n2, n1*21+n2*60, n2))
 for (i in 1:21) {
  sample=csvSample(files[i], n1)
  spl=strsplit(sample, ',')
  d[a[i]:b[i]]=sapply(1:n1, function(j) spl[[j]][15]) #Extract the arrival delay column.
 }
 for (i in 22:81) {
  sample=csvSample(files[i], n2)
  spl=strsplit(sample, ',')
  d[a[i]:b[i]]=sapply(1:n2, function(j) spl[[j]][45])
 }
 t=table(as.integer(d)) #The final frequency table.
 freq=as.integer(t)
 arrdelay=as.integer(names(t))
 arrstat(arrdelay, freq)
}
