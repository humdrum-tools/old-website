.. image:: ../HumdrumIcon.gif
    :alt:
.. image:: ../HumdrumHeader.gif
    :alt: Humdrum
.. image:: ../HumdrumSpacer.gif
    :alt:


*Development Reference*
=====================

--------


How To Translate MuseData Files to Humdrum
==========================================

--------

Quick Index:

> `**Introduction**`_ `**Procedural Overview**`_ `**Procedural Details**`_
> `**1. Access Appropriate Files.**`_ `**2. Basic Translation.**`_ `**3.
Transposing Parts.**`_
> `**4. Beam Modification.**`_ `**5. Combining Parts.**`_ `**6. Alignment
Check.**`_
> `**7. Removing Duplicate Header Information.**`_ `**8. Eliminate Redundant
Section Labels.**`_ `**9. Instrument Identification.**`_
> `**10. Figured Bass Generation.**`_ `**11. Editing Figured Bass.**`_ `**12.
Leading Barlines.**`_
> `**13. Logical and Orthographic Barlines.**`_ `**14. Eliminating figured
bass comments.**`_ `**15. Eliminating `P' Record Comments.**`_
> `**16. Resolving "backspace" Passages.**`_ `**17. Checking Naturals.**`_
`**18. Adding Heavy Wedge Accents.**`_
> `**19. Resolving Trills and Mordents.**`_ `**20. Appoggiaturas.**`_ `**21.
Section Labels.**`_
> `**22. Repeats and Da Capos.**`_ `**23. Editorialisms.**`_ `**24. Reference
Records.**`_
> `**25. Syntax Checking (I).**`_ `**26. Syntax Checking (II).**`_ `**27.
Proof Listening.**`_
> `**28. Adding VTS Checksum Record.**`_ `**29. Assemble the Distribution
Files.**`_ `**30. Create a README File.**`_
> `**31. Create a LICENSE File.**`_ `**32. Prepare a Master Disk.**`_


Introduction
============

This document provides a detailed description of how to translate score-
related data from the MuseData format to the Humdrum format. Some familiarity
with Humdrum and MuseData is assumed. A suitable introduction to the MuseData
format may be found in `** W.B. Hewlett, "MuseData: Comprehensive
representation for printing, sound, and analysis."**`_ In: E. Selfridge-Field
*Beyond MIDI: The Handbook of Musical Codes,* Cambridge, Massachusetts: MIT
Press, 1997. A suitable introduction to Humdrum may be found in Section I
("Humdrum General Introduction") of the *Humdrum Toolkit Reference Manual*
(pp. 7-37). In addition, the user must be familiar with the Humdrum Kern
representation. The most comprehensive introduction to Kern is in the file
`` kern_rep.txt`` found in every distribution disk containing Kern data.
Additional technical details regarding Kern are given in the *Humdrum Toolkit
Reference Manual,* pp. 96-105.

Both *MuseData* and *Humdrum* are used to represent score-related musical
data. MuseData provides a hub of high quality data that may be translated to
various forms -- one of which is Humdrum. Humdrum representations are
tailored to facilitate music analysis. The goal of translation is to provide
a broader distribution of CCARH data for music scholars. It is important that
the translation be as accurate and complete as possible.

When translating between two formats, it's important to know some things
about both representations. Both MuseData and Humdrum rely on ASCII (text)
formats. Descriptions of the MuseData and Humdrum "Kern" representations may
be found in E. Selfridge-Field (editor) *Handbook of Musical Codes* (MIT
Press, 1997). The MuseData representation is also described in documents
available from the Center for Computer Assisted Research in the Humanities; a
succinct description of the Humdrum "Kern" representation can also be found
in the file ``kern_hlp.txt`` which accompanies every Humdrum data
distribution.

There are two types of MuseData files: *stage 1* and *stage 2.* Both stages
conform to the MuseData representation format, but stage 2 data is more
complete. Specifically, stage 2 data includes layout information suitable for
printing and notation display. For example, stage 2 data contains stem
direction information which is not present in stage 1. Translation to Humdrum
can be done from *either* stage 1 or stage 2 MuseData -- however, it is
obviously preferable to translate from the more complete stage 2 data.

Humdrum provides several different types of representations. In translating
MuseData, the most pertinent Humdrum representations are the *Kern* and
*Bnum* representations. The *Kern* representation is suitable for
representing notes, rests, stems, beams, etc., and is the most important of
the Humdrum target representations. The *Bnum* representation is used to
represent "basso numerato" or figured-bass data. Figured bass information may
or may not be present in the MuseData files.

