#method8 requires DBI and RSQLite packages.
#method8 uses pipe to extract arrival delay column and put them into a data base.
#After building the data base, use sql to get the frequency table and return to R.
#Usage: just run method8() to get the result. Once run the code, the data base will be built.

method8=function() {
 system('sqlite3 delays.sqlite "CREATE TABLE delays (arrdelay integer);"')
 system('sqlite3 delays.sqlite "CREATE INDEX delayindex on delays (arrdelay);"') #Create index so that it can speed up query.
 for (i in 1:81) {
  system(command3[i]) #Command3 is to pipe arrival delays into a file then import the file into data base.
 }
 con=dbConnect('SQLite', 'delays.sqlite')
 t=dbGetQuery(con, 'SELECT arrdelay, COUNT(arrdelay) AS freq FROM delays GROUP BY arrdelay;') #Use sql to get frequency table.
 dbDisconnect(con)
 arrdelay=t[[1]]
 freq=t[[2]]
 arrstat(arrdelay, freq)
}
