#### http://www.ruanyifeng.com/blog/2015/02/make.html
#### make package=<name>
.PHONY: clean all
sofiles=$(shell ls *.py | grep -v "__init__")
ifndef package
	package="build"
endif
all : build
	mkdir -p $(package)
	cp __init__.py $(package)
	cp *.so $(package)
build : $(sofiles:.py=.so)
%.c : %.py
	cython $<
%.o : %.c
	$(CC) -c -fPIC $< `python-config --libs` `python-config --includes`
%.so : %.o
	$(CC) -o $@ $< -fPIC  --shared `python-config --libs`
clean:
	rm -f *.c *.o *.so
	rm -rf build