The principal difference between MuseData and Humdrum is in the file
organization. Humdrum represents a full score in a single file, whereas
MuseData represents each part or voice in a separate file. In translating
from MuseData to Kern, each individual part is first translated to Kern, and
then all of the parts are assembled into a full score.


Procedural Overview
-------------------

Although the basic translation to Kern has been automated, there are several
ancilliary problems that must be attended to. Unfortunately, these ancilliary
problems involve the greatest amount of work. The translation process is
described in detail later in this document. The basic steps involved in
translating from MuseData to Humdrum can be summarized as follows.

-   (i) *Accessing* or assembling the necessary MuseData files.
-   (ii) *Basic translation* from MuseData to the Humdrum Kern
    representation. Each part is translated separately.
-   (iii) *Re-beaming and transposing* any parts for transposing
    instruments.
-   (iv) *Assembling a full score* from individual parts.
-   (v) *Generating figured bass* data (if necessary).
-   (vi) *Editing* the score to add header information and discard
    unneeded data. Also resolving "backspace" passages, resolving trills and
    mordents, checking for naturals, and arranging editorialisms.
-   (vii) *Adding reference records* to provide "library-type"
    information about the work.
-   (viii) *Syntax checking* and proof listening.
-   (ix) *Adding checksum* information to insure data integrity.
-   (x) *Assembling the distribution package* including ``README`` and
    ``LICENSE`` files.

The most onerous of the above procedures are automated, however most of the
steps involve manual intervention.


Procedural Details
------------------

For data translation, you will normally want to use a UNIX system. Data
translation can also be carried out under DOS or WINDOWS but the translation
programs will run much slower.

In the following detailed explanation, we use the hypothetical example of
translating a work containing four parts: *continuo, 'cello, horn*, and
*oboe*.


1. Access Appropriate Files.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copy the appropriate files to a convenient working directory on your hard
disk. Typically, you will need to copy an entire directory structure
containing several subdirectories. On UNIX systems, use the **cp** command
with the **-r** (recursively copy) option. For example, the following command
will copy everything from the `A' disk to the current directory:

> ``cp -r a:* .``

You may need to use the **mcopy** command to access DOS disks from Linux
systems.

On DOS systems you may use the **cptree** command to replicate a subdirectory
structure.


2. Basic Translation.
~~~~~~~~~~~~~~~~~~~~~~

Change directories in the MuseData file structure until reaching the parts
for a given movement or work. In our hypothetical example the directory will
contain numbered files from 1 to 4. Use the **md2kern** program to translate
each part separately:

> ``md2kern 1 > 1.krn
md2kern 2 > 2.krn
md2kern 3 > 3.krn
md2kern 4 > 4.krn``

Each part is now in the Humdrum Kern format.

On very rare occasions you may find that **md2kern** fails to work. This
arises from a yet to be diagnosed bug that seems related to the line-length
of input records. This problem can be overcome by editing the file and
eliminating trailing blanks at the ends of lines.


3. Transposing Parts.
~~~~~~~~~~~~~~~~~~~~~~

Unlike the printed score, the Kern representation encodes music at concert
pitch. Determine whether any parts are for transposing instruments. If so,
determine how each transposing instrument should be transposed in order to
return it to concert pitch. For example, a horn in F sounds a perfect fifth
below the notated music. Use the Humdrum **trans** command to transpose down
4 diatonic letter-names (``-d -4``) and transpose down 7 chromatic semitones
(``-c -7``). (Refer to the *Humdrum Reference Manual* -- Section 4 for
details on how to use this command). In the case of our horn part:

> ``trans -d -4 -c -7 3.krn > 3.tra``
`` mv 3.tra 3.krn`` (on UNIX systems)
`` ren 3.tra 3.krn`` (on DOS systems)

In the case of a B-flat trumpet or B-flat clarinet, the appropriate
transposition would be:

> ``trans -d -1 -c -2``

In the case of clarinet in A, use the following transposition:

> ``trans -d -2 -c -3``

Having transposed the part, edit this file so that the "transposition
interpretation" designates a transposing *instrument* (see *Humdrum Reference
Manual* -- Section 3 for details on transposition designators). Simply add
the upper-case letter `I' prior to the `T' in the appropriate tandem
interpretation. In the case of our horn, use a text editor to make the
following change:

