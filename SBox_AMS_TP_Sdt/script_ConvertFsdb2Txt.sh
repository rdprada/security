#!/bin/bash

for Key in `cat input_simu_Key.txt`
do

  echo > fsdb2txt.aim
 
  for Vect in `cat input_simu_Mes_0x.txt` 
  do 
        
    echo "set pf [ScopeSigMgr:loadpffile simulations/K${Key}/V${Vect}.fsdb] " >> fsdb2txt.aim
    echo 'set wf [pf:read $pf i(vdd!)] ' >> fsdb2txt.aim
    echo "set of [open simulations/K${Key}/V${Vect}.txt w]" >> fsdb2txt.aim
    echo 'wf:print $of $wf -data' >> fsdb2txt.aim
#    echo 'close $pf' >> fsdb2txt.aim
    echo 'close $of' >> fsdb2txt.aim
    echo  >> fsdb2txt.aim
    done
  
  echo "exit" >> fsdb2txt.aim
  scope -script fsdb2txt.aim

  echo > fsdb2txt.aim
 
  for Vect in `cat input_simu_Mes_1x.txt` 
  do 
        
    echo "set pf [ScopeSigMgr:loadpffile simulations/K${Key}/V${Vect}.fsdb] " >> fsdb2txt.aim
    echo 'set wf [pf:read $pf i(vdd!)] ' >> fsdb2txt.aim
    echo "set of [open simulations/K${Key}/V${Vect}.txt w]" >> fsdb2txt.aim
    echo 'wf:print $of $wf -data' >> fsdb2txt.aim
#    echo 'close $pf' >> fsdb2txt.aim
    echo 'close $of' >> fsdb2txt.aim
    echo  >> fsdb2txt.aim
    done
  echo "exit" >> fsdb2txt.aim
  scope -script fsdb2txt.aim


  for Vect in `cat input_simu_Mes.txt` 
  do 
    sed "s/n/E-9/g" simulations/K${Key}/V${Vect}.txt > tmp.txt
    sed "s/u/E-6/g" tmp.txt > simulations/K${Key}/V${Vect}.txt
    awk '{print 1000000000000*$1,"\t",1000*$2}' simulations/K${Key}/V${Vect}.txt > tmp.txt
    mv tmp.txt simulations/K${Key}/V${Vect}.txt
    done


  done

rm fsdb2txt.aim
rm scope.log*

