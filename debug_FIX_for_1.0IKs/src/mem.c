
#include "syspara.h"

typedef double Number;

void initial_mem()
{

	// ina_fast
	ina.Tam=(Number *)calloc(VNMAX,sizeof(Number));
	ina.Tbm=(Number *)calloc(VNMAX,sizeof(Number));
	ina.Thinf=(Number *)calloc(VNMAX,sizeof(Number));
	ina.Ttauh=(Number *)calloc(VNMAX,sizeof(Number));
	if( ina.Tam==NULL || ina.Tbm==NULL || ina.Thinf==NULL || ina.Ttauh==NULL ) exit(1);
	// ito
	ito.Tar=(Number *)calloc(VNMAX,sizeof(Number));
	ito.Tbr=(Number *)calloc(VNMAX,sizeof(Number));
	ito.Taq1=(Number *)calloc(VNMAX,sizeof(Number));
	ito.Tbq1=(Number *)calloc(VNMAX,sizeof(Number));
	ito.Taq2=(Number *)calloc(VNMAX,sizeof(Number));
	ito.Tbq2=(Number *)calloc(VNMAX,sizeof(Number));
	if( ito.Tar==NULL || ito.Tbr==NULL || ito.Taq1==NULL || ito.Tbq1==NULL || ito.Taq2==NULL || ito.Tbq2==NULL ) exit(1);
	// ical
	ical.Tdinf=(Number *)calloc(VNMAX,sizeof(Number));
	ical.Ttaud=(Number *)calloc(VNMAX,sizeof(Number));
	ical.Tfinf=(Number *)calloc(VNMAX,sizeof(Number));
	ical.Ttauf=(Number *)calloc(VNMAX,sizeof(Number));
	if( ical.Tdinf==NULL || ical.Ttaud==NULL || ical.Tfinf==NULL || ical.Ttauf==NULL ) exit(1);
	// ikr
	ikr.Tpinf=(Number *)calloc(VNMAX,sizeof(Number));
	ikr.Tap=(Number *)calloc(VNMAX,sizeof(Number));
	ikr.Tbp=(Number *)calloc(VNMAX,sizeof(Number));
	ikr.Tpiinf=(Number *)calloc(VNMAX,sizeof(Number));
	if( ikr.Tpinf==NULL || ikr.Tap==NULL || ikr.Tbp==NULL || ikr.Tpiinf==NULL ) exit(1);
	// iks
	iks.Tninf=(Number *)calloc(VNMAX,sizeof(Number));
	iks.Ttaun=(Number *)calloc(VNMAX,sizeof(Number));
	if( iks.Tninf==NULL || iks.Ttaun==NULL ) exit(1);
	// ik1
	ik1.Tak1=(Number *)calloc(VNMAX,sizeof(Number));
	ik1.Tbk1=(Number *)calloc(VNMAX,sizeof(Number));
	if( ik1.Tak1 == NULL || ik1.Tbk1==NULL ) exit(1);
	// inaca
	ncx.Texp0=(Number *)calloc(VNMAX,sizeof(Number));
	ncx.Texp1=(Number *)calloc(VNMAX,sizeof(Number));
	if( ncx.Texp0==NULL || ncx.Texp1==NULL ) exit(1);
	// inak
	inak.Trhonak=(Number *)calloc(VNMAX,sizeof(Number));
	inak.Texp0=(Number *)calloc(VNMAX,sizeof(Number));
	inak.Texp1=(Number *)calloc(VNMAX,sizeof(Number));
	if( inak.Trhonak==NULL || inak.Texp0==NULL || inak.Texp1==NULL) exit(1);
	// Newton method
	new.A=(Number *)calloc(NN,sizeof(Number));
	new.K=(Number *)calloc(NN,sizeof(Number));
	new.DF0=(Number *)calloc(NN,sizeof(Number));
	new.DF1=(Number *)calloc(NN,sizeof(Number));
	new.DF2=(Number *)calloc(NN,sizeof(Number));
	new.store_DF=(Number *)calloc(NN,sizeof(Number));
	new.zero=(Number *)calloc(NN,sizeof(Number));
	new.DF=(Number *)calloc(NN,sizeof(Number));
	new.DF_eig=(Number *)calloc(NN,sizeof(Number));
	new.h=(Number *)calloc(N,sizeof(Number));
	new.xn0=(Number *)calloc(N,sizeof(Number));
	new.xn1=(Number *)calloc(N,sizeof(Number));
	new.xn2=(Number *)calloc(N,sizeof(Number));
	new.Fxn=(Number *)calloc(N,sizeof(Number));
	if( new.A==NULL || new.K==NULL || new.DF0==NULL || new.DF1==NULL || new.DF2 == NULL 
		|| new.store_DF == NULL || new.zero==NULL || new.DF == NULL || new.DF_eig == NULL
		|| new.h==NULL || new.xn0==NULL || new.xn1==NULL || new.xn2==NULL || new.Fxn==NULL ) exit(1);
	eig.wr=(Number *)calloc(N,sizeof(Number));
	eig.wi=(Number *)calloc(N,sizeof(Number));
	eig.vl=(Number *)calloc(LDVL*N,sizeof(Number));
	eig.vr=(Number *)calloc(LDVR*N,sizeof(Number));
	if( eig.wr==NULL || eig.wi==NULL || eig.vl==NULL || eig.vr==NULL ) exit(1);
}


void closed_mem()
{

	free(ina.Tam); free(ina.Tbm); free(ina.Thinf); free(ina.Ttauh);
	free(ito.Tar); free(ito.Tbr); free(ito.Taq1); free(ito.Tbq1); free(ito.Taq2); free(ito.Tbq2);
	free(ical.Tdinf); free(ical.Ttaud); free(ical.Tfinf); free(ical.Ttauf);
	free(ikr.Tpinf); free(ikr.Tap); free(ikr.Tbp); free(ikr.Tpiinf);
	free(iks.Tninf); free(iks.Ttaun);
	free(ik1.Tak1); free(ik1.Tbk1); 
	free(ncx.Texp0); free(ncx.Texp1);
	free(inak.Trhonak); free(inak.Texp0); free(inak.Texp1);

	free(new.A); free(new.K); free(new.h);free(new.DF_eig); 
	free(new.DF);free(new.DF0);free(new.DF1);free(new.DF2);free(new.store_DF);free(new.zero);
	free(new.xn0); free(new.xn1); free(new.xn2); free(new.Fxn);

	free(eig.wr); free(eig.wi); free(eig.vl); free(eig.vr);

}

