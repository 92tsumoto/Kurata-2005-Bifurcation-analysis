#INCLUDES = syspara.h

bin_PROGRAMS = KRT
#ORd_CFLAGS = -O2 -Wall -axsse4.2 -mkl -parallel -par-report2 -Winline -inline-level=2 -ip -vec-report2 -opt-mem-layout-trans=3 -pg
#KRT_CFLAGS = -O2 -Wall -axsse4.2 -mkl -parallel -par-report2 -vec-report2 -pg
KRT_CFLAGS = -fcommon -fiopenmp -fopenmp-targets=spir64 -O3 -xcore-avx2 -vec -ipo -qmkl=parallel -qopt-report=3 -qopt-report-stdout -flto -qopt-zmm-usage=high -I./include
#HRd_CFLAGS = -O2 -axsse4.2 -parallel -Wall

#KRT_LDADD = -L/opt/intel/mkl/lib/intel64 -liomp5 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core /home/tsumoto/lib/xhplot.o
KRT_LDADD = -L/opt/intel/mkl/lib/intel64 -liomp5 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -L./lib/intel64 -liode_intel64
#ORd_LDADD = /home/tsumoto/lib/xhplot.o

KRT_SOURCES = ./src/krt.c ./src/val_constants.c ./src/mem.c\
	./src/input_para.c ./src/system.c\
	./src/runge.c ./src/exptable.c ./src/jacobi.c ./src/syspara.h

