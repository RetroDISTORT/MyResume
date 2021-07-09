export TEXTINPUTS=.:..//:
JOB=$(wildcard *.tex)
JOB:=$(subst .tex,,$(JOB))
VIEWER=okular
LTX=xelatex

default:$(JOB).pdf

$(JOB).pdf: $(JOB).tex | build
	cd build && $(LTX) -jobname=$(JOB) ../$(JOB).tex
	mv build/$(JOB).pdf .

build: # set up the build directory
	mkdir build

test:	default
	okular $(JOB).pdf

clean:
	-rm -rf build $(JOB).pdf
