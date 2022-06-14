# Makefile

PROJ_NAME=sample

TARGET=ifgw.cls
INSTALLDIR=/usr/share/texmf-dist/tex/latex/
COMPILER=pdflatex
BIB=bibtex

pdf:
	${COMPILER} ${PROJ_NAME}
	${COMPILER} ${PROJ_NAME}
	${BIB} ${PROJ_NAME}
	${COMPILER} ${PROJ_NAME}
	
install:
	sudo cp ${TARGET} ${INSTALLDIR}
	sudo mktexlsr 

read:
	zathura ${PROJ_NAME}.pdf &

clean:
	rm -f *.{ps,toc,log,lof,lot,los,sym,aux,out,dvi,bbl,blg}
