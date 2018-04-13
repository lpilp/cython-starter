.PHONY:all clean
exclude_dirs := Makefile REAMDME.md dist
dirs := $(shell ls)
dirs := $(filter-out $(exclude_dirs),$(dirs))
all:
	$(foreach N,$(dirs),make -C $(N);)
clean:
	$(foreach N,$(dirs),make -C $(N) clean;)
	rm -rf dist 
dist: all
	mkdir dist
	cython app.py --embed
	$(CC) -o app app.c `python-config --libs` `python-config --includes`
	cp app dist
	$(foreach N,$(dirs),cp -R $(N)/build dist/$(N);)
