exec_dpa:	dpa.o exec_dpa.o
	gcc  -o exec_dpa dpa.o exec_dpa.o

exec_dpa.o:	exec_dpa.c dpa.h
	gcc  -o exec_dpa.o -c exec_dpa.c -W -Wall -ansi -pedantic
dpa.o:	dpa.c
	gcc  -o dpa.o -c dpa.c -W -Wall -ansi -pedantic
