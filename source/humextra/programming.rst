
.. |kern| unicode:: **kern
.. |recip| unicode:: **recip

.. role:: cpp(code)
	:language: cpp

.. |nbsp| unicode:: 0xA0
	:trim:

.. ########################################################################

===================================
Programming Tutorial
===================================

This chapter demonstrates how to write programs using the C++ library for
parsing Humdrum Files, which forms the basis of the Humdrum Extras tools.



Getting Started
===============

First, you should install
`Humdrum Extras <https://www.github.com/craigsapp/humextra>`__
or the
`humdrum-tools <https://www.github.com/humdrum-tools/humdrum-tools>`__
meta repository which includes Humdrum Extras.  Instructions for
installing humdrum-tools are given `here <../../install/github>`__.

Once Humdrum Extras has been installed (and you know where it is located), 
you can place your program source code into the ``humextra/src-programs`` 
directory.  If the file is called ``humextra/src-programs/myprogram.cpp``,
then you can type this command within the humextra directory to compile it:

.. highlight:: bash
.. code:: bash

	make myprogram

If there are no compiling errors, then the compiled program will be
``humextra/bin/myprogram``.  If you have set up the PATH environment
variable for Humdrum Extras, you should be able to use the program from
any directory; otherwise, in the ``humextra`` directory, you can type
``bin/myprogram`` to run it.



Tutorial
========

Here are a set of graduated programming examples which can be used as a
starting point for writing your own programs.

Basic data access
-----------------

humecho.cpp (Echo input data to output)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Below is a very simple C++ program called ``humecho.cpp`` that uses the
main Humdrum file parser of the Humdrum Extras library to read and write a
Humdrum file:


.. literalinclude:: programming.rstd/humecho.cpp
	:linenos:
	:language: cpp


This program takes one Humdrum file as an argument (or standard
input if no filename given) and echos the contents of the Humdrum
file to standard output.  The declaration :cpp:`HumdrumFile hfile;`
on line |nbsp| 3 creates
a variable called ``hfile`` that is a ``HumdrumFile`` object.
The program then chooses where to read data from on lines |nbsp| 4--5: 
if there is at least one command-line argument, it will read data 
from that filename; otherwise, it will read data from standard input.  
Once the ``hfile`` variable has read some content, it immediately prints 
it to standard output on the 
line |nbsp| 6: :cpp:`std::cout << hfile;`.  

To compile this program using the Humdrum Extras makefiles, place
``humecho.cpp`` in the directory ``humextra/src-programs``, and
then type ``make humecho`` in the ``humextra`` directory. The
compiled program will be placed in ``bin/humecho``.  The ``humecho``
program can access input data in several ways, including downloading
from the web, or using the humdrum:// URI (or hum:// or h://
abbreviations):


.. highlight:: bash
.. code:: bash

	cat file.krn | bin/humecho           # standard input
	bin/humecho file.krn                 # command-line argument
	bin/humecho h://wtc/wtc1f01.krn      # humdrum:// URI
	bin/humecho jrp://Jos2721            # jrp:// URI
	bin/humecho http://y.z.com/file.krn  # hypothetical URL for a Humdrum file


Try compiling ``humecho.cpp`` and then process various local and
remote Humdrum data files with the compiled program.  If the PATH
environment variable contains the Humdrum Extras bin directory,
then you can omit the ``bin/`` prefix when running humecho.  For
long files, you can pipe the standard output from ``humecho`` into
the unix command ``less`` (typing ``q`` to exit from ``less``):


.. code:: bash

	humecho h://371chorales/chor001.krn | less


humecho2.cpp (Accessing individual lines)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``humecho`` program shows how to access the datafile in its
entirety. The following source code for ``humecho2.cpp`` demonstrates
how to access lines in the file individually. A HumdrumFile class
essentially consists of an array of `HumdrumRecord
<http://extras.humdrum.org/download/humextra/include/HumdrumRecord.h>`__
class objects.


.. literalinclude:: programming.rstd/humecho2.cpp
	:language: cpp
	:emphasize-lines: 8-10
	:linenos:

.. The following option for literalinclude will work in Sphinx 1.3:
	:filename: humecho2.cpp


The highlighted lines |nbsp| 8--10 in ``humecho2.cpp`` replace this single
line from ``humecho.cpp``:

.. literalinclude:: programming.rstd/humecho2.cpp
	:language: cpp
	:lines: 6

.. The following option for literalinclude will work in Sphinx 1.3:
	:lineno-start: 6
	:linenos:

The added for-loop accesses each data line of the input file and
prints it individually to standard output.  Notice that the ``[]``
operator returns a HumdrumRecord object which stores the content
of one line in a Humdrum file.

The :cpp:`hfile.getNumLines()` member function returns the number
data records in the Humdrum file stored in the hfile variable, so
the for-loop iterates through each line in the file from the first
at index 0, to the last at :cpp:`hfile.getNumLines()-1`.



humecho3.cpp (Accessing HumdrumRecord fields)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An even more verbose version of ``humecho`` is given below. The
``humecho3`` program further expands access to the data as a
two-dimensial grid, matching the spreadsheet-like arrangement of
data in Humdrum files.  Each line of a HumdrumFile object consists
of HumdrumRecord objects.  These in turn consist of a list of data
fields, called *tokens* in Humdrum parlance.  The
``HumdrumRecord::getFieldCount()`` function returns the number of
fields on the line.  For global comments, reference records and
blank-line records, the field count is always 1.  For local comments,
interpretations and data records, the field count is equivalent to
the number of tab-separated values (`TSV
<http://en.wikipedia.org/wiki/Tab-separated_values>`__) on the line,
so ``.getFieldCount()`` will return a count one larger than the
number of tabs on the line for those types of data records.


.. literalinclude:: programming.rstd/humecho3.cpp
	:language: cpp
	:emphasize-lines: 9-13
	:linenos:

The ostream output of the HumdrumRecord is now replaced by the
highlighted lines of code on lines |nbsp| 9--13.  HumdrumRecords
always contain at least one field, so the code "``cout << hfile[i][0];``\
" will never cause an invalid array access in any situation.  Both
``[]`` operators used on the ``hfile`` variable (first to access a
``HumdrumRecord``, and the second for a ``const char*``) are always
checked for a valid range, and the program will exit with an error
if an out-of-range value is requested.

Note that ``hfile[i][j]`` is a ``const char*`` and not a ``char*``. If
you want to change the contents of a field, you would have to use
``hfile[i].changeField(j, "new string")``.


HumdrumRecord line types
~~~~~~~~~~~~~~~~~~~~~~~~

Each HumdrumRecord line in a HumdrumFile class possesses an enumerated
type:


.. csv-table::
	:header: Enumeration constant, Description

	E_humrec_data,		 data lines other than measure
	E_humrec_data_measure,	 line starting with ``=``
	E_humrec_interpretation, line starting with ``*``
	E_humrec_bibliography,	 reference records of the form ``!!!key: value``
	E_humrec_global_comment, "starts with ``!!``, other than reference records"
	E_humrec_local_comment,	 "local comment, starting with single ``!``"
	E_humrec_empty,		  empty line

Use the HumdrumRecord::getType() function to access the type of a line.
These type values can be used for ``switch`` statements, but for better
code readability, the following helper HumdrumRecord functions interface
uitd these enumerations:

.. csv-table::
	:header: HumdrumRecord method, Description

	.isData(),	 	true if data (other than barline).
	.isMeasure(),	 	true if barline (line starts with ``=``).
	.isInterpretation(),	true if line starts with ``*``.
	.isBibliographic(),	true if in the form of ``!!!key: value``.
	.isGlobalComment(),	true if line starts with ``!!`` and not bib.
	.isLocalComment(),	true if line starts with one ``!``.
	.isEmpty(),	 	true if nothing on line.


In addition there are a few composite tests for line types:

.. csv-table::
	:header: HumdrumRecord method, Description
	:widths: 200, 500

	.isComment(),	"isBibliographic() or isGlobalComment() or isLocalComment()"
	.isTandem(),	"Interpretation lines which contain only spine manipulators (*+, *-, *^, *v, *x, or exclusive interpretations (starting with **)."
	.isNull(),	"isData() and all fields are ``.`` (null token), or isInterpretation() and all fields are ``*``."
	.hasSpines(),	"isData() or isMeasure() or isLocalComment() or isInterpretation()"



"rid -GLI" (Remove all lines except for data lines)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Humdrum Tool ``rid`` with the ``-GLI`` options can be implemented
using the following C++ program:

.. literalinclude:: programming.rstd/ridGLI.cpp
	:language: cpp
	:linenos:

The above code will only print lines which are data or barlines. The
official Humdrum file specification does not technically distinguish
between barlines and data, but in practice and from a logical point of
view they must be separated. So when using the Humdrum Extras C++ parser
for Humdrum files, a line of data should not contain a mixture of data
(or null tokens) and barlines.



"rid -GLId" (Remove comments, interpretations and null data)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. literalinclude:: programming.rstd/ridGLId.cpp
	:language: cpp
	:linenos:


The ``HumdrumRecord::isNull()`` function returns true if all fields
in the record are equal to the string "." (called a null token in
Humdrum terminology—not related to a NULL pointer in C).



Options class (User-specified options)
--------------------------------------

"myrid -M -C -I" (Handling command-line options)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Humdrum Extras library contains a helper class called
`Options <http://extras.humdrum.org/download/humextra/include/Options.h>`__
which can be used to manage command-line options. The following example
program implements the options ``-M`` (suppress measure lines), ``-C``
(suppress comments), ``-I`` (suppress interpretations) in a C++
implementation of the Humdrum Toolkit rid program.

The Options class can be used to define multiple aliases for the same
option, such as a short abbreviation and a long form. The options are
formulated on the command line according to
`POSIX <http://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html>`__
rules for options: single-letter options are preceded by a single dash.
Multiple-letter options are preceeded by two dashes. When a
single-letter option does not require it's own argument, they can be
globbed together into a list of options preceded by a single dash. Here
are various program usages for the code below:


