#### Makefile.am
#### Top-level Makefile.am

#### Created by Laurence D. Finston (LDF) Wed Oct 16 09:47:03 CEST 2013

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

ACLOCAL_AMFLAGS = -I m4

#### ** (2) bin_PROGRAMS 

bin_PROGRAMS = calchr00$(EXEEXT) 

calchr00_SOURCES = calchr00.c


#### ** (2) Variables for subdirectories.
#### 
#### LDF 2008.06.23.

DATABASEDIR = database
SOURCEDIR = src
DOCDIR = doc

export DATABASEDIR
export SOURCEDIR
export DOCDIR

SUBDIRS = $(DATABASEDIR) $(SOURCEDIR) $(DOCDIR) 

export abs_top_builddir

#### ** (2)

#### *** (3) EXTRA_DIST 
####        (additional files to be included in the distribution)

EXTRA_DIST = .gitignore

#### ** (2) Rules

#### *** (3) clean-local

# clean-local:
# 	@rm -f 
#              
#              

# all-local: 

# mostlyclean-local: 
# 	@rm -f 

#### *** (3) 'run' targets

.PHONY: run-i

run-i:
	$(MAKE) run-i -C $(SOURCEDIR)

.PHONY: run-c

run:
	$(MAKE) run -C $(SOURCEDIR)

#### *** (3) query

.PHONY: query

query: 
#	echo "BUFFER_SIZE == $(BUFFER_SIZE)"
	$(MAKE) query -C $(SOURCEDIR)
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

#### ** (2) End of top-level `Makefile.am'

#### * (1) Local variables for Emacs

#### Local Variables:
#### mode:Makefile
#### abbrev-mode:t
#### eval:(read-abbrev-file)
#### eval:(outline-minor-mode t)
#### outline-regexp:"#### [*\\f]+[ \\t]+([0-9]+)"
#### End:
