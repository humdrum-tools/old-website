## GNU/BSD Makefile for Humdrum Extras Sphinx documentation
##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Mon May 26 15:55:09 PDT 2014
## Last Modified: Thu Jun 12 01:20:27 PDT 2014
## Filename:      source/humextra/*/Makefile
##
## Description: Compiles the documentation source code into HTML pages
## 		and can open the corresponding index.html for the current
##		directory.
##
## make      -- Compile the HTML documentation and open local current page.
## make doc  -- Compile HTML documentation.
## make open -- Open index.html for the current directory.
##

BASEDIR  = $(shell pwd | sed 's/.*\/source/../; s/[^\/][^\/]*/../g')
PAGEFILE = $(shell pwd | sed 's/.*\/source\///; s/\.rstd//g; s/$$/\/index.html/g')

all: doc open

open:
	open $(BASEDIR)/html/$(PAGEFILE)

doc: index
	(cd $(BASEDIR); $(MAKE) doc)

clean:
	(cd $(BASEDIR); $(MAKE) clean)

publish:
	(cd $(BASEDIR); $(MAKE) publish)

info:
	@echo BASEDIR  = $(BASEDIR)
	@echo PAGEFILE = $(PAGEFILE)

index:
	-../bin/makerst index.tsr index.rst
	