.. csv-table::
	:header: Command, Description

	myrid -M file.krn,		 "Remove measure lines when echoing file.krn to standard output."
	myrid -M -I -C file.krn,	 "Remove measure lines, interpretations and comments (global, local and reference)."
	myrid -MIC file.krn,		 "Same as above. Shorthand for bundling multiple single-letter boolean options."
	myrid --no-measures file.krn,	 "Long form of ``myrid -M``."
	myrid --options,		 "Secret built-in option for the Option class which will force a list of defined options to be printed to standard output."
	myrid -A file.krn,		 "The option list will also be displayed when an undefined or misspelled option is used. Use ``--`` to disable options processing for unusual cases such as a filename starting with a dash."
	myrid -MM file.krn,		 "Duplicate options are ignored, so only the last -M is used. Note that this is not the option ``MM`` which would be formulated as ``myrid --MM``."
	myrid -M file.krn -IC,		 "Options can occur in any order, and can come before or after any command arguments which are not options."
	myrid -M -- -file.krn -C,	 "Process the poorly named file ``-file.krn`` and the even more poorly named file called ``-C`` which is not an option if it comes after the -- marker."


Note in the following source code, an extra include directive for the
Options class does not need to be added, since the declaration for the
Options class is included in ``humdrum.h``. If you want to use the
Options class independent of the HumdrumFile parser, you can instead
include the file ``Options.h``.


.. literalinclude:: programming.rstd/humoptions.cpp
	:language: cpp
	:linenos:


The code ``HumdrumFile hfile(opts.getArg(1));`` reads data from the
first argument on the command line. Note that argument counts are
indexed from 1 rather than 0, since the program name is typically
reserved for the first input argument.  However, To access the name
of the command, use the Options::getCommand() function.



Option definitions
~~~~~~~~~~~~~~~~~~

Notice the Options::define() function calls in the above program. These
are used to define the options that an Options variable will search for
when the Options::process() function is called. The .define() function
takes two arguments (the second one optional). The first argument is the
definition string, and the second is a human-readable description of the
option.

The option definition string has the basic format:

.. code::

	"OptionName=OptionType:DefaultValue"

The OptionName can include aliases which are added to the Option name,
separated by a pipe (``|``) character:


.. code::

	"OptionName|OptionAlias1|OptionAlias2=OptionType:DefaultValue"

For example:

.. code::

	"M|no-measures=b"


is the definition of the option "M" or equivalently "no-measures" which
is a boolean type (which means that it sets a true/false switch for the
option). For boolean options, there is no default value—they are "false"
if not given as an argument to the program, and turned to "true" when
given as input to a program.

There are four Options data types:

.. csv-table::
	:header: Option type, Description, Options value access

	b,	 boolean (true or false),	 .getBoolean("OptionName")
	i,	 integer		,	 .getInteger("OptionName")
	d,	 double (floating-point number),	 .getDouble("OptionName")
	s,	 string	 		,	.getString("OptionName")


In terms of implementation, there are really only two types: booleans
(with out parameters) and non-booleans (with parameters). Within a C++
program you can acess the original string form of the option's
parameter, or you can convert it into an ``int`` or a ``double`` at
runtime. For example, if an option "number" is defined, you can get the
integer version of the number with .getInteger("number"), or the double
version of the number with .getDouble("number"), or you can check to see
if the option was set from the input arguments to the program with
.getBoolean("number").

Here are some example option definitions with option names, option
aliases, and option types:


.. csv-table::
	:header: Option definition, Command-line examples

	\"r=b"		,	command -r
	\"m=i"		,	command -m 10 or command -m10
	\"value=d\"	,	command -v 5.23 or command -v5.23
			,	command --value 5.23
			,	command --value=5.23
	\"t=s"		,	command -t string or command -tstring
			,	command -t "string with spaces"
			,	command -t 'funny $tring'


When options names (or option aliases) are a single character, the space
between the option name and it parameter is optional, as in "command -m
10" or "command -m10". When an option has multiple characters, the space
is not optional, although an equals sign can be substituted for the
space: "command --value 5.23" and "command --value=5.23". When a string
option contains spaces, or other special characters reserved for shell
syntax, (such as [;&$\|?\*\\]). The multi-word option must be enclosed
in quotes. To insert a quote into the string option place a backslash
before it: \\". To prevent the command-line parser from looking inside
of the string use single quotes: "command -t 'funny $tring'". In this
case the final input will be "funny $tring". If double quotes were used,
$tring would be interpreted as an environmental variable and its value
would be substituted, usually resulting in "funny ", since you are not
likely to have the shell variable $tring defined.



Default option values
~~~~~~~~~~~~~~~~~~~~~

The final component of the option definition is a default value to use
if no input is given for that option on the command-line. If no default
value is given in the definition, the default value will be zero. For
example, if this option definition is given:


.. code:: cpp

       options.define("v|val|value=i:10", "an integer value");


Then here are different behaviors when accessing that option's value in
C++:

::

    User-set option: 
       program -v 20
          options.getInteger("value")      &rarr; 20
          options.getInteger("val")        &rarr; 20
          options.getInteger("v")          &rarr; 20

    Default option:
       program
          options.getInteger("value")      &rarr; 10
          options.getInteger("val")        &rarr; 10
          options.getInteger("v")          &rarr; 10


Accessing option values
~~~~~~~~~~~~~~~~~~~~~~~

As mentioned previously, the .getBoolean, .getInteger, .getDouble and
.getString accessor functions are used to extract an option value from
the Options database after .process() has been called on the ``argc``
and ``argv`` input parameters to ``main()``. All of the get functions
can be applied to any option type. For example, the option definition:

.. code:: cpp

       .define("t|temperature=d:80.6 Farenheit", "temperature setting")

can be used to extract any of the four option types in C++:

::

       .getBoolean("temperature")           &rarr; 1 (true) if set via the command-line.
                                            &rarr; 0 (false) if not set via the command-line.
       .getInteger("temperature")           &rarr; 80
       .getDouble("temperature")            &rarr; 80.6
       .getString("temperature")            &rarr; "80.6 Farenheit"



Input from piped data or file(s)
--------------------------------

Most of the previous program examples expect a single filename as input
for processing. The following program example (``humecho4``) is more
flexible, allowing for multiple input files. If no filenames are given,
then standard input will be read as the input data:


.. literalinclude:: programming.rstd/humecho4.cpp
	:linenos:
	:language: cpp

This program has an identical function to ``humecho.cpp``, but now
multiple files can be read in and processed at the same time. For
example if there are two input files with these contents:

.. raw:: html

	<table style="background:white;">
	<tr valign=top>
	<td>
	<center>
	file 1
	</center>

.. code:: humdrum

	**kern
	1c
	2d
	4e
	*-

.. raw:: html

	<td width=20>
	</td>
	<td>
	<center>
	file 2
	</center>

.. code:: humdrum

	**kern
	2cc
	4b
	2a
	*-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>
	<center>
	output
	</center>

.. code:: humdrum

	**kern
	1c
	2d
	4e
	*-
	**kern
	2cc
	4b
	2a
	*-

.. raw:: html

   </td>
   </tr>
   </table>

Here are some possible command-line realizations for the above program:

.. code:: bash

    humecho4 file.krn
    humecho4 file1.krn file2.krn file3.krn
    cat file.krn | humecho4
    humecho4

The last command will cause the shell to wait while you type in the
input to humecho4, followed by control-D to indicate the end of input
data.

Note that the number of command-line arguments (other than options) can
be queried from an Options variable by using the .getArgCount()
function. If there are three filenames as in "echo4 file1.krn file2.krn
file3.krn", then .getArgCount() will return 3. The .getArg() function
will return a string for the specified argument, starting with argument
1: .getArg(1) == file1.krn, .getArg(2) == file2.krn, .getArg(3) ==
file3.krn. Note that the first argument is not .getArg(0). If you want
to access the command name, then use .getCommand(), which would return
"humecho4" in this case.

When reading from standard input use HumdrumFile::read(istream) rather
than HumdrumFile::read(const char\*). For example, reading from standard
input is done with hfile.read(cin) in the above code.



HumdrumStream class
-------------------

Input data from multiple files can be managed by the HumdrumStream
class. This class also manages multiple independent sequences of data,
such as movements, in a data file which the HumdrumFile class will not
process.

.. code:: cpp

    #include "humdrum.h"
    using namespace std;
    int main(int argc, char** argv) {
       Options options(argc, argv);
       options.process();
       HumdrumStream streamer(options.getArgList());
       HumdrumFile hfile;
       while (streamer.read(hfile)) {
          cout << hfile;
       }
       return 0;
    }


HumdrumFileSet class
--------------------

The HumdrumFileSet class functions in a similar manner to the
HumdrumStream class. It reads in multiple segments of Humdrum data from
a single physical file, multiple files, or standard input. The main
difference compared to HumdrumStream is that HumdrumFileSet retains the
contents of all input segments in memory.

Here is a basic processing example which demonstrates how to store all
input arguments into HumdrumFileSet. In this case the
HumdrumFileSet::read() function is used to extract a list of arguments
from the options variable. If the options variable does not contain any
filenames, standard input will be read:

.. code:: cpp

    #include "humdrum.h"
    using namespace std;
    int main(int argc, char** argv) {
       Options options(argc, argv);
       options.process();
       HumdrumFileSet infiles;
       infiles.read(options);
       for (int i=0; i<infiles.getCount(); i++) {
          cout << infiles[i];
       }
       return 0;
    }


C string comparison functions
-----------------------------

Here are three of the string comparison functions available within in
the C (or C++) language:

