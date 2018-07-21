all: init latex

init:
	git submodule init
	git submodule update

latex: init
	./buildall.sh

publish: clean
	rsync -avzu --include='*/' --include='*.pdf' --exclude='*' --exclude='latex/' --prune-empty-dirs * ivan@clovis.online:/home/public/cours

clean:
	rm -rf */*.aux */*.log */*.gz *.log */*.toc */*.out */*.dvi */*.html */*.idv */*.lg */_minted*
