# Contains the list of all the Coq modules
include Makefile.coq_modules

COQ_FILES = $(addprefix coq/,$(MODULES:%=%.v))

all: coq

coq: Makefile.coq
	@$(MAKE) -f Makefile.coq

Makefile.coq: Makefile Makefile.coq_modules $(COQ_FILES)
	@coq_makefile -f _CoqProject $(COQ_FILES) -o Makefile.coq

clean-coq:
	- @$(MAKE) -f Makefile.coq clean

COQ_FILES_FOR_DOC = $(MODULES:%=%.v)
GLOB_FILES_FOR_DOC = $(MODULES:%=%.glob)

doc: coq
	mkdir -p documentation/html
	rm -f documentation/html/*.html
	cd coq && coq2html -d ../documentation/html -base CertRL $(COQ_FILES_FOR_DOC) $(GLOB_FILES_FOR_DOC)

doc-install: doc
	cp -a documentation/html/* docs

clean: clean-coq
	rm -rf documentation/html

.PHONY: all clean clean-coq coq doc doc-install