> ``*Trd-4c-7``

to:

> ``*ITrd-4c-7``


4. Beam Modification.
~~~~~~~~~~~~~~~~~~~~~~

MuseData and Kern handle beaming information in different ways. Use the
**rebeam** program to transform the beaming data so that it conforms to the
Kern format. Apply the command to each of the Kern part files:

> ``rebeam 1.krn > 1.bem
rebeam 2.krn > 2.bem
rebeam 3.krn > 3.bem
rebeam 4.krn > 4.bem``


5. Combining Parts.
~~~~~~~~~~~~~~~~~~~~

Combining parts entails expanding the files using the **timebase** command,
then amalgamating the part files into a full score using the **assemble**
command, and then eliminating null data records using the **rid** command.

In order to expand the files, a suitable *time-base* duration must be chosen.
As a minimum, the time-base must not be longer than the shortest duration
note in any of the part files. The Humdrum **census** command can be used to
establish the shortest note:

> ``census -k *.bem``

Note that triplets or other "n-tuplets" might require an even shorter time-
base for proper score assembly. For example, if the shortest duration in the
work is an eighth-note (`8'), but the work also contains quarter-note
triplets (`12'), then a common divisor must be sought. Both 12 and 8 divide
evenly into 24, therefore a time-base of 24 is the minimum required. If you
are in doubt about an appropriate time-base value, a "safe" value is often
96. Apply the same time-base to each of the part files:

> ``timebase -t 96 1.bem > 1.tb
timebase -t 96 2.bem > 2.tb
timebase -t 96 3.bem > 3.tb
timebase -t 96 4.bem > 4.tb``

(If you have chosen an inappropriate timebase don't worry too much, because
the **proof** command will complain voluminously when we apply it later.)

Now we can assemble the parts into a single file containing the full score.
Since the Humdrum convention places the lowest parts in the left-most
columns, we must reverse the numerical order of the part files. We should
also use the **rid** command to eliminate null data records:

> ``assemble 4.tb 3.tb 2.tb 1.tb | rid -d > full.krn``

The file ``full.krn`` will now contain a full score rendering of the work or
movement.


6. Alignment Check.
~~~~~~~~~~~~~~~~~~~~

Now that we have a full score, we ought to check to ensure that the parts
have been correctly aligned. The formal way of checking this is to run the
Humdrum **proof** command, but since we will be running this command later,
and since the likelihood is that everything is okay, a faster check is simply
to ensure that the number of the spines is constant throughout the file. We
can do this using the **humdrum** command with the **-v** (verbose) option.

> ``humdrum -v full.krn | grep 'concurrent spines'``

The output from this command will tell us the *minimum* and *maximum* number
of spines in the file; they should be identical. If they aren't identical,
then it is likely that the parts are misaligned. The probable cause is that
one or more of the parts contains an unusual *n*-tuplet (such as 7 in the
time of a quarter) and that the time-base value used in the **timebase**
command was insufficiently large. Examine the full score at the point where
the parts are misaligned and determine which duration value that has led to
the problem. Calculate a better time-base value so that all durations in the
work are common factors. For example, if the work contains quarter-notes (4),
eighth-notes (8) and septuplets in the time of a quarter (28), then a
suitable time-base value would be 28 X 8 or 224. Return to the section
"Combining Parts" and use the revised time-base value.


7. Removing Duplicate Header Information.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After creating a full score, duplicate MuseData header comments can be
removed using a text editor like **vi** or **emacs.** For example, if the
full score contains 12 parts, we don't need 12 identical comments indicating
the date that the parts were encoded.


8. Eliminate Redundant Section Labels.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Humdrum provides ways of labelling sections and indicating repeats, Da Capos,
etc. The **md2kern** program automatically assigns the default label `A' to
the first section in any translated work. Subsequent sections are labelled
`B', `C', etc. In many cases, the work has only a single section; in this
case the section label is of no use unless there is a repeat. Consequently,
the Humdrum "expansion list" (indicating how to expand repeats) simply says
play section `A' once. In these cases, both the *section label* and the
*expansion list* are redundant and should be deleted. That is, the following
lines should be eliminated if they occur together:

> ``*>[A]
*>A``


9. Instrument Identification.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Humdrum provides standardized instrumentation indicators. For example, the
standard indicator for "harpsichord" is ``*Icemba``. An extensive list of
instrument designators can be found in Section 3 of the *Humdrum Reference
Manual* (pp. 193-198).

In addition, Humdrum provides standardized instrument class designators, such
as ``*ICklav`` for keyboard instruments and ``*ICidio`` for percussion
instruments, and for instrument groupings -- such as ``*IGripn`` for
*ripieno* instruments and ``*IGacmp`` for accompaniment instruments. These
instrument class designators can also be found in Section 3 of the Humdrum
reference manual.

In addition, the original instrument name (as found in the score) should also
be encoded as a Humdrum local comment.

Add instrument and instrument-class tandem interpretations. Also add the
instrument identification to corresponding local comments.


10. Figured Bass Generation.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If the original MuseData score includes figured-bass information, then the
appropriate data will appear in the Kern output as special global comments
(beginning "``!!f1`` ..." or "``!!f2`` ..." etc.). These comments can be used
to generate a Humdrum "basso-numerato" spine (``**Bnum``) using the
**md2bnum** program.

> ``md2bnum full.krn > figbass``

This new spine should then be added to the full score using the **assemble**
command:

> ``assemble full.krn figbass > temp
mv temp full.krn``


11. Editing Figured Bass.
~~~~~~~~~~~~~~~~~~~~~~~~~~

There is an unfortunate problem arising when translating MuseData figured
bass to the Humdrum basso-numerato. When a new figure occurs while a bass
note is being sustained, it is possible that the position of the figure in
the Humdrum file is incorrect. Consider, for example, the two passages shown
below. The "``5-3``" figured bass is positioned *incorrectly* in the first
passage, but it is positioned *correctly* in the second passage:

> ``**kern**kern**kern**Bnum
> 2E4c8g6
> ``..8a5 3
> ``.4B4g.
> **kern**kern**kern**Bnum
> 2E4c8g6
> ``..8a.
> ``.4B4g5 3``

When more than one figured bass is given for a single bass note the
**md2bnum** command cannot determine where the correct placement is from the
MuseData information.

The **bnumhelp** program marks all *possible* error points for manual
inspection and editing:

> ``bnumhelp full.krn > new.krn``

Open the file "``new.krn``" and search for any occurrences of the string
"``ERROR?``" Check each possible error points with the original score to
determine whether the figured bass notation is correctly positioned. When you
have finished editing the file:

> ``mv new.krn full.krn``


12. Leading Barlines.
~~~~~~~~~~~~~~~~~~~~~~

Humdrum tools prefer to have explicit information indicating the beginning of
the first measure. If a file does not begin with an anacrusis ("pickup") then
an "invisible" first barline needs to be encoded in the Kern representation.
In our hypothetical file containing five spines, we would need to insert the
following line just before the first note(s) in the work:

> ``=1-=1-=1-=1-=1-``

Don't forget to add the appropriate barline in the figured bass spine (if it
is present).


13. Logical and Orthographic Barlines.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The kern representation makes a distinction between the logical *function* of
a barline and it's visual or *orthographic* appearance. For example, kern
distinguishes between double barlines whose function is to indicate the end
of a work or movement, and double barlines that simply delineate sections
within the course of a work or movement. Moreover, in kern, it is possible
for a barline at the end of the work to be "functionally" a double barline,
yet appear visually as a single barline.

*Functional double barlines* are encoded with a double equals sign (==)
whether or not they are visually rendered as double barlines. *Functional
single barlines* are encoded with a single equals sign (=) whether or not
they are visually rendered as single barlines.

The specific visual appearance may be encoded following the equals sign(s).
The vertical line (|) represents a `thin' line and the exclamation mark (!)
represents a `thick' line. A typical final double bar would be encoded:

> ``==|!``

Most mid-movement double bars are encoded with two thin lines and so would be
encoded:

> ``=||``

A common translation error arising from the **md2kern** program is to render
mid-movement double barlines as *functional* rather than *orthographic*
double-bars. Check all double barlines for proper visual encoding. Remove
"functional" double bars from within the work/movement; retain only visual
double barlines mid-work.


14. Eliminating Figured Bass Comments.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once the figured bass information has been properly edited, the associated
global comments can be eliminated from the Humdrum file. Open the file and
eliminate all lines beginning with two exclamation marks followed by the
lower-case letter `f'. For example, execute the following command if using
the **vi** text editor:

> ``:g/^!!f/d``


15. Eliminating `P' Record Comments.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Also, eliminate some other MuseData information that has been echoed as
Humdrum comments:

> ``:g/^!!P/d``


16. Resolving "backspace" Passages.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

MuseData provides a "backspace" capability that allows the score pointer to
be moved backwards in time. This is forbidden in Humdrum. The **md2kern**
program marks all occurrences of MuseData backspace material, and encodes the
passage as local comments. These must be edited by hand. The user must go
back the specified duration and insert the material either as (1) Kern
multiple stops, or as (2) a temporary split-spine. If the note durations are
identical to the concurrent material in the same voice, then the backspace
material should be inserted as multiple stops. If the note durations differ,
then a temporary split-spine must be added.


17. Checking Naturals.
~~~~~~~~~~~~~~~~~~~~~~~

The **md2kern** program currently fails to translate all naturals correctly.
Until this bug is fixed, it is necessary to manually check the output Kern
data against the printed score in order to ensure that all of the naturals
are present.


18. Adding Heavy Wedge Accents.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The "md2kern" program also currently fails to translate "heavy wedge" symbols
(designated in MuseData by the semicolon ";"). These must be inserted
manually as a greve (`) in the kern data.