.. raw:: html

	<dl>
	<dt>
	strcmp("string1", "string2")
	<dd>
	returns 0 if strings are equivalent<br>
	returns –1 if string1 is alphabetized before string2<br>
	returns +1 if string1 is alphabetized after string2.
	<dt>
	strncmp("string1", "string2", n)
	<dd>
	compare only first n characters of the two strings.
	<dt>
	strchr("string", 'character')
	<dd>
	returns a pointer to the first occurrence of the character within the
	string. If the character is not found in the string, returns a NULL
	pointer.
	</dl>

Other interesting string processing functions in the C language are
``strstr`` which is similar to ``strchr`` but search for a sub-string
within the a string; and ``strrchr`` which is similar to ``strchr`` but
searches for the character in the reverse direction in the string, which
returns the last occurrence of the character in the string (or NULL) if
the character is not in the string. For more description about these
functions, type "man strrchr" in a terminal for more information about
the strrchr function (or any other standard C fuction).



Third dimension of data access (Note-level access)
--------------------------------------------------

Accessing individual notes in |kern| data spines requires three
dimensions of indexing: (1) the data line of the note, the data field on
the line for the note, and then the note number within a chord for the
note. Previous program examples demonstrated how to access lines and
line-fields. The following program (``noteloc``) goes one step further
to access individual |kern| notes. The program takes any sort of
Humdrum file, and then outputs a list of all notes found in all kern
spines:

.. code:: cpp

    #include "humdrum.h"
    int main(int argc, char** argv) {
       Options options(argc, argv);
       options.process();
       HumdrumFile hfile;
       hfile.read(options.getArg(1));
       char buffer[1024] = {0};
       for (int i=0; i<hfile.getNumLines(); i++) {
          if (!hfile[i].isData()) continue; // ignore non-data lines
          for (int j=0; j<hfile[i].getFieldCount(); j++) {
             if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
             if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
             int count = hfile[i].getTokenCount(j);
             for (int k=0; k<count; k++) {
                cout << "(" << i+1 <<"," << j+1 << "," << k+1 << ")\t"
                     << hfile[i].getToken(buffer, j, k) << endl;
             } 
          }
       }
       return 0;
    }


The line:

.. code:: cpp

    if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;

is used to skip over all spines which do not have |kern| data. The
function .getExInterp() returns a const char\* string for the name of
the exclusive interpretation. The strcmp() function compares the returns
exclusive interpretation name with the string "|kern|" and if it does
not match, the next data field on the line will be examined. An
equivalent way of identifying the exclusive interpretation can be done
with the .isExInterp() function. The following line of code is
equivalent to the one above:

.. code:: cpp

    if (hfile[i].isExInterp(j, "**kern")) continue;


Input and output to/from the program:

.. raw:: html

	<table style="background:white;">
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern	**text	**kern
	4C	ig-	4c
	4D 4E	-no-	.
	4F	-red	.
	.	.	4d 4e
	4r	.	.
	4G 4A 4B	text	.
	*-	*-	*-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: text

	(2,1,1) 4C
	(2,3,1) 4c
	(3,1,1) 4D
	(3,1,2) 4E
	(4,1,1) 4F
	(5,3,1) 4d
	(5,3,2) 4e
	(6,1,1) 4r
	(7,1,1) 4G
	(7,1,2) 4A
	(7,1,3) 4B

.. raw:: html

	</td>
	</tr>
	</table>

Each of the three numbers before the note indicates the address within
the file for the note, with the first number being the line on which the
note occurs, the second number the field on the line which contains the
note, and the last number is the note number within the (possible) chord
for the note.

kerninfo.cpp (Count |kern| notes in data)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is an example program which somewhat emulates the "census -k"
command from the Humdrum Toolkit. The program will count the number of
note attacks, rests and tied notes in one or more Humdrum files.

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   int restcount   = 0;
	   int nullcount   = 0;
	   int attackcount = 0;
	   int tiedcount   = 0;
	   int chordcount  = 0;
	   for (int arg=1; arg <= options.getArgCount() || arg == 0; arg++) {
	      if (options.getArgCount() == 0) {  hfile.read(cin); } 
	      else { hfile.read(options.getArg(arg)); }
	      char buffer[1024] = {0};
	      for (int i=0; i<hfile.getNumLines(); i++) {
	         if (!hfile[i].isData()) continue;
	         for (int j=0; j<hfile[i].getFieldCount(); j++) {
	            if (!hfile[i].isExInterp(j, "**kern")) continue;
	            int count = hfile[i].getTokenCount(j);
	            if (count > 1) chordcount++;
	            for (int k=0; k<count; k++) {
	               hfile[i].getToken(buffer, j, k);
	               if (strchr(buffer, 'r') != NULL)   { restcount++; } 
	               else if (strcmp(buffer, ".") == 0) { nullcount++; } 
	               else if (strchr(buffer, '_') != NULL) { /* ignore */ }
	               else if (strchr(buffer, ']') != NULL) { tiedcount++; } 
	               else { attackcount++; }
	            }
	         }   
	      }
	   }
	   cout << "Note attacks: " << attackcount << endl;   
	   cout << "Tied notes  : " << tiedcount   << endl;
	   cout << "Chords      : " << chordcount  << endl;   
	   cout << "Rests       : " << restcount   << endl;
	   cout << "Null Tokens : " << nullcount   << endl;   
	   return 0;
	}

Trying out the kerninfo prorgram on this input data:

.. code:: humdrum

	**kern	**text	**kern
	4C	ig-	4c
	4D 4E	-no-	.
	4F	-red	.
	.	.	4d 4e
	4r	.	.
	4G 4A 4B	text	.
	*-	*-	*-

Results in these statistics:

::

	Note attacks: 10
	Tied notes  : 0
	Chords      : 3
	Rests       : 1
	Null Tokens : 5

Trying out the ``kerninfo`` program on a real piece of music:

``kerninfo h://wtc/wtc1p04.krn``

::

    Note attacks: 675
    Tied notes  : 85
    Chords      : 14
    Rests       : 69
    Null Tokens : 967


Convert class
-------------

In addition to the Options class, and important helper class in Humdrum
Extras is the Convert class. This class handles most conversions between
data types. The HumdrumFile class essentially stores a two-dimensional
array of strings. The |kern| notes in a HumdrumFile variable are
extracted as strings, but will need to be interpreted further depending
on the information about the note which you need. For example, to
convert a |kern| note into a MIDI note number, use the following
Convert function:

``  Convert::kernToMidiNoteNumber("4d-")          →  61``

Likewise, the MIDI note 61 can be converted back into a |kern| note:

``  Convert::midiNoteNumberToKern(buffer, 61)     →  "c#"``

All access to Convert class functions is done statically, so you can
shorten the code by using the a typedef for Convert to a shorter name:

::
	typedef Convert C;
	C::kernToMidiNoteNumber("4d-");


Convert |kern| note names to MIDI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following program will convert the first note of every chord into a
MIDI note number.

.. code:: cpp

	#include "humdrum.h"
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile(options.getArg(1));
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue;
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	      if (hfile[i].isExInterp(j, "**kern")) continue;
	      if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	      if (strchr(hfile[i][j], 'r') != NULL) continue; // ignore rests
	         cout << hfile[i][j] << "\t" << Convert::kernToMidiNoteNumber(hfile[i][j]) << endl;
	      }
	   }
	   return 0;
	}

Example input and output:

.. raw:: html

	<table style="background:white;">
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern	**text	**kern
	4C	ig-	4c
	4D 4E	-no-	.
	4F	-red	.
	.	.	4d 4e
	4r	.	.
	4G 4A 4B	text	.
	*-	*-	*-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: text

	4C        48
	4c        60
	4D 4E     50
	4F        53
	4d 4e     62
	4G 4A 4B  55

.. raw:: html

	</td>
	</tr>
	</table>


Note that only the first kern note in the string will be extracted by
Convert::kernToMidiNoteNumber(). As an exercise, adjust the code so that
it prints a MIDI note number for every note in the chords.



Note Histogram (notehist.cpp)
-----------------------------

Here is an example of how to count the number of twelvetone pitch
classes in a Humdrum file. The following program will count tied notes.
As an exercise, have the program skip counting of any middle or end tied
notes (middle tied notes have an underscore (\_) in their content, and
ending tied notes has a closing square bracket (])).

.. code:: cpp

	#include "humdrum.h"
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   double histogram[12] = {0};
	   char buffer[1024] = {0};
	   int midikey;
	   int i;
	   for (i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue; // ignore non-data lines
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
	         if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	         int count = hfile[i].getTokenCount(j);
	         for (int k=0; k<count; k++) {
	            hfile[i].getToken(buffer, j, k);
	            if (strchr(buffer, 'r') != NULL) continue; // ignore rests
	            midikey = Convert::kernToMidiNoteNumber(buffer);
	            histogram[midikey % 12]++;
	         }
	      }
	   }
	   for (i=0; i<12; i++) {
	      std::cout << i << "\t" << histogram[i] << std::endl;
	   }
	   return 0;
	}

Example output when processing a real piece of music is given below. The
first output line means there are 600 C notes in Beethoven's 32nd
sonata, mvmt. 1, 233 Cs/Ds, etc.

``notehist h://beethoven/sonatas/sonata32-1.krn``

.. code:: text

	0   600 
	1   233
	2   279
	3   476
	4   146
	5   513
	6   144
	7   636
	8   459
	9   121
	10  259
	11  230

To sort the pitch classes by how often they occur:

``notehist h://beethoven/sonatas/sonata32-1.krn | sort -nrk2``

.. code:: text

	7   636
	0   600
	5   513
	3   476
	8   459
	2   279
	10  259
	1   233
	11  230 
	4   146
	6   144
	9   121

In this case the most common pitch class is G (7), and the least common
pitch class is A (9). Note that the sorting did not have to be
implemented in the C++ program, since the command-line program ``sort``
could be utilized. The options to sort are ``-n`` (sort numerically),
``-r`` (sort in reverse order so that the largest number comes first),
and ``-k2`` (sort by the second column of data).

