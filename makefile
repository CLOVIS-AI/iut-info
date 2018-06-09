all: init latex

init:
	git submodule init
	git submodule update

latex: init
	./buildall.sh

publish: clean
	rsync -avzu --include='*/' --include='*.pdf' --exclude='*' --exclude='latex/' --prune-empty-dirs * ivan@jmpi:/home/public/cours

clean:
	rm -rf */*.aux */*.log */*.gz *.log */*.toc