19. Resolving Trills and Mordents.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Kern representation makes a distinction between whole-tone and semitone
trills and mordents. Each trill and mordent must be examined manually and the
correct code selected.

The **md2kern** command translates all trills using the token "``Tt``". Open
the file using a text editor and search for occurrences of `Tt'. Check each
trill against the printed score and determine whether the trill is intended
to be a semitone or tone in size. In rare cases, the size of the trill will
be ambiguous. In these cases choose what you think is the best, and add the
kern `x' signifier immediately following the `T' or `t'. This indicates that
the trill size is an "editorial interpretation."

Repeat this same procedure for mordents ("``Mm``") and for inverted mordents
("``Ww``").


20. Appoggiaturas.
~~~~~~~~~~~~~~~~~~~

The kern representation treats appoggiaturas in a special way. In general,
kern is oriented to representing things in a manner closer to how they sound.
Consequently, appoggiaturas are encoded as they would be logically performed.
For example, a quarter-note preceded by an appoggiatura (small note) would be
performed as two eighth-notes. Similarly, a dotted quarter-note preceded by
an appoggiatura would be performed as a quarter-note followed by an eighth-
note.

All appoggiaturas must be re-encoded in a way that reflects their likely
performance. At the same time, the two notes forming the appoggiatura must be
marked in the kern representation: the initial note of the appoggiatura is
marked by the upper-case letter ```P``' and the final (second) note of the
appoggiatura is marked by a lower-case letter ```p``'.


21. Sections Labels.
~~~~~~~~~~~~~~~~~~~~~

It is helpful to break-up large works/movements into smaller sections that
can be labelled. In a binary work, for example, it may be useful to label the
`A' and `B' sections. In a sonata-allegro work, it may be useful to label the
introduction, exposition, development, recapitulation, etc. Some works
include explicitly notated labels. These labels may be traditional, e.g.
"Coda," or they may reflect programatic descriptions, such as the section
entitled *Il canto degl'uccelli* [The song of the birds] in Vivaldi's *The
Four Seasons.*

