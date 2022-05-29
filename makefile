target_libpng: 
	export FUZZER=$(shell pwd)/build/aflpp; \
	export TARGET=$(shell pwd)/build/libpng; \
	export OUT=$(shell pwd)/build/outputfile; \
	./aflplusplus/fetch.sh; \
	./aflplusplus/build.sh; \
	export CC=$(CC); \
	export CXX=$(CXX); \
	./libpng/fetch.sh; \
	./apply_patches.sh; \
	./libpng/build.sh



target_libsndfile: 
	export FUZZER=$(shell pwd)/build/aflpp; \
	export TARGET=$(shell pwd)/build/libsndfile; \
	export OUT=$(shell pwd)/build/outputfile; \
	./aflplusplus/fetch.sh; \
	./aflplusplus/build.sh; \
	#export CC=$(shell pwd)/build/aflpp/repo/afl-clang-fast; \
	#export CXX=$(shell pwd)/build/aflpp/repo/afl-clang-fast++; \
	export CC=$(CC); \
	export CXX=$(CXX); \
	./libsndfile/fetch.sh; \
	./apply_patches.sh; \
	./libsndfile/build.sh

target_sqlite:
	export FUZZER=$(shell pwd)/build/aflpp; \
	export TARGET=$(shell pwd)/build/sqlite; \
	export OUT=$(shell pwd)/build/outputfile; \
	./aflplusplus/fetch.sh; \
	./aflplusplus/build.sh; \
	#export CC=$(shell pwd)/build/aflpp/repo/afl-clang-fast; \
	#export CXX=$(shell pwd)/build/aflpp/repo/afl-clang-fast++; \
	export CC=$(CC); \
	export CXX=$(CXX); \
	./sqlite3/fetch.sh; \
	cp /target
	./apply_patches.sh; \
	./sqlite3/build.sh

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


	