Here is a modification of the program so that pitch names rather than
pitch-class numbers are displayed:

.. code:: cpp
	
	#include "humdrum.h"
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   double histogram[12] = {0};
	   char buffer[1024] = {0};
	   int midikey;
	   int i;
	   for (i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue; // ignore non-data lines
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
	         if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	         int count = hfile[i].getTokenCount(j);
	         for (int k=0; k<count; k++) {
	            hfile[i].getToken(buffer, j, k);
	            if (strchr(buffer, 'r') != NULL) continue; // ignore rests
	            midikey = Convert::kernToMidiNoteNumber(buffer);
	            histogram[midikey % 12]++;
	         }
	      }
	   }
	   for (i=0; i<12; i++) {
	      std::cout << i << "\t" 
	                << Convert::base12ToKern(buffer, histogram[i] + 4 * 12) << std::endl;
	   }
	   return 0;
	}

So now the note names will be printed instead of their numeric
equivalent:

``notehist h://beethoven/sonatas/sonata32-1.krn | sort -nrk2``

.. code:: text

	G   636
	C   600  
	F   513
	E-  476
	G#  459
	D   279
	B-  259
	C#  233  
	B   230 
	E   146
	F#  144 
	A   121

If you want to preserve the accidental spellings, then you can use
base-40 instead of base-12 (MIDI note numbers):

.. code:: cpp

	#include "humdrum.h"
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   double histogram[40] = {0};
	   char buffer[1024] = {0};
	   int base40;
	   int i;
	   for (i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue; // ignore non-data lines
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
	         if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	         int count = hfile[i].getTokenCount(j);
	         for (int k=0; k<count; k++) {
	            hfile[i].getToken(buffer, j, k);
	            if (strchr(buffer, 'r') != NULL) continue; // ignore rests
	            base40 = Convert::kernToBase40(buffer);
	            histogram[base40 % 40]++;
	         }
	      }
	   }
	   for (i=0; i<40; i++) {
	      if (histogram[i] == 0) { continue; }
	      std::cout << Convert::base40ToKern(buffer, i + 3*40) << "\t"
	                << histogram[i] << std::endl;
	   }
	   return 0;
	}


With the more verbose pitch information being:

``notehist h://beethoven/sonatas/sonata32-1.krn``

.. code:: text

	C-  32
	C   600
	C#  1
	D-  232
	D   271
	D#  1
	E-- 8
	E-  475
	E   134
	E#  2
	F-  12
	F   511
	F#  83
	G-  61
	G   636
	G#  2
	A-  457
	A   121
	B-  259
	B   198

`Standard Template Library <http://www.cplusplus.com/reference>`__
classes such as vector can be used instead of the C-like histogram array
used in the previous program. Here is an example using the vector class:

.. code:: cpp

	#include "humdrum.h"
	#include <vector>
	using namespace std;
	
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   vector<int> histogram(40);
	   char buffer[1024] = {0};
	   int base40;
	   unsigned int i;
	   for (i=0; i<(unsigned int)hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue; // ignore non-data lines
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
	         if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	         int count = hfile[i].getTokenCount(j);
	         for (int k=0; k<count; k++) {
	            hfile[i].getToken(buffer, j, k);
	            if (strchr(buffer, 'r') != NULL) continue; // ignore rests
	            base40 = Convert::kernToBase40(buffer);
	            histogram[base40 % 40]++;
	         }
	      }
	   }
	   for (i=0; i<histogram.size(); i++) {
	      if (histogram[i] == 0) { continue; }
	      cout << Convert::base40ToKern(buffer, i + 3*40) << "\t"
	                << histogram[i] << endl;
	   }
	   return 0;
	}


In addition, Humdrum Extras has an Array class which has a similar
functionality as the vector class or C arrays:

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   Array<int> histogram(40);
	   histogram.setAll(0);
	   char buffer[1024] = {0};
	   int base40;
	   int i;
	   for (i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue; // ignore non-data lines
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
	         if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	         int count = hfile[i].getTokenCount(j);
	         for (int k=0; k<count; k++) {
	            hfile[i].getToken(buffer, j, k);
	            if (strchr(buffer, 'r') != NULL) continue; // ignore rests
	            base40 = Convert::kernToBase40(buffer);
	            histogram[base40 % 40]++;
	         }
	      }
	   }
	   for (i=0; i<histogram.getSize(); i++) {
	      if (histogram[i] == 0) { continue; }
	      cout << Convert::base40ToKern(buffer, i + 3*40) << "\t"
	                << histogram[i] << endl;
	   }
	   return 0;
	}

Duration-weighted note histogram
--------------------------------

Often it is useful to know how long a certain pitch class sounds in a
musical work rather than just how many note attacks for each pitch
class. Here is a program which measures the duration of each pitch class
in the music:

.. code:: cpp

	#include "humdrum.h"
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   Array<double> histogram(12);
	   histogram.setAll(0);
	   histogram.allowGrowth(0);
	   char buffer[1024] = {0};
	   double duration;
	   int midikey;
	   int i;
	   for (i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue; // ignore non-data lines
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if (strcmp("**kern", hfile[i].getExInterp(j)) != 0) continue;
	         if (strcmp(".", hfile[i][j]) == 0) continue; // ignore null tokens
	         int count = hfile[i].getTokenCount(j);
	         for (int k=0; k<count; k++) {
	            hfile[i].getToken(buffer, j, k);
	            if (strchr(buffer, 'r') != NULL) continue; // ignore rests
	            midikey = Convert::kernToMidiNoteNumber(buffer);
	            duration = Convert::kernToDuration(buffer);
	            histogram[midikey % 12] += duration;
	         }
	      }
	   }
	   for (i=0; i<histogram.getSize(); i++) {
	      std::cout << Convert::base12ToKern(buffer, i+4*12) << "\t"
	                << histogram[i] << std::endl;
	   }
	   return 0;
	}

Now the program will output the duration in quarter notes for each pitch
class in the music:

.. code:: text

	C   319.556
	C#  98.6833 
	D   137.644
	E-  208.4
	E   84.1444
	F   225.158
	F#  75.5278
	G   308.772
	G#  203.953
	A   61.2111
	B-  121.267
	B   125.767



Rhythm parsing
--------------

Humdrum files containing |kern| data can be rhythmically parsed using
the HumdrumFile::analyzeRhythm() function. The |kern| data is expected
to contain rhythmic data which is consistent with the layout of the
music on each line in the file. This function will store rhythmic
information for each line in the file, such as the current beat in the
measure, the number of beats since the start of the file, and the
duration of each line (composite rhythm).

Absolute beat
~~~~~~~~~~~~~

The HumdrumRecord::getAbsBeat() function returns the number of quarter
notes (by default) from the beginning of the file to the current line.
Below is an example program which prints the "absolute beat" data for
each line of a Humdrum file. Note that lines of any type (data,
comments, interpretations) can be queried for their position in the
score. In this example the argument "4" is given to .analyzeRhythm().
This means to use the quarter note as the basis for calculating rhythmic
values for the score.

.. code:: cpp

	#include "humdrum.h"
	
	void printRhythm(HumdrumFile& infile) {
	   for (int i=0; i<infile.getNumLines(); i++) {
	      cout << infile[i].getAbsBeat() << '\t' << infile[i] << '\n';
	   }
	}
	
	void processFile(HumdrumFile& infile) {
	   infile.analyzeRhythm("4");
	   printRhythm(infile);
	}
	
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   HumdrumFileSet infiles;
	   options.process();
	   infiles.read(options);
	
	   for (int i=0; i<infiles.getCount(); i++) {
	      processFile(infiles[i]);
	      if (i<infiles.getCount() - 1) {
	         cout << '\n';
	      }
	   }
	
	   return 0;
	};


Here is example input/output from the above program. Each line in the
output starts with the "absolute beat" value for the line, followed by
the input line. Note that the example input contains two measures of 4/4
meter, so the total duration of the score is 8 quarter notes. This
matches to the "absolute beat" position of the last line in the file.

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern
	*M4/4
	=1-
	4c
	4.d
	8e
	8fL
	8gJ
	=2
	12aL
	12b
	12ccJ
	20dd
	10ee
	20dd
	10ee
	20dd
	10ee
	20dd
	4cc
	==
	*-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	0   **kern
	0   *M4/4
	0   =1-
	0   4c
	1   4.d
	2.5 8e
	3   8fL
	3.5 8gJ
	4   =2
	4   12aL
	4.33333 12b
	4.66667 12ccJ
	5   20dd
	5.2 10ee
	5.6 20dd
	5.8 10ee
	6.2 20dd
	6.4 10ee
	6.8 20dd
	7   4cc
	8   ==
	8   *-

.. raw:: html

	</td>
	</tr>
	</table>


In the above example program, absolute beat positions for each line were
printed as floating-point numbers. Notice that for the triplet eighth
notes starting in measure 2, round-off error occurs in 10\ :sup:`-5`
decimal place. If you require rhythmic information with no round-ff
error, use the .getAbsBeatR() function rather than .getAbsBeat(). The
"R" stands for "Rational number". The return value from "R" versions of
rhythm functions return a data type called RationalNumber which can
represent fractional values. A triplet eighth is exactly 1/3 of a
quarter note which is approximated by the floating-point value 0.33333.
The RationalNumber class handles such fractions by storing the numerator
and denominator as separate integer values to avoid introducing
round-off error.

Try replacing the printRhythm() function in the above example with this
one which substitutes .getAbsBeat() with .getAbsBeatR():

.. code:: cpp

    void printRhythm(HumdrumFile& infile) {
       for (int i=0; i<infile.getNumLines(); i++) {
          cout << infile[i].getAbsBeatR() << '\t' << infile[i] << '\n';
       }
    }

