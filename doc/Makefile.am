#### Makefile.am

#### Created by Laurence D. Finston (LDF) Wed Oct 16 09:52:39 CEST 2013

#### * (1) Copyright and License.

#### This file is part of calchours, a package for keeping track of working hours.
#### Copyright (C) 2013, 2014 Laurence D. Finston

#### calchours is free software; you can redistribute it and/or modify 
#### it under the terms of the GNU General Public License as published by 
#### the Free Software Foundation; either version 3 of the License, or 
#### (at your option) any later version.  

#### gwrdifpk is distributed in the hope that it will be useful, 
#### but WITHOUT ANY WARRANTY; without even the implied warranty of 
#### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
#### GNU General Public License for more details.  

#### You should have received a copy of the GNU General Public License 
#### along with gwrdifpk; if not, write to the Free Software 
#### Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

#### gwrdifpk is available for downloading via Git from 
#### https://github.com/lfinston/gwrdifpk-github.git.

#### Please send bug reports to Laurence.Finston@gmx.de

#### The author can be contacted at: 

#### Laurence.Finston@gmx.de



SOURCES_MANUAL := calchours.texi intro.texi invoking.texi

EXTRA_DIST = $(SOURCES_MANUAL) 

#00INFO .gitignore calchours.dvi calchours.ps calchours.pdf  texinfo.tex Makefile_1 fdl.texi fdl.txt

all: calchours.dvi calchours.ps calchours.pdf calchours.info calchours.html html-split

.PHONY: dvn

dvn: dvi info

#### *** (3) DVI, PS and PDF Output

.PHONY: dvi

dvi: calchours.dvi

.PHONY: ps

ps: calchours.ps

.PHONY: pdf

pdf: calchours.pdf

calchours.pdf: calchours.ps
	ps2pdf $< $@ 

calchours.ps: calchours.dvi
	dvips -o $@ $<

calchours.dvi: $(SOURCES_MANUAL)
	texi2dvi calchours.texi

#### *** (3) Info output

.PHONY: info

info: calchours.info

calchours.info: $(SOURCES_MANUAL)
	makeinfo --force calchours.texi

#### *** (3) HTML Output, no split 

.PHONY: html

html: calchours.html

calchours.html: $(SOURCES_MANUAL)
	makeinfo --html --no-split --force calchours.texi

#### *** (3) Split HTML Output 

.PHONY : html-split

html-split: $(SOURCES_MANUAL)
	makeinfo --html --force calchours.texi

#### ** (2) Tags

.PHONY: tags

tags: TAGS

TAGS: $(SOURCES_MANUAL)
	etags $(SOURCES_MANUAL)

#### ** (2) Purge and Clean

PURGE_FILES := calchours.aux calchours.cp calchours.dvi calchours.fn calchours.html calchours.info \
               calchours.ky calchours.log calchours.pdf calchours.pg calchours.ps calchours.toc \
               calchours.tp calchours.vr 

.PHONY: purge


purge: 
	rm $(PURGE_FILES)

CLEANFILES := $(PURGE_FILES)

clean-local:
	-rm -rf calchours



#### *** (3) query


.PHONY: query

query: 
#	echo "BUFFER_SIZE == $(BUFFER_SIZE)"
#	@echo "abs_top_builddir == $(abs_top_builddir)"
#	@echo "abs_builddir == $(abs_builddir)"
# 	@echo "FC == $(FC)"
# 	@echo "F77 == $(F77)"
# 	@echo "CC == $(CC)"
# 	@echo "QUALI_SEND_TO_ADDRESS == $(QUALI_SEND_TO_ADDRESS)"
# 	@echo "QUALI_SEND_TO_ADDRESS == @QUALI_SEND_TO_ADDRESS@"
# 	@echo "POSTGRESQL_FLAGS == $(POSTGRESQL_FLAGS)"
# 	@echo "POSTGRESQL_FLAGS == @POSTGRESQL_FLAGS@"
# 	@echo "CTANGLE == $(CTANGLE)"
# 	@echo "CWEAVE == $(CWEAVE)"
# 	@echo "cweave == "`type cweave`
# 	$(MAKE) query -C $(WEBSERVERDIR)
#	$(MAKE) query -C $(USERADMINDIR)


#### *** (3)

#### ** (2) End of `Makefile.am'

#### * (1) Local variables for Emacs

#### Local Variables:
#### mode:Makefile
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
