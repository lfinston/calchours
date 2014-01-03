#### Makefile.am
#### /home/lfinsto/calchours/src/Makefile.am

#### Created by Laurence D. Finston (LDF) Thu Sep  5 13:27:31 CEST 2013

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

#### Automatic Variables.  For more, see Section 10.5.3, "Automatic Variables"
#### of the Make info manual.
#### LDF 2009.12.29.

#### $@:  Target
#### $<:  First prerequisite
#### $^:  The names of all the prerequisites, with spaces between them.
#### $*:  The stem with which an implicit rule matches


bin_PROGRAMS = calchours$(EXEEXT) prbsnflx$(EXEEXT)


calchours_SOURCES = calchours.web calchrs01.web cmdlnopt.web scanner.web timespec.web

prbsnflx_SOURCES = prbsnflx.l++

nodist_calchours_c_files   = $(calchours_SOURCES:.web=.c)
nodist_calchours_cpp_files = $(calchours_SOURCES:.web=.c++)
calchours_object_files     = $(calchours_SOURCES:.web=.o) 

CLEANFILES = calchours calchours.o calchours.c++ calchours.c \
             calchrs01.c++  calchrs01.o caclhrs01.h++  calchrs01.h++ \
             cmdlnopt.c++ cmdlnopt.h++ cmdlnopt.o \
             out.dvi out.log out.txt prbsnflx prbsnflx.c++ \
             scanner scanner.o scanner.l++ scanner.c++ scanner.c scanner.h++ scanner1.h++

timespec.o: timespec.c++ timespec.h++ 
	$(CXXCOMPILE) -c -o $@ $< 

timespec.c++ timespec.h++: timespec.web
	ctangle $<
	mv timespec.c timespec.c++

calchours$(EXEEXT): $(calchours_object_files)
	$(CXXLINK) $(LIBS) -lm $^

calchours.o: calchours.c++ calchrs01.h++ cmdlnopt.h++ scanner.h++ scanner1.h++ timespec.h++
	$(CXXCOMPILE) -c -o $@ $<

calchrs01.o: calchrs01.c++ calchrs01.h++ timespec.h++
	$(CXXCOMPILE) -c -o $@ $<

calchours.c++: calchours.web
	ctangle $<
	mv calchours.c $@

calchrs01.c++ calchrs01.h++: calchrs01.web
	ctangle $<
	mv calchrs01.c calchrs01.c++

cmdlnopt.o: cmdlnopt.c++ cmdlnopt.h++
	$(CXXCOMPILE) -c -o $@ $<

cmdlnopt.c++ cmdlnopt.h++: cmdlnopt.web
	ctangle $<
	mv cmdlnopt.c cmdlnopt.c++

#### *** (3) run

.PHONY: run

.PHONY: run-all

run-all: calchours$(EXEEXT)
	$(MAKE) run-i
	$(MAKE) run

# -s=15 --hol 7-9
# --vacation=7,8,20 
# --sick=8,15 
# --vacation=7,8,22
# --short-column

# calchours --out=out.tex --overtime 2.09 --vacation 9-13,23,30 --holiday 24, 31 --round 12 2013 

# 20 also vacation

run: calchours
	calchours --out=out.tex --holiday 1 --overtime 1.41 --round 1 2014 
	tex out.tex

#### *** (3) run-r

.PHONY: run-r

run-r: calchours$(EXEEXT)
	calchours -o=out_round.tex -r
	tex out_round.tex


#### **** (4) run-11

.PHONY: run-11

run-11: calchours$(EXEEXT)
	echo "delete from calchours.Hours where start >= '2013-11-01 00:00:00'" | \
           mysql --user=root --password=root calchours
	calchours -i=hours.11.2013.txt --out=out_11.tex --overtime 9.83 --vacation 4-15 --round 11 2013 
	tex out_11.tex

#### **** (4) run-i

.PHONY: run-i

run-i: calchours$(EXEEXT)
	echo "delete from calchours.Hours where start >= '2014-01-01 00:00:00'" | \
           mysql --user=root --password=root calchours
	calchours -i=hours.01.2014.txt

#### *** (3) scanner

scanner.o: scanner.c++ calchrs01.h++
	$(CXXCOMPILE) -c -o $@ $<

scanner.c++ scanner.h++: scanner.l++
	flex scanner.l++
	mv lex.yy.c scanner.c++

scanner.l++ scanner1.h++: scanner.web prbsnflx
	ctangle scanner.web
	prbsnflx scanner.c scanner.l++ 
	@rm scanner.c

#### *** (3) prbsnflx

#### prbsnflx is used for removing C-style comments from the output of CWEB 
#### in order to create valid input files for Flex and GNU Bison.
####
#### LDF 2011.08.10.

prbsnflx$(EXEEXT): prbsnflx.o
	$(CXXLINK) $<

prbsnflx.o: prbsnflx.c++
	$(CXXCOMPILE) -c -o $@ $<

prbsnflx.c++: prbsnflx.l++
	flex -o $@ $<


#### *** (3) query

.PHONY: query

query:
	@echo "CXXFLAGS == $(CXXFLAGS)"
	@echo "CXXCOMPILE == $(CXXCOMPILE)"
	@echo "CXXLINK == $(CXXLINK)"
	@echo "CXX == $(CXX)"
	@echo "CC == $(CC)"
	@echo "LDFLAGS == $(LDFLAGS)"
	@echo "LIBS == $(LIBS)"
	@echo "CFLAGS == $(CFLAGS)"

# @echo "select start, end, unix_timestamp(start) as 'start SSE', " \
#      "unix_timestamp(end) as 'end SSE' from Hours order by start\G" | \
#      mysql --user=root --password=root calchours

#### *** (3) clean and purge

.PHONY: purge

purge: 
	$(MAKE) clean

#### *** (3)

.PHONY: tags

tags: 
	etags $(calchours_SOURCES)

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