Where appropriate, suitable section labels should be created and encoded
using the Humdrum Section Label designator. Section labels can include the
space character:

> ``*>1st Theme``

If you include section labels, you must also include a Humdrum "Expansion
List" to indicate how the sections are connected. The Humdrum **thru**
command causes a through-composed version of a file to be generated according
to the expansion list. For example, an expansion list for a simple binary
work may be encoded as:

> ``*>[A,B]``

Remember that expansion lists ought to be encoded prior to the first section
label.


22. Repeats and Da Capos.
~~~~~~~~~~~~~~~~~~~~~~~~~~

Whenever a work/movement includes repeats or Da Capos, section labels and
expansion lists must be encoded. In some cases, there is more than one way of
interpreting how to realize the repeats. The most "conventional" realization
should be encoded with the *unnamed expansion list.* This will specify the
default expansion using the Humdrum **thru** command. Suppose for example,
that you are encoding a typical minuet and trio. The conventional performance
practice involves repeating all sections of both the minuet and trio, but
then avoiding the repeats in the minuet following the Da Capo. A suitable
expansion list might be:

> ``*>[Minuet,Minuet,Trio,Trio,,Minuet]``

An alternative expansion list might be encoded as follows (notice the
expansion-list-label *ossia*):

> ``*>ossia[Minuet,Minuet,Trio,Trio,,Minuet,Minuet]``