Now the output of the program describes the rhythms in terms of
fractions rather than floating-point values:

.. raw:: html
	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern
	*M4/4
	=1-
	4c
	4.d
	8e
	8fL
	8gJ
	=2
	12aL
	12b
	12ccJ
	20dd
	10ee
	20dd
	10ee
	20dd
	10ee
	20dd
	4cc
	==
	*-

.. raw:: html

	</td>
	<td width=40>
	</td>
<td>

.. code:: humdrum

	0   **kern
	0   *M4/4
	0   =1-
	0   4c
	1   4.d
	5/2 8e
	3   8fL
	7/2 8gJ
	4   =2
	4   12aL
	13/3    12b
	14/3    12ccJ
	5   20dd
	26/5    10ee
	28/5    20dd
	29/5    10ee
	31/5    20dd
	32/5    10ee
	34/5    20dd
	7   4cc
	8   ==
	8   *-

.. raw:: html

	</td>
	</tr>
	</table>

This is now quite readable, so printing and integer plus a fractional
remainder for each absolute beat position would be more convenient:

.. code:: cpp

    void printRhythm(HumdrumFile& infile) {
       RationalNumber absbeat;
       for (int i=0; i<infile.getNumLines(); i++) {
          absbeat = infile[i].getAbsBeatR();
          absbeat.printTwoPart(cout);
          cout << '\t' << infile[i] << '\n';
       }
    }


Now the output is more readable with numbers such as 31/5 replaced with
6+1/5:

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern
	*M4/4
	=1-
	4c
	4.d
	8e
	8fL
	8gJ
	=2
	12aL
	12b
	12ccJ
	20dd
	10ee
	20dd
	10ee
	20dd
	10ee
	20dd
	4cc
	==
	*-

.. raw:: html

   </td>
   <td width=40>
   </td>
   <td>

.. code:: humdrum

	0   **kern
	0   *M4/4
	0   =1-
	0   4c
	1   4.d
	2+1/2   8e
	3   8fL
	3+1/2   8gJ
	4   =2
	4   12aL
	4+1/3   12b
	4+2/3   12ccJ
	5   20dd
	5+1/5   10ee
	5+3/5   20dd
	5+4/5   10ee
	6+1/5   20dd
	6+2/5   10ee
	6+4/5   20dd
	7   4cc
	8   ==
	8   *-

.. raw:: html

	</td>
	</tr>
	</table>


Line duration
~~~~~~~~~~~~~

The line duration, or composite rhythm, of a Humdrum file can be
extracted from the rhythmic analysis results by using the
HumdrumRecord::getDuration() and getDurationR() functions. The
getDuration() function returns a double float, while getDurationR()
returns a RationalNumber type. The floating point version will contain
round-off errors while the RationalNumber type will not, so you can use
the different methods depending on your particular application
requirements. Floating point values can also be extracted from
RationalNumber types with the RationalNumber::getFloat() function.

Here is an example program which prints the duration of each line in a
Humdrum file:

.. code:: cpp

	#include "humdrum.h"
	
	void printRhythm(HumdrumFile& infile) {
	   RationalNumber linedur;
	   for (int i=0; i<infile.getNumLines(); i++) {
	      linedur = infile[i].getDurationR();
	      linedur.printTwoPart(cout);
	      cout << '\t' << infile[i] << '\n';
	   }
	}
	
	void processFile(HumdrumFile& infile) {
	   infile.analyzeRhythm("4");
	   printRhythm(infile);
	}
	
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   HumdrumFileSet infiles;
	   options.process();
	   infiles.read(options);
	
	   for (int i=0; i<infiles.getCount(); i++) {
	      processFile(infiles[i]);
	      if (i<infiles.getCount() - 1) {
	         cout << '\n';
	      }
	   }
	
	   return 0;
	}

This program outputs the duration of each line in quarter-note units:

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern  **kern
	*M3/4   *M3/4
	=-  =-
	2c  2cc
	8d  12dd
	.   12ee
	8e  .
	.   12ff
	=2  =2
	12f 8gg
	12g .
	.   8aa
	12a .
	2b  2bb
	==  ==
	*-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	0   **kern  **kern
	0   *M3/4   *M3/4
	0   =-  =-
	2   2c  2cc
	1/3 8d  12dd
	1/6 .   12ee
	1/6 8e  .
	1/3 .   12ff
	0   =2  =2
	1/3 12f 8gg
	1/6 12g .
	1/6 .   8aa
	1/3 12a .
	2   2b  2bb
	0   ==  ==
	0   *-  *-

.. raw:: html

	</td>
	</tr>
	</table>

Notice that non-data lines are assigned a duration of 0. Also note that
the line ". 12ee" has a line duration of 1/6th of a quarter note. This
is smaller than the rhythm 12 which is 1/3 of a quarter note due to the
8th note in the first column having its duration split across two lines.

If you want the durations to represent \*\*recip Humdrum data (|kern|
rhythm values), then either divide the RationalValue duration by 4, or
use whole notes when analyzing the rhythmic structure of the file with
.analyzeRhythm("1") instead of using "4" as its argument.

Here is an example program which calculates the composite rhythm of the
file and prepends a \*\*recip spine to the original data:

.. code:: cpp

	#include "humdrum.h"
	
	void processFile(HumdrumFile& infile) {
	   infile.analyzeRhythm("4");
	   RationalNumber linedur;
	   for (int i=0; i<infile.getNumLines(); i++) {
	      if (infile[i].isData()) {
	         linedur = infile[i].getDurationR();
	         cout << linedur << '\t';
	         linedur /= 4;
	         linedur.printRecip(cout);
	         cout << '\t' << infile[i] << '\n';
	      } else if (infile[i].isMeasure()) {
	         cout << infile[i][0] << '\t' <<infile[i][0];
	         cout << '\t' << infile[i] << '\n';
	      } else if (strncmp(infile[i][0], "**", 2) == 0) {
	         cout << "**dur\t**recip\t" << infile[i] << '\n';
	      } else if (strcmp(infile[i][0], "*-") == 0) {
	         cout << "*-\t*-\t" << infile[i] << '\n';
	      } else if (infile[i].isInterpretation()) {
	         cout << "*\t*" << '\t' << infile[i] << '\n';
	      } else if (infile[i].isLocalComment()) {
	         cout << "!\t!" << '\t' << infile[i] << '\n';
	      } else {
	         cout << infile[i] << '\n';
	      }
	   }
	}
	
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   HumdrumFileSet infiles;
	   options.process();
	   infiles.read(options);
	
	   for (int i=0; i<infiles.getCount(); i++) {
	      processFile(infiles[i]);
	      if (i<infiles.getCount() - 1) {
	         cout << '\n';
	      }
	   }
	
	   return 0;
	}

Here is the input and output for the composite rhythm program listed
above. The HumdrumRecord::getDurationR() information was printed in the
first column. The second column gives the Humdrum \*\*recip
representation of the duration as a |kern| rhythmic value. The
|recip| value is the inverse of the duration, multiplied by 4 in this
case to represent inverse divisions of whole notes rather than quarter
notes.

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**kern  **kern
	*M3/4   *M3/4
	=-  =-
	2c  2cc
	8d  12dd
	.   12ee
	8e  .
	.   12ff
	=2  =2
	12f 8gg
	12g .
	.   8aa
	12a .
	2b  2bb
	==  ==
	*-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**dur   **recip **kern  **kern
	*   *   *M3/4   *M3/4
	=-  =-  =-  =-
	2   2   2c  2cc
	1/3 12  8d  12dd
	1/6 24  .   12ee
	1/6 24  8e  .
	1/3 12  .   12ff
	=2  =2  =2  =2
	1/3 12  12f 8gg
	1/6 24  12g .
	1/6 24  .   8aa
	1/3 12  12a .
	2   2   2b  2bb
	==  ==  ==  ==
	*-  *-  *-  *-

.. raw:: html

	</td>
	</tr>
	</table>


Line field enumeration by spine
-------------------------------

The HumdrumRecord::getFieldCount() function returns the number of tokens
on each Humdrum line, and each of these fields is accessed by an index
number up to this count. However, if you want to access data by spine
number (or to be clear primary spine number), you have to use a
different method. The field number and spine number do not always match
because spines can split into subspines which will increase the field
count on a line.

To access data by spine, use the HumdrumRecord::getPrimaryTrack()
function. This function returns an integer value for the current spine,
enumerated from one (sorry). Multiple fields can have the same primary
track number, which is caused by a spine split in the data.

Here is a program which prints the primary track for each data token in
a Humdrum file structure:

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) {
	         cout << hfile[i] << endl;
	         continue;
	      }
	      cout << hfile[i].getPrimaryTrack(0);
	      for (int j=1; j<hfile[i].getFieldCount(); j++) {
	         cout << '\t' << hfile[i].getPrimaryTrack(j);
	      }
	      cout << endl;
	   }
	   return 0;
	}

And here is example input and output:

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**a **b **c
	.   .   .
	.   .   .
	*   *^  *^
	.   .   .   .   .
	.   .   .   .   .
	*   *v  *v  *   *
	*   *   *v  *v
	.   .   .
	.   .   .
	*-  *-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b **c
	1   2   3
	1   2   3
	*   *^  *^
	1   2   2   3   3
	1   2   2   3   3
	*   *v  *v  *   *
	*   *   *v  *v
	1   2   3
	1   2   3
	*-  *-  *-

.. raw:: html

	</td>
	</tr>
	</table>


Notice that the input data contains three exclusive interpretations.
This will mean that there are three primary tracks (or spines) in the
data. In the output you can see the numbers for each track: 1, 2, and 3.
The HumdrumRecord::getMaxTrack() function can be called to find out what
the maximum track number is (3 in this case).

