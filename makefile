all: init latex

init:
	git submodule init
	git submodule update

latex: init
	./buildall.sh

publish: clean
	rsync -avzu --exclude='private/' --include='*/' --include='*.pdf' --exclude='*' --exclude='latex/' --prune-empty-dirs * ivan@clovis.online:/home/public/cours

clean:
	rm -rf */*.aux */*.log */*.gz *.log */*.toc */*.out */*.dvi */*.html */*.idv */*.lg */_minted*

help:
	echo "client: Remove temp files"
	echo "init: Prepare folders"
	echo "latex: init + Compile LaTeX files"
	echo "publish: clean + Publish to clovis.online"
	echo "help: This page"
