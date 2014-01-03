/*  hoursdb.sql  */
/* Created by Laurence D. Finston (LDF) Thu Sep  5 12:54:56 CEST 2013  */

/* * (1)  Top  */


/* * (1) Copyright and License.

This file is part of calchours, a package for keeping track of working hours.
Copyright (C) 2013, 2014 Laurence D. Finston

calchours is free software; you can redistribute it and/or modify 
it under the terms of the GNU General Public License as published by 
the Free Software Foundation; either version 3 of the License, or 
(at your option) any later version.  

gwrdifpk is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
GNU General Public License for more details.  

You should have received a copy of the GNU General Public License 
along with gwrdifpk; if not, write to the Free Software 
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

gwrdifpk is available for downloading via Git from 
https://github.com/lfinston/gwrdifpk-github.git.

Please send bug reports to Laurence.Finston@gmx.de

The author can be contacted at: 

Laurence.Finston@gmx.de  */


/* ** (2)  Emacs Commands:   */ 

/* 
   Call `sql-mysql' (C-f10) to get a buffer in SQLi-mode.  It may be necessary to set
   SQL-mode in the buffer containing this file (C-f9) , although I don't think 
   it should be.  

   Call `toggle-truncate-lines' (C-f1) to suppress wrapping long lines in the 
   SQLi-mode buffer.
 
   Use `C-c C-r' to send the contents of the region to the SQLi-mode buffer.
   I'll probably set keys for various functions in the hook for SQL-mode.

   LDF 2009.12.29.

*/

/* ** (2)  Database and user info  */ 

show databases;

show tables;

use mysql;

use calchours;

/* ** (2)  Database calchours'  */ 

create database calchours;

grant all on calchours to lfinsto;

use calchours;

-- drop database calchours;

/* ** (2)  Create tables.  */

/* *** (3)  Hours.  */

drop table Hours;

create table Hours
(
    start timestamp default 0,
    end timestamp default 0

);

alter table Hours add constraint unique key (start, end);

select * from Hours order by start;
select start, minute(start) from Hours order by start limit 1;

select start, end, unix_timestamp(start) as 'start SSE', unix_timestamp(end) as 'end SSE' from Hours order by start;

insert into Hours (start, end) values (now(), timestampadd(minute, 10, now()));

insert into Hours (start, end) values (addtime(now(), '0 1:0'), addtime(now(), '0 2:15'));

select '2007-11-01 13:05:12', addtime('2007-11-01 13:05:12', '1 1:1') as new_val;

select now(), addtime(now(), '1 1:1') as new_val;


/* ** (2) */

/* * (1) Local variables for Emacs  */


/* 
Local Variables:
mode:SQL
abbrev-mode:t
eval:(read-abbrev-file "~/.abbrev_defs")
eval:(outline-minor-mode t)
outline-regexp:"\/\\*[ \\t]+[*\\f]+[ \\t]+([0-9]+)"
comment-start:"/*"
comment-end:"*/"
End:
*/

