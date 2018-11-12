#INCLUDES = syspara.h

bin_PROGRAMS = KRT
KRT_CFLAGS = -O3 -Wall -axsse4.2 -mkl -parallel -pg -I./include

KRT_LDADD = -L/opt/intel/mkl/lib/intel64 -liomp5 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -L./lib/intel64 -liode_intel64

KRT_SOURCES = ./src/krt.c ./src/val_constants.c ./src/mem.c\
	./src/input_para.c ./src/system.c\
	./src/runge.c ./src/exptable.c ./src/jacobi.c ./src/syspara.h

