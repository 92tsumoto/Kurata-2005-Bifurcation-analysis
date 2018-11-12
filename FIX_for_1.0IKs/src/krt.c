/* produced by Tsumoto. K 2008.10.27 */

#include <string.h>
#include <stdlib.h>
#include "syspara.h"

FILE *fopen(), *fpin, *fp0, *fp1, *fp2, *fp3, *fp4;
int mode = 1;
int P = 2;
int beats = 30;

typedef double Number;

main(argc,argv)
int argc;
char **argv;
{
	int i,k,w,n,c,pe,count,pcount;
	//int dim;
	MKL_INT info;
	MKL_INT ipiv[N];
	int ii=0;
	double x[NN],a[NN*NN];
	double x2[N];
	char *tmpname;
	char cmd[BUFSIZ];
	double t = 0.0;
	double time=0.0,tt;
	double tend;
	double dist;
	double para;
	double apd,rmbp,vmax,toneapd,ttwoapd,dvdtmax;

	// for ode solver
	//int ierr,ipar[128];
	//int kd[NN];
	double h,hm;
	//double ep,tr;
	/* As ODE system has size NN=16*17=272, than the size of dpar array is equal to 
		max{13*NN,(7+2*NN)*NN}=max{3536,149872}=149872. More details on dpar array can be 
		found in the Manual */
	//double dpar[149872];

	double v_old,dvdt,dvdt_new;
	double t_stok;

	tmpname = "temp";

	sprintf(cmd, "/usr/bin/cpp -P %s > %s", argv[1],tmpname);
	if(system(cmd) == -1){
		fprintf(stderr,"cannot open %s\n",argv[1]);
		exit(1);
	}
	if((fpin=fopen(tmpname,"r"))==NULL){
		fprintf(stderr,"cannot open %s\n",argv[1]);
		exit(1);
	}
	if ((fp1 = fopen("para.out","w")) == NULL){
		printf("Can't open File\n");
		exit(1);
	}
	if ((fp2 = fopen("data.out","w")) == NULL){
		printf("Can't open File\n");
		exit(1);
	}
	if ((fp3 = fopen("initdata.out","w")) == NULL){
		printf("Can't open File\n");
		exit(1);
	}

	// parameter inputs
	input_para(fpin);

	if (var.write){
		if ((fp0 = fopen(argv[2],"w"))==NULL){
			fprintf(stderr, "%s cannot open.\n",argv[2]);
			exit(-1);
		}
	}
	if (var.l==2){
		if ((fp4 = fopen("data2.out","w")) == NULL){
			printf("Can't open File\n");
			exit(1);
		}
	}

	for (ii = 0; ii < var.datas; ii++){
		long j;
		eig.n = N;
		eig.lda = LDA;
		eig.ldvl = LDVL;
		eig.ldvr = LDVR;

		for (i = 0; i < N; i++){x[i] = var.x0[ii][i];}

		tt = var.ndis*var.m;
		printf("ndis=%lf,m=%d,tt=%lf\n",var.ndis,var.m,tt);
		h = 2.0*M_PI / var.m;
		h *= var.tsign[ii];

		// parameter values input.
		val_consts(fp1);
		printf("exit consts\n");
	
		// initial values input.
		initial_mem();
		printf("exit memory initialization\n");

		printf("Istim=%lf\n",var.Istim_base);

		// Tablize exp functions.	
		printf("start tablization\n");
		make_ExpTable();
		printf("finished tablization\n");

		//ode solver initialization
		/* Please don't forget to initialize ipar array with zeros before the first call to dodesol routines */
		//for (i=0;i<128;i++) ipar[i]=0;
		/* global parameter settings suitable for all 6 dodesol routines */
		//hm=1.e-12; /* minimal step size for the methods */
		//ep=1.e-9;  /* relative tolerance. The code cannot guarantee the requested accuracy for ep<1.d-9 */
	    //tr=1.e-8;  /* absolute tolerance */
		n=NN;
		var.istop=0;
		var.iflag=1;

		//for(para=0;para<1.0;para+=var.dpara){
		while(ikr.rate!=var.endpara){
			para=ikr.rate;
			count=0;
			
			// stoked the inital values of the system equation.
			for(k=0;k<N;k++){ new.xn0[k]=x[k]; }

			while (1){
				// test 12/11
				if(var.fdebug==1){
					printf("%d ",count);
					for(w=0;w<N;w++){
						if(w!=N-1){
							printf("%10.9lf ",x[w]);
						} else {
							printf("%10.9lf\n",x[w]);
						}
					}
				}
				//
				count++;
				pcount=0; // loop counter
				
				for(pe=0;pe<var.l;pe++){
					// making a unit matrix for the inital values of variational equation.
					c=0;
					for(k=0;k<NNN;k++){
						if(k==c*(N+1)){
							x[k+N]=1.0;
							c++;
						} else {
							x[k+N]=0.0;
						}
					}

					var.Istim = var.Istim_base;
					time=0.0; tend=(double)var.m*var.ndis;
					apd = 0.0; toneapd = 0.0; ttwoapd = 0.0; rmbp = x[0]; vmax = -90.0; dvdtmax = 0.0, v_old = x[0];
					for (j = 0; j< (int)tend; j++){
						t = h*(double)j;
						runge(NN,h,x,t);

						dvdt_new = (x[0]-v_old)/h;
						if(x[0] > vmax){
							vmax = x[0];
						}
						if(dvdt_new < dvdtmax){
							dvdtmax = dvdt_new;
							toneapd = time*var.BCL/2.0/M_PI;
						}
						if(dvdt_new < 0 && x[0] >= (vmax - 0.9*(vmax - rmbp))) ttwoapd = time*var.BCL/2.0/M_PI;

						time+=h;
						v_old = x[0];
					}
					// added for debug
					if(var.fdebug==1){
						printf("t=%10.9lf\n",time/var.omega);
						for(w=0;w<N;w++){
							if(w!=N-1){
								printf("%10.9lf ",x[w]);
							} else {
								printf("%10.9lf\n",x[w]);
							}
						}
					}
					for(k=0;k<N;k++){ new.xn1[k]=x[k]; }

					// making a Jacobian matrix.
					for(k=0;k<NNN;k++){new.DF0[k]=x[k+N];}
					//print_matrix( "DF0", N, N, new.DF0, N );
			
					// making a unit matrix for the inital values of variational equation.
					c=0;
					for(k=0;k<NNN;k++){
						if(k==c*(N+1)){
							x[k+N]=1.0;
							c++;
						} else {
							x[k+N]=0.0;
						}
					}

					var.Istim = 0.0;
					tend=(double)var.m*(1.0-var.ndis);
					for (j = 0; j< (int)tend; j++){
						t = h*(double)j;
						runge(NN,h,x,t);
						
						dvdt_new = (x[0]-v_old)/h;
						if(x[0] > vmax) vmax = x[0];
						if(dvdt_new < dvdtmax){
							dvdtmax = dvdt_new;
							toneapd = time*var.BCL/2.0/M_PI;
						}
						if(dvdt_new < 0 && x[0] >= (vmax - 0.9*(vmax - rmbp))) ttwoapd = time*var.BCL/2.0/M_PI;

						time+=h;
						v_old = x[0];
					}
					// for debug
					if(var.fdebug==1){
						printf("t=%10.9lf\n",time/var.omega);
						for(w=0;w<N;w++){
							if(w!=N-1){
								printf("%10.9lf ",x[w]);
							} else {
								printf("%10.9lf\n",x[w]);
							}
						}
					}
					cblas_dcopy(N, x, 1, new.xn2, 1);
					if(pcount==0) cblas_dcopy(N, x, 1, x2, 1);
					//for(k=0;k<N;k++){
					//	new.xn2[k]=x[k];
					//	x2[k]=x[k];
					//}

					// making a Jacobian matrix.
					for(k=0;k<NNN;k++){new.DF1[k]=x[k+N];}

					//DT = DT1*DT0*store_DT;
					if(var.l!=1 && pcount==0){
						cblas_dgemm(CblasColMajor,CblasNoTrans,CblasNoTrans, N, N, N, 1.0, new.DF1, N, new.DF0, N, 0.0, new.DF2, N);
						// DF2 --> store_DFにcopy
						cblas_dcopy(NNN, new.DF2, 1, new.store_DF, 1);
						//print_matrix( "storeDF", N, N, new.store_DF, N );
					} else if(var.l!=1 && pcount !=0){
						cblas_dgemm(CblasColMajor,CblasNoTrans,CblasNoTrans, N, N, N, 1.0, new.DF1, N, new.DF0, N, 0.0, new.DF2, N);
						cblas_dgemm(CblasColMajor,CblasNoTrans,CblasNoTrans, N, N, N, 1.0, new.DF2, N, new.store_DF, N, 0.0, new.DF, N);
						if(pe==var.l-1){
							cblas_dcopy(NNN, new.zero, 1, new.store_DF, 1);
						} else {
							// DF --> store_DFにcopy
							cblas_dcopy(NNN, new.DF, 1, new.store_DF, 1);
						}
					} else if(var.l==1){
						cblas_dgemm(CblasColMajor,CblasNoTrans,CblasNoTrans, N, N, N, 1.0, new.DF1, N, new.DF0, N, 0.0, new.DF, N);
					}
					pcount++;
				} // end for pe-loop: making Jacobian matrix

				cblas_dcopy(NNN, new.DF, 1, new.DF_eig, 1);
				//print_matrix( "DF", N, N, new.DF, N );

				// make a unit matrix
				c=0;
				for(k=0;k<NNN;k++){
					if(k==c*(N+1)){
						new.K[k]=1.0;
						c++;
					}else {
						new.K[k]=0.0;
					}
				}

				//DF(x)-I(N);
				cblas_daxpy(NNN, -1.0, new.K, 1, new.DF, 1);

				//Fxn = xn2 - xn0;
				for(k=0;k<N;k++){
					new.Fxn[k]=new.xn2[k]-new.xn0[k];
					//new.Fxn[k]=new.xn0[k]-new.xn2[k];
					if(var.fdebug==1){
						printf("F[%d]=%e\n",k,new.Fxn[k]);
					}
				}
			
				// solving 
				//x = xn0 - (DT -I(N))\Fxn; --> (DT-I(N))*(h) = -Fxn;
				info = LAPACKE_dgesv( LAPACK_COL_MAJOR, N, 1, new.DF, N, ipiv, new.Fxn, N);
				/* Check for the exact singularity */
				if( info > 0 ) {
					printf( "The diagonal element of the triangular factor of A,\n" );
					printf( "U(%i,%i) is zero, so that A is singular;\n", info, info );
					printf( "the solution could not be computed.\n" );
					exit( 1 );
				}
				if(var.fdebug==1){
					for(k=0;k<N;k++){
						printf("correct[%d]=%e\n",k,new.Fxn[k]);
					}
				}
			
				// ここに解の判定は入る。
				for(k=0;k<N;k++){
					dist+=fabs(new.Fxn[k]);
				}
				//printf("dist=%e\n",dist/N);
				if(dist/N < var.epsx) {
					cblas_daxpy(N, 0.0, new.Fxn, 1, new.xn0, 1);
					dist =0.0;
					break;
				} else {
					dist =0.0;
					//print_int_vector( "xn0:", N, new.xn0 );
					cblas_daxpy(N, -1.0, new.Fxn, 1, new.xn0, 1);
					cblas_dcopy(N, new.xn0, 1, x, 1);
				}
				if(count>new.iterm){
					var.istop=2;
					break;
				}
			} // end while

			if( count < new.iterm && var.istop==0 ){
				printf("iter=%d rate=%10.9lf x: ",count,ikr.rate);
				fprintf(fp2,"iter=%d rate=%10.9lf x: ",count,ikr.rate);
				for(k=0;k<N;k++){
					x[k]=new.xn0[k];
					printf("%10.9e / ",x[k]);
					fprintf(fp2,"%10.9e / ",x[k]);
				}
				apd = ttwoapd - toneapd;
				printf("[ %lf ] / ",apd);
				fprintf(fp2,"[ %lf ] / ",apd);
				fflush(fp2); 

				if(var.l>1){
					fprintf(fp4,"iter=%d rate=%10.9lf x: ",count,ikr.rate);
					for(k=0;k<N;k++){
						fprintf(fp4,"%10.9e / ",x2[k]);
					}
					apd = ttwoapd - toneapd;
					printf("[ %lf ] / ",apd);
					fprintf(fp4,"[ %lf ] \n",apd);
					fflush(fp4); 
				}
				/* Solve eigenproblem */
				eig.info = LAPACKE_dgeev( LAPACK_COL_MAJOR, 'N', 'N', eig.n, new.DF_eig, eig.lda, eig.wr, eig.wi, eig.vl, eig.ldvl, eig.vr, eig.ldvr );
				/* Check for convergence */
				if( eig.info > 0 ) {
					printf( "The algorithm failed to compute eigenvalues.\n" );
					fprintf(fp2, "The algorithm failed to compute eigenvalues.\n" );
					//exit( 1 );
					break;
				}
				/* Print eigenvalues */
				print_eigenvalues( "Eigenvalues", eig.n, eig.wr, eig.wi, fp2 );
				fflush(fp2);
			} else if(var.iflag!=1 && var.istop==1){
				printf("pass through a bifurcation\n");
				fprintf(fp2,"pass through a bifurcation\n");
				break;
			} else if(var.istop==2){
				printf("system not convergence!\n");
				fprintf(fp2,"system not convergence!\n");
				break;
			}

		// output initial values
		fprintf(fp3,"iter=%d rate=%16.15lf x:\n",count,ikr.rate);
		for(k=0;k<N;k++){
			fprintf(fp3,"%16.15e\n",x[k]);
		}
		fflush(fp3);

		// update parameter
		ikr.rate+=var.dpara;
		var.iflag=0;
		} //end for parameter while
		
	} // end for ii-loop

	// closed file and open memories
	fclose(fp1);
	fclose(fp2);
	fclose(fp3);
	fclose(fp4);
	closed_mem();
}


