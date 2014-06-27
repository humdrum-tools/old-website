
HUMDRUM PROBLEMS
================

**This document describes some known problems with the Humdrum Toolkit.**


Version Differences
-------------------

> The Humdrum Toolkit has undergone continuous revision and augmentation
since 1989. Each version of the Toolkit is identified by a version number.
>
> If you have installed the Humdrum Toolkit, you can determine which version
you are using by typing the **humver** command.


Official and Unofficial Versions
--------------------------------

> Several versions of the Humdrum Toolkit exist, both *official releases* and
*unofficial versions*.
>
> In creating each *Official Release* of the Humdrum Toolkit, I have
maintained a policy that we release only software that has been tested on
multiple operating systems. Test systems have included AIX, BSD Unix, HPUX,
Linux, Solaris and DOS/MKS Toolkit.
>
> Although software development is ongoing, we tend to revise and develop the
software on a single operating system (mostly Linux). Since operating systems
differ slightly, it is not always clear that new or revised software will
work properly on other systems. We realize that testing on other systems is
essential; in particular, we try to be careful to avoid introducing new bugs
when fixing old ones.
>
> Unfortunately, running test suites on the various operating systems is
cumbersome and time-consuming, and no one has volunteered to help with this.
Consequently, running test suites relies on external grants to hire a
programmer. The last time such funds were available was 1994.
>
> This explains why the most current version of the Humdrum Toolkit is 2.6
whereas the currently *available official release* is 1.0.


Differences Between Humdrum Release 1.0 and Versions 2.X
--------------------------------------------------------

>
Documentation
:::::::::::::
>
>> Please note that much of the Humdrum Toolkit documentation (including the
*Humdrum Users Guide*) describes Humdrum version 2.0 or beyond. In some
cases, the documentation describes how the tools *ought* to function rather
than how they *actually* function. For example, the **yank** command does not
yet handle the system of *nested section labels* described in the *Humdrum
Users Guide*.
>
>
The "ditto" and "fill" Commands
:::::::::::::::::::::::::::::::
>
>> The old Humdrum **fill** command was renamed **ditto** with Version 2.0.

--------


Reporting Bugs
--------------

> Please do not report software bugs until further notice. I have a list of
known bugs, and most users simply tell me what I already know. Unfortunately,
I can no longer handle the volume of e-mail that I receive related to
Humdrum.
>
> Obviously, a good solution would be to post the known bugs on the web, so
users could refer to the list before submitting a bug report. However, I
don't currently have the time to do this. Sorry.

--------


Trouble-Shooting Tips
---------------------

The table below lists some common errors associated with faulty or incomplete
installation of the Humdrum Toolkit.

> **Error****Possible cause**
> =
> ``Bad command or file name``Kornshell has not been installed or PATH
> has not been properly set.
> ``glob: EXEC error``Install invoked from Windows without
> opening a shell.
> *`` not found*PATH not set correctly or command has
> not been copied into the Humdrum directory.
> * ``: -f: not found*AWK_VER shell variable not set.
> * ``: awkl: not found*"awkl" not in current PATH (DOS/OS2).
> * ``: nawk: not found*"nawk" not in current PATH (UNIX).
> ``awkl: script file "<*progname.awk>":*HUMDRUM shell variable not set, or
PATH
> ``no such file or directory``not set correctly.
> ``_main: memory allocation failure``Input file(s) too big to handle; try
breaking
> the input into smaller segments (using
> `*yank*'), and process each segment separately.
> Assemble back together by using `*cat*'.
> ``pc: compiler error ...``Humdrum `pc' command conflicts with a
> Pascal language compiler named `pc'.
> Rename Humdrum `pc.ksh' and `pc.awk' files.

