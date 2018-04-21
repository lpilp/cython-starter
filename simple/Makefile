.PHONY: clean all

pyfiles=$(shell ls *.py)
exclude_python := app.py __init__.py
sofiles=$(filter-out $(exclude_python),$(pyfiles))

ifndef package
	package="build"
endif

all : build
	mkdir -p $(package)
	cp __init__.py $(package)
	cp *.so $(package)
	cp app $(package)

build : $(sofiles:.py=.so) app

app:app.py
	cython app.py --embed
	$(CC) -o app app.c `python-config --libs` `python-config --includes`

%.c : %.py
	cython $<

%.o : %.c
	$(CC) -c -fPIC $< `python-config --libs` `python-config --includes`

%.so : %.o
	$(CC) -o $@ $< -fPIC  --shared `python-config --libs`

clean:
	rm -f *.c *.o *.so
	rm -rf build
