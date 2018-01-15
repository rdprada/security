#!/bin/bash

#export simu_keys=`cat input_simu_Key.txt`
#export simu_mess=`cat input_simu_Mes.txt`

#FILEK="input_simu_Key.txt"
#FILEM="input_simu_Mes.txt"

for Key in `cat input_simu_Key.txt`
do
#  set key_vec = ` echo $Key | sed "s/0/0\t/g" | sed "s/1/1\t/g"` 
#  echo ${Key}
#  set key_vec=`echo ${Key} | sed "s/0/0\t/g" | sed "s/1/1\t/g"` 
#  echo ${key_vec}
  
  for Vect in `cat input_simu_Mes.txt` 
  do    
#    echo ${Vect}
#    set vect_vec = `echo ${Vect} | sed "s/0/0\t/g" | sed "s/1/1\t/g"`
#    echo ${vect_vec}
    
    echo > vec/SBox_K${Key}_V${Vect}.vec
    echo "type vec" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "signal		clk	rst	k_7	k_6	k_5	k_4	k_3	k_2	k_1	k_0	m_7	m_6	m_5	m_4	m_3	m_2	m_1	m_0" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "radix		1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "io		i	i	i	i	i	i	i	i	i	i	i	i	i	i	i	i	i	i" >> vec/SBox_K${Key}_V${Vect}.vec
    echo ";	INITIALISATION" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "; reset" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	000	1	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	003	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "; zero in" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	006	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	009	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0" >> vec/SBox_K${Key}_V${Vect}.vec
  
    echo "; data in" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	012	1	0	`echo ${Key} | sed "s/0/0\t/g" | sed "s/1/1\t/g"` `echo ${Vect} | sed "s/0/0\t/g" | sed "s/1/1\t/g"`" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	015	0	0	`echo ${Key} | sed "s/0/0\t/g" | sed "s/1/1\t/g"` `echo ${Vect} | sed "s/0/0\t/g" | sed "s/1/1\t/g"`" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	018	1	0	`echo ${Key} | sed "s/0/0\t/g" | sed "s/1/1\t/g"` `echo ${Vect} | sed "s/0/0\t/g" | sed "s/1/1\t/g"`" >> vec/SBox_K${Key}_V${Vect}.vec
    echo "	021	0	0	`echo ${Key} | sed "s/0/0\t/g" | sed "s/1/1\t/g"` `echo ${Vect} | sed "s/0/0\t/g" | sed "s/1/1\t/g"`" >> vec/SBox_K${Key}_V${Vect}.vec

    echo " Vector File K=${Key} M=${Vect} Generated"
    
    nanosim -n spice/SBox.spi -nvec vec/SBox_K${Key}_V${Vect}.vec -c spice/SBox.cfg -out fsdb -o simulations/K${Key}/simu -t 21ns

    mv simulations/K${Key}/simu.fsdb simulations/K${Key}/V${Vect}.fsdb 
    rm simulations/K${Key}/simu.*

    rm vec/SBox_K${Key}_V${Vect}.vec

  done
done



