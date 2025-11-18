#include <string.h>
#include "syspara.h"

void input_para(FILE *fpin)
{
	int i,ii;

	fscanf(fpin,"%d",&var.celltype);
	fscanf(fpin,"%lf",&var.BCL);
	fscanf(fpin,"%lf",&var.ndis);
	fscanf(fpin,"%lf",&var.Istim_base);
	fscanf(fpin,"%lf",&ito.rate);
	fscanf(fpin,"%d",&var.datas);
	for (ii = 0; ii < var.datas; ii++){
		for (i=0;i<N;i++){
			fscanf(fpin,"%lf",&var.x0[ii][i]);
			//printf("x[%d]=%e\n",i,var.x0[ii][i]);
		}
		fscanf(fpin, "%lf", &var.tsign[ii]);
		fscanf(fpin, "%lf", &var.tend[ii]);
	}
	fscanf(fpin,"%d",&var.l);
	fscanf(fpin,"%d",&var.m);
	fscanf(fpin,"%d",&var.fdebug);
	fscanf(fpin,"%d",&var.write);
	fscanf(fpin,"%d",&var.write0);
	fscanf(fpin,"%d",&var.half);
	fscanf(fpin,"%lf",&var.epsx);
	        
	fscanf(fpin,"%lf",&var.dpara);
	fscanf(fpin,"%lf",&var.endpara);
	fscanf(fpin,"%d",&new.iterm);

}

