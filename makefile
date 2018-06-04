all: init latex clean

init:
	git submodule init
	git submodule update

latex: init
	./buildall.sh

publish:
	rsync -avzu */*.pdf ivan@jmpi:/home/public/cours

clean:
	rm -rf */*.aux */*.log */*.gz *.log