The primary track value is an integer. If you also want to see the
subtrack information, use .getTrack() instead of .getPrimaryTrack(). The
.getTrack() function will have the primary track in the integer portion
of a double float, and the enumerated subtrack in the fractional value.
The subtrack value uses the first three digits of the fraction, so you
can extract the subtrack by removing the integer part of the number and
multiplying by 1000. Note that the subtrack enumeration starts at 0,
while the primary tracks are enumerated from 1 (sorry again).

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) {
	         cout << hfile[i] << endl;
	         continue;
	      }
	      cout << hfile[i].getPrimaryTrack(0);
	      for (int j=1; j<hfile[i].getFieldCount(); j++) {
	         cout << '\t' << hfile[i].getTrack(j);
	      }
	      cout << endl;
	   }
	   return 0;
	}
	

.. raw:: html

           <table style="background:white;" cellpadding=0 cellspacing=0>
           <tr valign=top>
           <td>

.. code:: humdrum

	**a **b **c
	.   .   .
	.   .   .
	*   *^  *^
	.   .   .   .   .
	.   .   .   .   .
	*   *v  *v  *   *
	*   *   *v  *v
	.   .   .
	.   .   .
	*-  *-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b **c
	1   2   3
	1   2   3
	*   *^  *^
	1   2   2.001   3   3.001
	1   2   2.001   3   3.001
	*   *v  *v  *   *
	*   *   *v  *v
	1   2   3
	1   2   3
	*-  *-  *-

.. raw:: html

	</td>
	</tr>
	</table>

Even more detail about track information can be accessed with the
.getSpineInfo() function. This function returns the internally stored
string which keeps track of how the spine/subspine was manipulated on
previous lines of the data.

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	int main(int argc, char** argv) {
	   Options options(argc, argv);
	   options.process();
	   HumdrumFile hfile;
	   hfile.read(options.getArg(1));
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) {
	         cout << hfile[i] << endl;
	         continue;
	      }
	      cout << hfile[i].getPrimaryTrack(0);
	      for (int j=1; j<hfile[i].getFieldCount(); j++) {
	         cout << '\t' << hfile[i].getSpineInfo(j);
	      }
	      cout << endl;
	   }
	   return 0;
	}


.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**a **b **c
	.   .   .
	.   .   .
	*   *^  *^
	.   .   .   .   .
	.   .   .   .   .
	*   *v  *v  *   *
	*   *   *v  *v
	.   .   .
	.   .   .
	*-  *-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b **c
	1   2   3
	1   2   3
	*   *^  *^
	1   (2)a    (2)b    (3)a    (3)b
	1   (2)a    (2)b    (3)a    (3)b
	*   *v  *v  *   *
	*   *   *v  *v
	1   2   3
	1   2   3
	*-  *-  *-

.. raw:: html

	</td>
	</tr>
	</table>


In this case the spine info ``(2)a`` means that that token is in
primary spine 2, but the spine was split once, and this subtrack is the
left-hand subspine coming out of the split. The .getPrimaryTrack()
function returns the first number in the .getSpineInfo() string.

Here is a more complex spine manipulation:

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**a **b **c
	.   .   .
	*   *^  *^
	.   .   .   .   .
	*   *   *^  *   *
	.   .   .   .   .   .
	*   *   *v  *v  *   *
	*   *v  *v  *   *
	.   .   .   .
	*   *   *v  *v
	.   .   .
	*-  *-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b **c
	1   2   3
	*   *^  *^
	1   (2)a    (2)b    (3)a    (3)b
	*   *   *^  *   *
	1   (2)a    ((2)b)a ((2)b)b (3)a    (3)b
	*   *   *v  *v  *   *
	*   *v  *v  *   *
	1   2   (3)a    (3)b
	*   *   *v  *v
	1   2   3
	*-  *-  *-

.. raw:: html

	</td>
	</tr>
	</table>


Spine manipulator examples
~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is an example of spine splits (``*v``) and joins (``*v``):

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**a **b **c
	.   .   .
	*   *^  *
	.   .   .   .
	*   *   *^  *
	.   .   .   .   .
	*   *v  *v  *v  *
	.   .   .
	*-  *-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b **c
	1   2   3
	*   *^  *
	1   (2)a    (2)b    3
	*   *   *^  *
	1   (2)a    ((2)b)a ((2)b)b 3
	*   *v  *v  *v  *
	1   2   3
	*-  *-  *-

.. raw:: html

	</td>
	</tr>
	</table>


Here is an example of spine additions (``*+``) and terminations
(``*-``):

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**a **b
	.   .
	*
	*+  **c
	.   .   .
	*   *-  *
	.   .
	*-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b
	1   2
	*   *+  **c
	1   2   3
	*   *-  *
	1   3
	*-  *-

.. raw:: html

	</td>
	</tr>
	</table>


Here is an example of spine exchanges (``*x``):

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

	**a **b
	.   .
	.   .
	*x  *x
	.   .
	.   .
	*-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a **b
	1   2
	1   2
	*x  *x
	2   1
	2   1
	*-  *-

.. raw:: html

	</td>
	</tr>
	</table>


And finally a complex example using all of the spine manipulators:

.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr valign=top>
	<td>

.. code:: humdrum

**a **b
.   .
*   *^
.   .   .
*+  **c *
.   .   .   .
*   *   *x  *x
.   .   .   .
*   *   *^  *
.   .   .   .   .
*   *+  **d *   *
.   .   .   .   .   .
*   *   *   *   *x  *x
.   .   .   .   .   .
*   *-  *   *   *   *
.   .   .   .   .
*v  *v  *   *   *
.   .   .   .
*   *v  *v  *
.   .   .
*   *v  *v
.   .
*-  *-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**a     **b
	1       2
	*       *^
	1       (2)a    (2)b
	*+      **c     *
	1       3       (2)a    (2)b
	*       *       *x      *x
	1       3       (2)b    (2)a
	*       *       *^      *
	1       3       ((2)b)a ((2)b)b (2)a
	*       *+      **d     *       *
	1       3       4       ((2)b)a ((2)b)b (2)a
	*       *       *       *       *x      *x
	1       3       4       ((2)b)a (2)a    ((2)b)b
	*       *-      *       *       *       *
	1       4       ((2)b)a (2)a    ((2)b)b
	*v      *v      *       *       *
	1       4       ((2)b)a (2)a    ((2)b)b
	*       *v      *v      *
	1       4       ((2)b)a (2)a    ((2)b)b
	*       *v      *v
	1       4       2
	*-      *-

.. raw:: html

	</td>
	</tr>
	</table>


myextract.cpp
~~~~~~~~~~~~~

Now that you know how to extract information about spines and subspines,
you can write your own version of the Humdrum Toolkit's extract program.
It will be even more powerful than the extract program, since the
extract program cannot deal with subspines without special processing.
Here is the ``myextract`` code:

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	
	void extract(HumdrumFile& hfile, int primarytrack) {
	   int i, j, fcount, pcount;
	   for (i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].hasSpines()) {
	         cout << hfile[i] << endl;
	         continue;
	      }
	      fcount = hfile[i].getFieldCount();
	      pcount = 0;
	      for (j=0; j<fcount; j++) {
	         if (primarytrack == hfile[i].getPrimaryTrack(j)) {
	            if (pcount++ > 0) cout << '\t';
	            cout << hfile[i][j];
	         }
	      }
	      if (pcount > 0) cout << endl;
	   }
	}
	
	int main (int argc, char** argv) {
	   Options opts;
	   opts.define("t|track=i:1", "extract specified track");
	   opts.process(argc, argv);
	   int primarytrack = opts.getInteger("track");
	   int numinputs = opts.getArgCount();
	   HumdrumFile hfile;
	   for (int i=1; i<=numinputs || i==0; i++) {
	      if (numinputs < 1) { hfile.read(std::cin); }
	      else { hfile.read(opts.getArg(i)); }
	      extract(hfile, primarytrack);
	   }
	   return 0;
	}


.. raw:: html

	<table style="background:white;" cellpadding=0 cellspacing=0>
	<tr>
	<td>
	input
	</td>
	<td colspan=2>
	<center>

``myextract -t 2``

.. raw:: html

   </center>

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   <tr valign=top>

.. raw:: html

   <td>

.. code:: humdrum

    **a **b **c
    a   b   c
    *   *^  *
    a   b1  b2  c
    *   *v  *v  *
    a   b   c
    *-  *-  *-

.. raw:: html

   </td>

.. raw:: html

   <td width=145>

.. raw:: html

   </td>

.. raw:: html

   <td>

.. code:: humdrum

    **b
    b
    *^
    b1  b2
    *v  *v
    b
    *-

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </table>


Notice that all of the "B" information which was in spine 2 was
extracted from the input data.

Regular Expressions
-------------------

Regular expressions are an important concept to understand when working
with Humdrum data, since the data format was designed to take advantage
of them.

GNU POSIX regular expressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Different Operating systems have different C implementations of regular
expressions. Here is an example of how to use them on most linux
operating systems using the GNU POSIX regular expressions:

.. code:: c

	#include <regex.h>
	#include <stdlib.h>
	#include <stdio.h>
	using namespace std;
	int main(int argc, char** argv) {
   	if (argc < 3) exit(1);
   	const char *searchstring = argv[1];
   	const char *datastring = argv[2];
   	regex_t re;
   	int flags = 0 | REG_EXTENDED | REG_ICASE;
   	int status = regcomp(&re, searchstring, flags);
   	if (status !=0) {
      	char errstring[999];
      	regerror(status, &re, errstring, 999);
      	printf("%s\n", errstring);
      	exit(1);
   	}
   	status = regexec(&re, datastring, 0, NULL, 0);
   	if (status == 0) printf("Match Found\n");
   	else printf("Match Not Found\n");
   	return 0;
	}


Example behavior of the program:

.. code:: text

    search cat "cat in the hat"
    Match Found
       
    search dog "cat in the hat"
    Match Not Found


For the simple examples above the strstr() C library function could have
been used (which would probably also run faster). But using regular
expressions allows for more powerful generalized searching, such as
looking for upper and lower case matches:


