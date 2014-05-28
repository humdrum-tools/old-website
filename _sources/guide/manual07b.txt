.. image:: ../HumdrumIcon.gif
    :alt:
.. image:: ../HumdrumHeader.gif
    :alt: Humdrum
.. image:: ../HumdrumSpacer.gif
    :alt:


*Development Reference*
=====================

--------


Humdrum Software Development
============================

--------

The Humdrum Toolkit is necessarily limited in scope and there are many
functions that users will wish to add. In developing adjunct software tools,
it is imperative that the software conform to the following design
conventions:

1.  Programs should be general-purpose and adapt to a wide variety of
    input circumstances.
2.  If possible, programs should be able to process any Humdrum input
    rather than be limited to a given type of input interpretation.
3.  Command names should be limited to 8 characters in length in order to
    ensure portability to DOS systems.
4.  Command names should preferably be the same as the output
    interpretation produced by the command.
5.  Command names should not be unduly abbreviated since infrequently
    used software is less easily remembered than frequently used system
    commands.
6.  The command syntax should conform to standard POSIX conventions.
7.  Errors and warnings should be prefaced by giving the name of the
    program or command which issues the error message. e.g.

    > `` vox: ERROR: voice 3 begins with a null token. ``

8.  Errors messages should be sent to "stderr" rather than to the
    standard output.
9.  Wherever possible, `filter' programs should produce outputs that are
    identical in structure to the input. More specifically, input line
    numbers should correspond to output line numbers -- where appropriate.
10. Comments, interpretations, barlines, and double barlines should be
    echoed in the output as the default condition (except in the case of
    formatted non-Humdrum outputs).
11. For many programs, the user should be able to skip the processing of
    certain types of tokens (such as barlines) by specifying a .B "-s" flag
    -- followed by a user-defined regular expression. Tokens matching the
    regular expression should be echoed unprocessed in the output stream.
12. Programs should handle spine-path changes in a fashion appropriate to
    the nature of the command.
13. Comments and interpretations should be identified by explicitly
    matching the exclamation mark or asterisk in the *first* column of the
    input data token. Exclamation marks and asterisks are legitimate data
    signifiers when not occurring in the first column of an input token.
14. Where possible, outputs should *not* be formatted with descriptive
    labels etc. The preferred output format is to have all outputs conform to
    the Humdrum syntax. This ensures that all outputs can themselves be used
    as inputs to other Humdrum programs.
15. Programs should generally avoid assumptions concerning context-
    dependent inputs. Inputs should be assumed to be context-free.
16. Programs should be able to handle inputs with unexpected user
    extensions or representational addenda -- such as the presence of
    spurious or unknown characters.
17. Programs that search or examine inputs for certain features,
    properties, or errors should return a *null* output if nothing is found.
    Messages indicating that `nothing was found' should be avoided. "Silence
    is golden."


Standard Program Skeleton
=========================

Much of the Humdrum software was originally developed using the AWK
programming language. AWK was designed by `Alfred Aho, Brian Kernighan, and
Peter Weinberger.`_ It is syntactically very similar to the C programming
language, but is easier to use and promotes better software productivity. AWK
provides powerful text manipulation features that make it admirably suited to
the creation of Humdrum software. AWK is also a very easy language to learn,
and is an excellent first language for novice programmers.

The Humdrum Toolkit includes programing skeletons that may provide a useful
starting place for software development using AWK. Two skeleton files are
provided with the toolkit: `**skeleton.ksh**`_ and `**skeleton.awk**`_. The
kornshell file (**.ksh**) parses the command line, issues appropriate error
messages if the command is improperly invoked, displays a help screen if
necessary, and assembles the command parameters to invoke an awk script for
the command (**.awk**).

The `**skeleton.awk**`_ skeleton contains a main loop that is normally
executed for each record of input. A series of useful functions are included
in the AWK skeleton program. These functions include:

1.  **Parse_command.** This function checks that the input passed from
    the corresponding kornshell script for the command. The Parse_command
    function contains a list of valid options and assigns the passed
    parameters to the appropriate option variables.
2.  **Store_indicators.** This function allows the spine-path indicators
    for the current record to be stored in the array **path_indicator** so
    that they may be used later.
3.  **Store_new_interps.** This function stores the new interpretations
    found in an interpretation record for each spine.
4.  **Process_indicators.** This function takes the spine-path indicators
    that were stored in the array 'path_indicator' in the function
    'store_indicators' and manipulates the arrays 'path_indicator' and
    'current_interp' according to the contents of the array 'path_indicator'.
5.  **Ins_array_pos.** This function inserts new positions in the arrays
    'path_indicator', 'current_interp', and 'current_key' and copies elements
    so that everything is preserved
6.  **Del_array_pos.** Performs the opposite of function 'ins_array_pos'.
7.  **Exchange_spines.** This function exhanges two spines by exchanging
    the corresponding elements in current_interp.

--------




-   ` **Humdrum Toolkit Main Page**`_
-   ` **Developer's Guide Main Page**`_
-   ` **Humdrum Toolkit User Guide**`_
-   ` **Humdrum Toolkit Command Documentation**`_



.. _Alfred Aho, Brian Kernighan, and Peter Weinberger.:
    manual.bibliog.html#Aho
.. _skeleton.ksh: skeleton.ksh
.. _skeleton.awk: skeleton.awk
.. _Humdrum Toolkit Main Page: index.html
.. _Developer's Guide Main Page: manual07.html
.. _Humdrum Toolkit User Guide: guide.toc.html
.. _Humdrum Toolkit Command Documentation: commands.toc.html
