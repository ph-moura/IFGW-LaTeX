# Makefile

PROJ_NAME=sample

TARGET=ifgw.cls
INSTALLDIR=/usr/share/texmf-dist/tex/latex/
COMPILER=pdflatex
BIB=bibtex
CLEAN=.{ps,toc,log,lof,lot,los,sym,nav,snm,aux,out,dvi,bbl,blg}

pdf:
	${COMPILER} ${PROJ_NAME}
	${BIB} ${PROJ_NAME}
	${COMPILER} ${PROJ_NAME}
	${COMPILER} ${PROJ_NAME}
	
install:
	sudo cp ${TARGET} ${INSTALLDIR}
	sudo mktexlsr 

uninstall:
	sudo rm -f ${INSTALLDIR}${TARGET} 
	sudo mktexlsr 

read:
	zathura ${PROJ_NAME}.pdf &

clean:
	rm -f *${CLEAN} */*${CLEAN}