.. code:: text

    search cat "Cat in the hat"
    Match Found


In this case "cat" was matched to "Cat" since the REG\_ICASE flag was
used to ignore difference between upper and lower letter cases. The
REG\_EXTENDED flag is for using extended regular expressions (regular
expressions 2.0). The regexec() function returns 0 if a match was found,
otherwise returns a non-zero value to indicate no match was found.

mysed.c (Search and replace)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following program demonstrates how to do search and replace on
strings with GNU POSIX regular expressions.

.. code:: c

	#include <regex.h>
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	int main(int argc, char** argv) {
	   if (argc < 4) exit(1);
	   char buffer[1024] = {0};
	   const char *searchstring = argv[1];
	   const char *replacestring = argv[2];
	   const char *datastring = argv[3];
	   regex_t re;
	   regmatch_t match;
	   int compflags = 0 | REG_EXTENDED | REG_ICASE;
	   int status = regcomp(&re, searchstring, compflags);
	   if (status !=0) {
	      regerror(status, &re, buffer, 1024);
	      printf("%s\n", buffer);
	      exit(1);
	   }
	   status = regexec(&re, datastring, 1, &match , 0);
	   while (status == 0) {
	      strncat(buffer, datastring, match.rm_so);
	      strcat(buffer, replacestring);
	      datastring += match.rm_eo;
	      status = regexec(&re, datastring, 1, &match, REG_NOTBOL);
	   }
	   printf("%s%s\n", buffer, datastring);
	   return 0;
	}


Example use:

.. code:: text

    mysed klm 000 abcdefghijklmnopqrstuvwxyz
    abcdefghij000nopqrstuvwxyz


Perl Compatible Regular Expressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Humdrum Extras library includes the `Perl Compatible Regular
Expressions <http://www.pcre.org>`__ (PCRE) library which is more
portable than GNU POSIX regular expressions, and also more powerful as
it implements extensions to regular expressions which are present in the
Perl language. The Humdrum Extras library also includes a C++ wrapper
class for PCRE which allows for a simpler interface. Below are programs
similar to the GNU POSIX regular expressions found above.

.. code:: c

	#include "PerlRegularExpression.h"
	#include <iostream>
	using namespace std;
	
	int main(int argc, char** argv) {
	   if (argc < 3) exit(1);
	   const char *searchstring = argv[1];
	   const char *datastring = argv[2];
	   PerlRegularExpression pre;
	   if (pre.search(datastring, searchstring, "i")) {
	      cout << "Match Found" << endl;
	   } else {
	      cout << "Match Not Found" << endl;
	   }
	   return 0;
	}


The `PerlRegularExpression <http://extras.humdrum.org/download/humextra/include/PerlRegularExpression.h>`__
class definition must be included with ``PerlRegularExpression.h`` since
``humdrum.h`` or any of the files it includes does not depend on the
PerlRegularExpression class. The .search() function returns true if a
match was found, or false otherwise. When a match is found, the index
location of the string plus one is the return value. By default, a
PerlRegularExpression variable will use extended regular expressions,
and the ``"i"`` used as the third parameter in the .search() function is
used to set the ignore-case flag.

Example behavior of the program:

.. code:: text

    search cat "cat in the hat"
    Match Found
       
    search dog "cat in the hat"
    Match Not Found


mysed.cpp (Search and replace)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following program demonstrates how to do search and replace on
strings with the PerlRegularExpression class.

.. code:: c

	#include "PerlRegularExpression.h"
	#include <stdio.h>
	#include <string.h>
	
	int main(int argc, char** argv) {
	   if (argc < 4) exit(1);
	   const char *searchstring = argv[1];
	   const char *replacestring = argv[2];
	   Array<char> data;
	   data = argv[3];
	   PerlRegularExpression pre;
	   pre.sar(data, searchstring, replacestring, "gi");
	   cout << data << endl;
	   return 0;
	}


Example use:

::

    mysed klm 000 abcdefghijklmnopqrstuvwxyz
    abcdefghij000nopqrstuvwxyz


The .sar() function (or .searchAndReplace() as the long form) takes four
parameters: (1) the string to perform the replacement, (2) the search
string, (3) the replacement string, and (4) the regular expression
flags. In this case ``"gi"`` represents two flags: "``g``\ " for a
global replacement (not just the first match on the line) and "``i``\ "
as before which means to ignore case.

Editing a HumdrumFile
---------------------

When accessing the contents of a HumdrumFile/HumdrumReccords with [][]
operators, the value of each spine (or global commend/reference record)
is a ``const`` ``char*``. In order to change a value, use the
HumdrumRecord::setToken() fuction.

erase.cpp (Set all data fields to the null token)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is a program which uses .setToken() to change the contents of all
data fields into null tokens.

.. code:: cpp

	#include "humdrum.h"
	using namespace std;
	
	void setData(HumdrumFile& hfile, const char* replacement) {
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) { continue; }
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         hfile[i].setToken(j, replacement);
	      }
	   }
	}
	
	int main(int argc, char** argv) {
	   Options opts;
	   opts.process(argc, argv);
	   HumdrumFile hfile;
	   for (int i=1; i<=opts.getArgCount() || i == 0; i++) {
	      if (i == 0) { hfile.read(cin); }
	      else { hfile.read(opts.getArg(i)); }
	      setData(hfile, ".");
	      cout << hfile;
	   }
	   return 0;
	}


.. raw:: html

	<table style="background:white;">
	<tr valign=baseline>
	<td>

.. code:: humdrum

	**kern	**text	**kern
	4C	ig-	4c
	4D 4E	-no-	.
	4F	-red	.
	.	.	4d 4e
	4r	.	.
	4G 4A 4B	text	.
	*-	*-	*-

.. raw:: html

	</td>
	<td width=40>
	</td>
	<td>

.. code:: humdrum

	**kern	**text	**kern
	.	.	.
	.	.	.
	.	.	.
	.	.	.
	.	.	.
	.	.	.
	*-	*-	*-

.. raw:: html

	</td>
	</tr>
	</table>

transpose.cpp (Transpose music)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following example program processes each |kern| note by
transposing it by a base40 interval. The transposed note is reinserted
into the original HumdrumFile structure which is then printed to
standard output. The main() function is used to handle multiple input
files, transposeFile() is used to search through each file and pull out
notes to transpose, and transposeNote() is used to replace the original
pitch with the transposed version.

.. code:: cpp

	#include "humdrum.h"
	#include "PerlRegularExpression.h"
	using namespace std;
	
	int debugQ = 0;
	
	char* transposeNote(Array<char>& subtoken, int transpose) {
	   int base40 = Convert::kernToBase40(subtoken.getBase());
	   if (base40 <= 0) { return subtoken.getBase(); }
	   char newnote[1024] = {0};
	   Convert::base40ToKern(newnote, base40 + transpose);
	   if (debugQ) { cout << "!! transposing " << subtoken; }
	   PerlRegularExpression pre;
	   pre.sar(subtoken, "[a-g]+[-#n]*", newnote, "i");
	   if (debugQ) { cout << "\tto\t" << subtoken << endl; }
	   return subtoken.getBase();
	}
	
	HumdrumFile& transposeFile(HumdrumFile& hfile, int transpose) {
	   Array<char> subtoken;   // for extracting note from chord
	   char obuf[1024] = {0};  // output token buffer
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) { continue; }
	      for (int j=0; j<hfile[i].getFieldCount(); j++) {
	         if ((!hfile[i].isExInterp(j, "**kern")) ||
	               (strcmp(".", hfile[i][j]) == 0)) {
	            continue;
	         }
	         int tcount = hfile[i].getTokenCount(j);
	         strcpy(obuf, "");
	         for (int k=0; k<tcount; k++) {
	            hfile[i].getToken(subtoken, j, k);
	            if (k > 0) { strcat(obuf, " "); }
	            strcat(obuf, transposeNote(subtoken, transpose));
	         }
	         hfile[i].setToken(j, obuf);
	      }
	   }
	   return hfile;
	}
	
	int main(int argc, char** argv) {
	   Options opts;
	   opts.define("t|transpose=i:0", "transpose by base-40 interval");
	   opts.define("debug=b",         "print debugging statements");
	   opts.process(argc, argv);
	   debugQ = opts.getBoolean("debug");
	   int transpose = opts.getInteger("transpose");
	   int numinputs = opts.getArgCount();
	   HumdrumFile hfile;
	   for (int i=1; i<=numinputs || i==0; i++) {
	      if (numinputs < 1) { hfile.read(std::cin);  }
	      else { hfile.read(opts.getArg(i)); }
	      cout << transposeFile(hfile, transpose);
	   }
	   return 0;
	}


Random melody generator
-----------------------

The following program will generate a random melody, both in pitch and
rhythm:


.. code:: cpp

	#include "humdrum.h"
	#include <stdlib.h>     // for drand48 random numbers 
	#include <time.h>       // for time(NULL) function 

	void printRandomMelody(int notecount, int seed) {
	   cout << "!!!seed:\t" << seed << endl;
	   cout << "**kern\n";
	   int pitch, rhythm;
	   char buffer[1024] = {0};
	   for (int i=0; i<notecount; i++) {
	      rhythm = int(drand48() * 16 + 1 + 0.5);
	      pitch  = int(drand48() * 24 + 12*4.5 + 3);
	      cout << rhythm << Convert::base12ToKern(buffer, pitch) << endl;
	   }
	   cout << "*-\n";
	}
	
	int main(int argc, char** argv) {
	   Options options;
	   options.define("c|count=i:20", "number of notes to generate");
	   options.define("s|seed=i:-1",  "random number generator seed");
	   options.process(argc, argv);
	   int seed = options.getInteger("seed");
	   if (seed < 0) {
	      seed = time(NULL);  // time in seconds since 1 Jan 1970
	   }
	   srand48(seed);
	   printRandomMelody(options.getInteger("count"), seed);
	   return 0;
	}


