MYPATH=$(shell pwd)
CC=gcc
GCOV_FLAG=-fprofile-arcs -ftest-coverage
SRC_PATH=$(MYPATH)/src
WORK_PATH=$(MYPATH)/work
INCLUDE=$(MYPATH)/include
TARGET=$(MYPATH)/target
SHARED_LIB_FLAG=-shared


.PHONY:all clean install run
all:show

show.o:$(SRC_PATH)/show.c
	# cd $(SRC_PATH); \
	# $(CC) -fPIC $(GCOV_FLAG) -c $^ -I$(INCLUDE) -o $@
	cd $(WORK_PATH); \
	$(CC) -fPIC $(GCOV_FLAG) -c $^ -I$(INCLUDE) -o $@

libshow.so:show.o
	# cd $(SRC_PATH); \
	# $(CC) $(SHARED_LIB_FLAG) $(GCOV_FLAG) -o  $(WORK_PATH)/libshow.so $^ 
	cd $(WORK_PATH); \
	$(CC) $(SHARED_LIB_FLAG) $(GCOV_FLAG) -o $@ $(WORK_PATH)/$^

show:$(SRC_PATH)/main.c libshow.so
	cd $(SRC_PATH); \
	$(CC) $(GCOV_FLAG) $< -I$(INCLUDE) -L$(WORK_PATH) -lshow -o $@

install:
	cd $(SRC_PATH); \
	FILE=$$(ls); \
	for i in $$FILE; \
	do \
	    if [ -x $$i ]; then \
		install -m 755 $$i $(TARGET); \
		fi \
	done

	cd $(WORK_PATH); \
	FILE=$$(ls); \
	for i in $$FILE; \
	do \
	    if [ -x $$i ]; then \
		install -m 755 $$i $(TARGET); \
		fi \
	done

run:
	$(MYPATH)/script/start.sh

clean:
	rm -rf $(TARGET)/*
	rm -rf $(WORK_PATH)/*
	rm -f $(SRC_PATH)/show
	cd $(SRC_PATH); \
	rm -rf *.i *.s *.o *.so *.gcno *.gcda
