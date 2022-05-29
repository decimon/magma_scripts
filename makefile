target_test:
	export FUZZER=$(shell pwd)/build/aflpp; \
	export TARGET=$(shell pwd)/build/$(TARG); \
	export OUT=$(shell pwd)/build/outputfile; \
	./aflplusplus/fetch.sh; \
	./aflplusplus/build.sh; \
	#export CC=$(shell pwd)/build/aflpp/repo/afl-clang-fast; \
	#export CXX=$(shell pwd)/build/aflpp/repo/afl-clang-fast++; \
	export CC=$(CC); \
	export CXX=$(CXX); \
	./$(TARG)/fetch.sh; \
	./apply_patches.sh; \
	./$(TARG)/build.sh


	
