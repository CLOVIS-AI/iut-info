all: init pdf html

init:
	git submodule init
	git submodule update

pdf: latex
latex: init
	@./latex/build --no-print-logs PDF */*.tex

html: init
	@./latex/build --no-print-logs HTML */*.tex

publish: clean
	rsync -avzu --exclude='private/' --exclude='latex/' --include='*/' --include='*.pdf' --exclude='*' --prune-empty-dirs * ivan@clovis.online:/home/public/cours

clean:
	@./latex/build --no-print-logs CLEAN */*.tex

help:
	@echo "clean:    Remove temp files"
	@echo "init:     Prepare submodules"
	@echo "latex:    init + Compile LaTeX files into PDF"
	@echo "pdf:      Same as 'latex'"
	@echo "html:     init + Compile LaTeX files into HTML"
	@echo "publish:  clean + Publish to clovis.online"
	@echo "help:     This page"