23. Editorialisms.
~~~~~~~~~~~~~~~~~~~

MuseData files may contain comments that provide editorial annotations.
Humdrum provides several ways of encoding editorialisms. These include
editorial footnotes, local comments, global comments, interpretation data,
*sic* and *ossia* designations, version labels, sectional labels, and
expansion lists.

The kern ```x``' signifies an "editorial interpretation" -- that the
immediately preceding signifier is interpreted. The kern ```xx``' also
signifies an editorial interpretation where the immediately preceding data
token is interpreted. The kern ```X``' signifies an "editorial intervention"
-- that the immediately preceding signifier is an editorial addition. The
kern ```XX``' also signifies an editorial intervention where the immediately
preceding data token is an editorial addition. The kern ```y``' designates a
invisible symbol -- such as an unprinted note or rest that is logically
implied. The kern ```Y``' signifies an editorial *sic* marking -- that the
information is encoded literally, but is questionable. The kern ```?``'
signifies an editorial footnote where the immediately preceding signifier has
an accompanying editorial footnote (located in a comment record). The kern
`` `??``' signifies an editorial footnote where the immediately preceding data
token has an accompanying editorial footnote (located in a comment record).


24. Reference Records.
~~~~~~~~~~~~~~~~~~~~~~~

Reference information must be added to each file. This information provides
"library-type" information about the composer, date of composition, place of
composition, copyright notice, etc.

As many reference records should be added as possible since these are
immensely useful to Humdrum users. Essential reference records include the
following:

> ``!!!COM:``composer's name
> ``!!!CDT:``composer's dates
> ``!!!OTL:``title (in original language)
> ``!!!OMV:``movement number (if appropriate)
> ``!!!OPS:``opus number (if appropriate)
> ``!!!ODT:``date of composition
> ``!!!OPC:``place of composition
> ``!!!YEP:``publisher of electronic edition
> ``!!!YEC:``date & owner of electronic copyright
> ``!!!YER:``date electronic edition released
> ``!!!YEM:``copyright message
> ``!!!YEN:``country of copyright
> ``!!!EED:``electronic editor
> ``!!!ENC:``encoder of document
> ``!!!EEV:``electronic edition version
> ``!!!ELF:``file number, e.g. 1 or 4 (1/4)
> ``!!!VTS:``checksum validation number (see below)
> ``!!!AMT:``metric classification
> ``!!!AIN:``instrumentation

Where appropriate, the following reference records should also be included:

> ``!!!CNT:``composer's nationality
> ``!!!XEN:``title (English translation)
> ``!!!OPR:``title of larger (or parent) work
> ``!!!ODE:``dedication
> ``!!!OCY:``country of composition
> ``!!!PPR:``first publisher
> ``!!!PDT:``date first published
> ``!!!PPP:``place first published
> ``!!!SCT:``scholarly catalogue name & number
> ``!!!SMA:``manuscript acknowledgement
> ``!!!AFR:``form of work
> ``!!!AGN:``genre of work
> ``!!!AST:``style of period

Refer to pages 26-37 in the *Humdrum Reference Manual* for further
information about the types and format for different reference records.


25. Syntax Checking (I).
~~~~~~~~~~~~~~~~~~~~~~~~~

Use the Humdrum **humdrum** command to identify whether the final encoded
output conforms to the Humdrum syntax:

> ``humdrum full.krn``


26. Syntax Checking (II).
~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the Humdrum **proof** command to identify any syntactical errors in the
encoded Kern data:

> ``proof full.krn``


27. Proof Listening.
~~~~~~~~~~~~~~~~~~~~~

One of the best ways to ensure that musical data makes sense is to listen to
it. No data should be released to the public without some proof listening.
The Humdrum **midi** and **perform** commands currently only work under the
DOS operating system. Ensure that you are using DOS when executing the
following command:

> ``midi -c full.krn | perform``

The **perform** command allows you to *pause* (press the space bar), to
*move* to a particular measure (type a measure number followed by enter), to
increase (type <) or decrease (type >) the *tempo,* and to *return* to the
beginning of the score (type enter). There are many other functions within
the **perform** command; refer to the *Humdrum Reference Manual* -- section 4
for further details.


