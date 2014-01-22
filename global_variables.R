#Please run this script before implementing any methods!
#Warnings: please change your working dictionary to where your Airline CSV files stored before running it!
#Also ensure that your working dictionary ONLY has those 81 CSV files!
#This script is for some global variables which will be used in the following methods.

files=list.files()
first=sapply(1:81, function(i) readLines(files[i], 1)) #Extract the first line in all the files.
ind1=sapply(1:81, function(i) which(strsplit(first, ',')[[i]] %in% c('ArrDelay', '"ARR_DELAY"'))) #Find field number of arrival delay.
ind2=c(rep(15, 21), rep(45, 60)) #ind1 is only valid for read.csv because some delimiters are in a quote, that's why ind2 is needed.
command1=paste0('cut -f', ind2, ' -d, ', files, ' | tail -n +2') #Send command to shell.
command2=paste0(command1, ' | egrep -v "^$|NA" | sort -n | uniq -c') #Send command to shell, only for method5.
command3=paste0(command1, ' | egrep -v "^$|NA" > tmp.csv && sqlite3 delays.sqlite ".import tmp.csv delays"') #Only for method8.
