MYPATH=$(shell pwd)
CC=gcc
SRC_PATH=$(MYPATH)/src
INCLUDE=$(MYPATH)/include
TARGET=$(MYPATH)/target


.PHONY:all clean install
all: hello.i hello.s hello.o hello


hello.i:$(SRC_PATH)/hello.c
	cd $(SRC_PATH); \
	$(CC) -E $^ -I$(INCLUDE) -o $@

hello.s:$(SRC_PATH)/hello.i
	cd $(SRC_PATH); \
	$(CC) -S $^ -o $@

hello.o:$(SRC_PATH)/hello.s
	cd $(SRC_PATH); \
	$(CC) -c $^ -o $@

hello:$(SRC_PATH)/hello.o
	cd $(SRC_PATH); \
	$(CC) $^ -o $@

install:hello
	cd $(SRC_PATH); \
	FILE=$$(ls); \
	for i in $$FILE; \
	do \
	    if [ -x $$i ]; then \
		install -m 755 $$i $(TARGET); \
		fi \
	done

clean:
	rm -rf $(TARGET)/*
	rm -f $(SRC_PATH)/hello
	cd $(SRC_PATH); \
	rm -rf *.i *.s *.o