28. Adding VTS Checksum Record.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Once you are certain that the score files are completely finished, you must
calculate a "checksum" value to be encoded in a Humdrum "VTS" reference
record. This record will allow users of the data to check the integrity of
the data using the Humdrum **veritas** command.

In order to calculate the checksum value for a given file, type the command:

> ``cksum full.krn > temp``

Open the original file:

> ``vi full.krn``

Go to the bottom of the file by typing `G' and then read in the checksum
value:

> ``:.r temp``

Then insert the ```!!!VTS: ``' reference record designator.


29. Assemble the Distribution Files.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Rename the score files and collect them into a coherent repertoire. Be sure
to use the ``.krn`` file extension. Place all resulting Humdrum files in a
single directory.


30. Create a README File.
~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a ``README`` file similar to others in Humdrum data distributions. The
file should contain a title, a brief paragraph describing the historical
background for the works, a paragraph describing the personnel involved in
the production, a copyright and license notice, and a table of contents.
Avoid tabs in this file, and ensure that no line is greater than
80-characters in length.


31. Create a LICENSE File.
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a ``LICENSE`` file reiterating the licensing agreement for the
distributed data. Simply copy a file used in previous distributions.


32. Prepare a Master Disk.
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Copy all of the files onto a master floppy disk from which distribution
copies will be made. Render the master disk "read-only." Attach a clearly
marked label. Make a backup copy of the appropriate directory on the hard
disk.

David Huron
1996 October
Revised 1997 January

.. _Introduction: #Introduction
.. _Procedural Overview: #Procedural Overview
.. _Procedural Details: #Procedural Details
.. _1.  Access Appropriate Files.: #1.  Access Appropriate Files.
.. _2.  Basic Translation.: #2.  Basic Translation.
.. _3.  Transposing Parts.: #3.  Transposing Parts.
.. _4.  Beam Modification.: #4.  Beam Modification.
.. _5.  Combining Parts.: #5.  Combining Parts.
.. _6.  Alignment Check.: #6.  Alignment Check.
.. _7.  Removing Duplicate Header Information.: #7.  Removing Duplicate
    Header Information.
.. _8.  Eliminate Redundant Section Labels.: #8.  Eliminate Redundant
    Section Labels.
.. _9.  Instrument Identification.: #9.  Instrument Identification.
.. _10.  Figured Bass Generation.: #10.  Figured Bass Generation.
.. _11.  Editing Figured Bass.: #11.  Editing Figured Bass.
.. _12.  Leading Barlines.: #12.  Leading Barlines.
.. _13.  Logical and Orthographic Barlines.: #13.  Logical and
    Orthographic Barlines.
.. _14.  Eliminating figured bass comments.: #14.  Eliminating figured
    bass comments.
.. _15.  Eliminating `P' Record Comments.: #15.  Eliminating `P' Record
    Comments.
.. _16.  Resolving "backspace" Passages.: #16.  Resolving backspace
    Passages.
.. _17.  Checking Naturals.: #17.  Checking Naturals.
.. _18.  Adding Heavy Wedge Accents.: #18.  Adding Heavy Wedge Accents.
.. _19.  Resolving Trills and Mordents.: #19.  Resolving Trills and
    Mordents.
.. _20.  Appoggiaturas.: #20.  Appoggiaturas.
.. _21.  Section Labels.: #21.  Section Labels.
.. _22.  Repeats and Da Capos.: #22.  Repeats and Da Capos.
.. _23.  Editorialisms.: #23.  Editorialisms.
.. _24.  Reference Records.: #24.  Reference Records.
.. _25.  Syntax Checking (I).: #25.  Syntax Checking (I).
.. _26.  Syntax Checking (II).: #26.  Syntax Checking (II).
.. _27.  Proof Listening.: #27.  Proof Listening.
.. _28.  Adding VTS Checksum Record.: #28.  Adding VTS Checksum Record.
.. _29.  Assemble the Distribution Files.: #29.  Assemble the
    Distribution Files.
.. _30.  Create a README File.: #30.  Create a README File.
.. _31.  Create a LICENSE File.: #31.  Create a LICENSE File.
.. _32.  Prepare a Master Disk.: #32.  Prepare a Master Disk.
.. _ W.B. Hewlett, "MuseData: Comprehensive representation for printing,
    sound, and analysis.": manual.bibliog.html