/* Auxiliary routine: printing a matrix */
void print_matrix( char* desc, MKL_INT m, MKL_INT n, double* a, MKL_INT lda ) {
	MKL_INT i, j;
	printf( "\n %s\n", desc );
	for( i = 0; i < m; i++ ) {
		//for( j = 0; j < n; j++ ) printf( " %6.2f", a[i+j*lda] );
		for( j = 0; j < n; j++ ) printf( " %16.15e", a[j+i*lda] );
		printf( "\n" );
	}
}

/* Auxiliary routine: printing a vector of integers */
//void print_int_vector( char* desc, MKL_INT n, double* a ) {
print_int_vector( char* desc, MKL_INT n, double* a ) {
	MKL_INT j;
	printf( "%s", desc );
	for( j = 0; j < n; j++ ) printf( " %10.9e", a[j] );
    printf( "\n" );
}

/* Auxiliary routine: printing eigenvalues */
//void print_eigenvalues( char* desc, MKL_INT n, double* wr, double* wi, FILE *fp2 )
print_eigenvalues( char* desc, MKL_INT n, double* wr, double* wi, FILE *fp2 )
{
	MKL_INT j;
	double abs[n];

	//printf( "\n %s\n", desc );
	printf( "%s: ", desc );
	fprintf(fp2, "%s: ", desc );
	for( j = 0; j < n; j++ ) {
		printf( " (%10.9e,%10.9e,%10.9e)", wr[j], wi[j],sqrt(wr[j]*wr[j]+wi[j]*wi[j]));
		fprintf(fp2, " (%10.9e,%10.9e,%10.9e)", wr[j], wi[j],sqrt(wr[j]*wr[j]+wi[j]*wi[j]));
	}
	printf( "\n" );
	fprintf(fp2, "\n" );

	if(var.iflag==1){
		for( j = 0; j < n; j++ ) {
			if(fabs(sqrt(wr[j]*wr[j]+wi[j]*wi[j]))>1.0){
				var.ieflag=1; var.id=j;
				printf("ieflag=%d,index=%d\n",var.ieflag,var.id);
				break;
			} else {
				var.ieflag=0; var.id=0;
				printf("ieflag=%d,index=%d\n",var.ieflag,var.id);
			}
		}
	} else{
		printf("ieflag=%d\n",var.ieflag);
		if(var.ieflag==0){
			for( j = 0; j < n; j++ ) {
				if(fabs(sqrt(wr[j]*wr[j]+wi[j]*wi[j]))>1.0){
					var.istop=1;
				} else {
					var.istop=0;
				}
			}
		} else if(var.ieflag==1){
			for( j = 0; j < n; j++ ) {
				if(j==var.id && fabs(sqrt(wr[j]*wr[j]+wi[j]*wi[j]))<1.0){
					var.istop=1;
					printf("here1\n");
				} else if(j=!var.id && fabs(sqrt(wr[j]*wr[j]+wi[j]*wi[j]))>1.0){
					//var.istop=1;
					var.istop=0;
					printf("here2\n");
					break;
				} else {
					var.istop=0;
					printf("here3\n");
					break;
				}
			}
		}
	}
}

/* Auxiliary routine: printing eigenvectors */
void print_eigenvectors( char* desc, MKL_INT n, double* wi, double* v, MKL_INT ldv ) 
{
	MKL_INT i, j;
	printf( "\n %s\n", desc );
	for( i = 0; i < n; i++ ) {
		j = 0;
		while( j < n ) {
			if( wi[j] == (double)0.0 ) {
				printf( " %6.2f", v[i+j*ldv] );
				j++;
			} else {
				printf( " (%6.2f,%6.2f)", v[i+j*ldv], v[i+(j+1)*ldv] );
				printf( " (%6.2f,%6.2f)", v[i+j*ldv], -v[i+(j+1)*ldv] );
				j += 2;
			}
		}
		printf( "\n" );
	}
}
