sta250-hw1
==========

This is for STA 250 homework 1. It contains several methods to compute the arrival delay mean, standard deviation and median.
The data contains airline delay information of USA from 1987 to 2012, 81 files in total. The first 21 files is in year, the last 60 is in month.
The task of the assignment is to extract the arrival delay column and compute relevant statistics.
This repository gives 8 methods to compute it. The other 2 files global_variables and affiliated_functions should be run before implementing all the methods.

Summary of the 8 methods:
method1: Read every CSV file in R and extract arrival delays.
method2: Pipe arrival delays into R then get the frequency table.
methodnew: Create a frequency table first then count for each arrival delay level.
method4: Pipe arrival delays in block then the same with method2.
mymethod4: Also piping in block but cut arrival delays into several intervals then get frequency table.
method5: Pipe and sort then get a frequency table in shell.
method7: Sample CSV files in R.
method8: Create a data base then use sql to get the frequency table.

Attention:
1. Before run global_variables.R, please change your working dictionary to where your CSV files are stored.
2. To avoid unnecessary error, please ensure your working dictionary ONLY contains those 81 CSV files.
3. method7() requires package FastCSVSample.
4. method8() requires package DBI and RSQLite. Also ensure you install sqlite3 before run it.
