MYPATH=$(shell pwd)
CC=gcc
SRC_PATH=$(MYPATH)/src
INCLUDE=$(MYPATH)/include
TARGET=$(MYPATH)/target
SHARED_LIB_FLAG = -shared


.PHONY:all clean install run
all:show

show.o:$(SRC_PATH)/show.c
	cd $(SRC_PATH); \
	$(CC) -fPIC -c $^ -I$(INCLUDE) -o $@

libshow.so:show.o
	cd $(SRC_PATH); \
	$(CC) $(SHARED_LIB_FLAG) -o $@  $^ 

show:$(SRC_PATH)/main.c libshow.so
	cd $(SRC_PATH); \
	$(CC) $< -I$(INCLUDE) -L. -lshow -o $@

install:
	cd $(SRC_PATH); \
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
	rm -f $(SRC_PATH)/show
	cd $(SRC_PATH); \
	rm -rf *.i *.s *.o *.so
