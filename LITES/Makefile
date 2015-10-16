MAKE = make

.PHONY: all clean diff


MAIN = LITES-Paper

ALL = ${MAIN}.pdf

all: ${ALL}


TEX  := $(shell find .    -name '*.tex')

%.pdf: ${TEX}
	latexmk -pdf $*.tex

EXTS  = *~ *.aux *.backup *.blg *.log *.out *.lof *.loa *.lot *.toc *.bbl *.bak *.texshop *.dvi *.fdb_latexmk
TRASH := $(foreach ext,${EXTS},$(shell find . -name '${ext}'))

clean:
	@echo Cleaning  ${EXTS} ${ALL}...
	@rm -f ${TRASH} ${ALL}

COMPARE_TO ?= HEAD

diff:
	 git latexdiff --whole-tree --main ${MAIN}.tex --latexmk  -o diff-to-${COMPARE_TO}.pdf ${COMPARE_TO} 