Here is some example output:

.. code:: humdrum

	!!!seed: 1241137496
	**kern
	2d
	9ee-
	2a
	13g
	15B-
	16f#
	7A
	16B
	17gg
	1d
	11cc
	14c#
	10d
	11ee
	12f#
	13c#
	8cc
	14b-
	3f
	17a
	*-

The ``-s`` option can be used to generate a fixed random melody;
otherwise, the random melody will be based on the current time in
seconds since 1 Jan 1970. The ``-c`` option can be used to specify the
number of notes in the melody. Notice that if no melody length is given,
the default length of 20 note will be used.

To display as graphical music notation:

.. code:: bash

    bin/randomel -s 1241137496 \
       | hum2abc -M none | abcm2ps - -O - \
       | convert -quality 100 -density 300 - -trim -resize '33%' output.png


.. image:: programming.rstd/random.svg
	:align: center
	:width: 100%

The Humdrum file data can be stored internally in a stream object. This
stream object can be ready by a HumdrumFile object to be reprocessed
within the program, or to be printed with ostream as a HumdrumFile
object. The following example demonstrates this. Also, since strstream
was changed to stringstream in ANSI C99, there are some preprocessor
instructions to allow using string streams in both older and newer
standards (including differences in Visual C++ 6).

.. code:: cpp
	
	#include "humdrum.h"
	#include <stdlib.h>     // for drand48 random numbers 
	#include <time.h>       // for time(NULL) function 
	
	#ifndef OLDCPP
	   #define SSTREAM stringstream
	   #define CSTRING str().c_str()
	   using namespace std;
	#else
	   #ifdef VISUAL
	      #include <strstrea.h>
	   #else
	      #include <strstream.h>
	   #endif
	   #define SSTREAM strstream
	   #define CSTRING str()
	#endif
	
	void getRandomMelody(HumdrumFile& datafile, int notecount, int seed) {
	   SSTREAM output;
	   output << "!!!seed:\t" << seed << endl;
	   output << "**kern\n";
	   int pitch, rhythm;
	   char buffer[1024] = {0};
	   for (int i=0; i<notecount; i++) {
	      rhythm = int(drand48() * 16 + 1 + 0.5);
	      pitch  = int(drand48() * 24 + 12*4.5 + 3);
	      output << rhythm << Convert::base12ToKern(buffer, pitch) << endl;
	   }
	   output << "*-\n";
	   output << ends;
	   // It is possible to print to ostream:
	   // cout << output.CSTRING << flush;
	   datafile.read(output);
	}
	
	int main(int argc, char** argv) {
	   Options options;
	   options.define("c|count=i:20", "number of notes to generate");
	   options.define("s|seed=i:-1",  "random number generator seed");
	   options.process(argc, argv);
	   int seed = options.getInteger("seed");
	   if (seed < 0) {
	      seed = time(NULL);  // time in seconds since 1 Jan 1970
	   }
	   srand48(seed);
	   HumdrumFile datafile;
	   getRandomMelody(datafile, options.getInteger("count"), seed);
	   cout << datafile;
	   return 0;
	}


Markov melody analyzer/generator
--------------------------------

Here is a more sophisticated random melody generator.

.. code:: cpp

	#include "humdrum.h"
	#include <regex.h>
	#include <stdlib.h>
	#include <time.h>
	
	void buildTable(HumdrumFile& hfile, Array<Array<double> >& ptable,
	      Array<Array<double> >& mtable) {
	   int lastmeter = -1; int lastpitch = -1;
	   int meter, pitch;
	   hfile.analyzeRhythm();
	   for (int i=0; i<hfile.getNumLines(); i++) {
	      if (!hfile[i].isData()) continue;
	      if (strcmp("**kern", hfile[i].getExInterp(0)) != 0) continue;
	      if (strcmp(hfile[i][0], ".") == 0) continue;    // ignore null tokens
	      if (strchr(hfile[i][0], 'r') != NULL) continue; // ignore rests
	      pitch = Convert::kernToBase40(hfile[i][0]) % 40;
	      meter = int((hfile[i].getBeat() - 1.0) * 4 + 0.5);
	      if (meter < 0) meter = 0;
	      if (meter >= 40) meter = 39;
	      if (lastmeter < 0) {
	         lastpitch = pitch; lastmeter = meter;
	         continue;
	      }
	      mtable[lastmeter][meter]++;   mtable[lastmeter][40]++;
	      ptable[lastpitch][pitch]++;   ptable[lastpitch][40]++;
	      lastpitch = pitch;            lastmeter = meter;
	   }
	}
	
	void printTables(Array<Array<double> >& ptable,
	   Array<Array<double> >& mtable, int style) {
	   int i, j;
	   double value;
	   char buffer[32] = {0};
	   for (i=0; i<ptable.getSize(); i++) {
	      cout << '\t' << Convert::base40ToKern(buffer, i+4*40);
	   }
	   cout << endl;
	   for (i=0; i<ptable.getSize(); i++) {
	      cout << Convert::base40ToKern(buffer, i+4*40);
	      for (j=0; j<40; j++) {
	         value = style ? ptable[i][j]/ptable[i][40] : ptable[i][j];
	         cout << '\t' << value;
	      }
	      cout << '\t' << ptable[i][40] << endl;
	   }
	   cout << endl;
	   for (i=0; i<mtable.getSize(); i++) cout << "\tb" << i/4.0 + 1.0;
	   cout << endl;
	   for (i=0; i<mtable.getSize(); i++) {
	      cout << "b" << i/4.0 + 1.0;
	      for (j=0; j<mtable[i].getSize(); j++) cout << '\t' << mtable[i][j];
	      cout << endl;
	   }
	}
	
	int chooseNextTransition(Array<Array<double> >& table, int state) {
	   double target = drand48() * table[state][40];
	   double sum = 0.0;
	   for (int i=0; i<40; i++) {
	      sum += table[state][i];
	      if (sum > target)  return i;
	   }
	   return 39;
	}
	
	void smoothMelody(Array<double>& meldur, Array<int>& melpitch) {
	   int beforei, afteri, inta, intb;
	   for (int i=2; i<meldur.getSize()-2; i++) {
	      if (meldur[i] < 0.0) continue;
	      afteri  = i+1;   beforei = i-1;
	      if (meldur[afteri] < 0.0) afteri++;
	      if (meldur[beforei] < 0.0) beforei--;
	      inta = melpitch[i] - melpitch[beforei];
	      intb = melpitch[i] - melpitch[afteri];
	      if ((inta > 22) && (intb > 22)) {
	         melpitch[i] -= 40;
	      } else if ((inta < -22) && (intb < -22)) {
	         melpitch[i] += 40;
	      }
	   }
	}
	
	void generateMelody(Array<Array<double> >& ptable,
	      Array<Array<double> >& mtable, int count) {
	   int    pitch, pitchclass = 2, meter = 0, oldmeter = 0;
	   int    i, measurenumber = 2;
	   double duration, barmarker = -1;
	   char   buffer[1024] = {0};
	   Array<int> melpitch(count*2);  melpitch.setSize(0);
	   Array<double> meldur(count*2); meldur.setSize(0);
	   for (i=0; i<count; i++) {
	      pitchclass  = chooseNextTransition(ptable, pitchclass);
	      meter = chooseNextTransition(mtable, meter);
	      if (meter > oldmeter) duration = (meter - oldmeter) / 4.0;
	      else {
	         duration = (4 + meter - oldmeter) / 4.0;
	         meldur.append(barmarker);
	         pitch = measurenumber++;
	         melpitch.append(pitch);
	      }
	      oldmeter = meter;
	      if (duration == 0.0) duration = 4.0;
	      if (duration > 4.0)  duration = 4.0;
	      if (duration < 0.0)  duration = 1.0;
	      pitch = pitchclass + 4 * 40;
	      meldur.append(duration);  melpitch.append(pitch);
	   }
	   smoothMelody(meldur, melpitch);
	   cout << "**kern\n*M4/4\n=1-\n";
	   for (i=0; i<meldur.getSize(); i++) {
	      if (meldur[i] < 0.0) cout << "=" << melpitch[i] << endl;
	      else {
	         cout << Convert::durationToKernRhythm(buffer, meldur[i]);
	         cout << Convert::base40ToKern(buffer, melpitch[i]);
	         cout << endl;
	      }
	   }
	   cout << "*-" << endl;
	}
	
	int main(int argc, char** argv) {
	   Options options;
	   options.define("t|table=b",       "display table of transitions");
	   options.define("f|fraction=b",    "display transitions as fractions");
	   options.define("g|generate=i:20", "generate specified number of notes");
	   options.process(argc, argv);
	   srand48(time(NULL)); HumdrumFile hfile;
	   Array<Array<double> > ptable; // pitch transition table
	                               // (scale degrees would be musically better)
	   Array<Array<double> > mtable; // meter transition table
	   ptable.setSize(40); ptable.allowGrowth(0);
	   mtable.setSize(40); mtable.allowGrowth(0);
	   int i;
	   for (i=0; i<ptable.getSize(); i++) {
	      ptable[i].setSize(41); ptable[i].allowGrowth(0); ptable[i].setAll(0.0);
	      mtable[i].setSize(41); mtable[i].allowGrowth(0); mtable[i].setAll(0.0);
	   }
	   int numinputs = options.getArgCount();
	   for (i=1; i<=numinputs || i==0; i++) {
	      if (numinputs < 1) hfile.read(std::cin);
	      else hfile.read(options.getArg(i));
	      buildTable(hfile, ptable, mtable);
	   }
	   if (options.getBoolean("table")) {
	      printTables(ptable, mtable, options.getBoolean("fraction"));
	   } else {
	      generateMelody(ptable, mtable, options.getInteger("generate"));
	   }
	   return 0;
	}

