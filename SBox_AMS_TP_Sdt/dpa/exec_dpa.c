#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <time.h>
#include <strings.h>
#include <string.h>
#include "dpa.h"



char* dec2bin(int n,char * s)
{
 int i,a;
 a = n;
 s[8] = '\0';
 for (i=0;i<8;i++)
 {
   s[7-i] = ((a % 2) ? '1' : '0');
   a = a/2;
 }
 return s;
}

int bin2dec(char * s)
{
 int r=0;
 int i;
 for (i=0;i<8;i++)
 {
   r = r*2 + ((s[i] == '1') ? 1 : 0);
 }
 return r;
}


int main(int argc, char** argv) {
 
  float *tabtrace = malloc(nbtrace*nbechan*sizeof(float));
  int tabuse [nbtrace];
  int i,j,im;
  float tabmax [nbtrace];
  FILE *f;
  int pi,ci;
  float pv,cv;
  char prefix[256];
  char si[9];
  char file[309];
  char fileUse[309];
  int Bit_To_Test;

  if ( argc==3 ) 
  {
    strcpy( prefix, argv[2] );
    sscanf(argv[1],"%d",&Bit_To_Test);
  }
  else
  {
    
    printf("Usage: exec_dpa Index_of_Bit_Used_For_Partitionning Path_To_Simulation_Files \n");
    exit(0);
  }

  for (i=0;i<nbtrace;i++)
  {
    strcpy(file,prefix);
    strcpy(file,strcat(file,"V"));
    strcpy(file,strcat(file,dec2bin(i,si)));
    strcpy(file,strcat(file,".txt"));


/*    printf("Openning File : %s\n",file); */

    pi =0;
    pv = 0.0;
  
    if ((f = fopen(file,"r")) == NULL)
      {fprintf(stderr,"Failed Openning File %s.\n",file);exit(1);};
    while(fscanf(f,"%d\t%f",&ci,&cv) != EOF)
    {
      for(j=pi;j<ci;j++) {*(tabtrace+i*nbechan+j) = pv;}
      *(tabtrace+i*nbechan+ci) = cv;
      pi = ci;
      pv = cv;
      
    }
    for(j=pi;j<nbechan;j++) {*(tabtrace+i*nbechan+j) = pv;}
    fclose(f);
/*    printf("File Closed : %s\n",file);*/
   }

   strcpy(fileUse,"../input_dpa_Mes.txt");
   if ((f = fopen(fileUse,"r")) == NULL)
      {fprintf(stderr,"Failed Openning File %s.\n",fileUse);exit(1);};
   pi =0; 
   while(fscanf(f,"%s",si) != EOF)
   {
      ci = bin2dec(si);
      for(j=pi+1;j<ci;j++) {tabuse[j] = 0;}
      tabuse[ci] = 1;
      pi = ci;
   }
   for(j=pi+1;j<nbtrace;j++) {tabuse[j] = 0;}  
   fclose(f);

/*  for (i=0;i<nbtrace;i++) tabuse[i] = 1;*/

  
   printf("All Files Read.\n");

   dpa( Bit_To_Test, tabtrace, tabuse, tabmax);
   im = 0;
   for (i = 0; i < nbtrace; i++) {
     if (tabmax[i] > tabmax[im]) {im = i;}
   }

   printf("Maximum observed for Key = %d.\n",im);
/*  for (i = 0; i < nbtrace; i++) {printf("Key = %d : Max = %f\n",i,tabmax[i]);}*/

   return 0;
}
