.. image:: ../HumdrumIcon.gif
    :alt:
.. image:: ../HumdrumHeader.gif
    :alt: Humdrum
.. image:: ../HumdrumSpacer.gif
    :alt:


Frequently Asked Questions
==========================

The ` **Humdrum Toolkit**`_ is a set of software tools for music research.

This FAQ provides answers to frequently asked questions regarding Humdrum and
the Humdrum Toolkit.

This internet file is maintained by `David Huron`_, with input from Tim
Racinsky, Kyle Dawkins, and Jasba Simpson. Comments and suggestions are
welcome.

File last revised 2001, July 9.

--------

The following questions are addressed in this FAQ:

INDEX:

1.  `**What is Humdrum?**`_
2.  `**Can you say more?**`_
3.  `**What can Humdrum do?**`_
4.  `**Who will benefit from using Humdrum?**`_
5.  `**What computer systems does Humdrum run on?**`_
6.  `**Does Humdrum run on Macintosh systems?**`_
7.  `**How can I get a copy of Humdrum?**`_
8.  `**How can I access Humdrum via FTP?**`_
9.  `**What is the current version of Humdrum?**`_
10. `**How do I install Humdrum on my machine?**`_
11. `**How can I get a copy of Humdrum if I don't have HTTP access?**`_
12. `**Does it cost money?**`_
13. `**How big is the Humdrum Toolkit?**`_
14. `**What does the Toolkit include?**`_
15. `**What's contained in the Reference Manual?**`_
16. `**Is source code included in the distribution?**`_
17. `**How do you represent, say, a quarter-note in Humdrum?**`_
18. `**If that's so, how do users exchange data?**`_
19. `**Can you show an example of how to encode a piece of music in
    Humdrum?**`_
20. `**Okay, how might you encode the pitch and duration for a piece of
    music?**`_
21. `**What kinds of representations are pre-defined in Humdrum?**`_
22. `**How much music is encoded in Humdrum?**`_
23. `**What sort of repertoires are encoded?**`_
24. `**Are all of these repertoires available?**`_
25. `**Who else produces Humdrum databases?**`_
26. `**Can other musical databases be accessed using Humdrum?**`_
27. `**What do the Humdrum software tools do?**`_
28. `**Can you provide some examples of Humdrum processes?**`_
29. `**Can I search for a specific theme or motif?**`_
30. `**Does Humdrum import/export MIDI?**`_
31. `**Does Humdrum import/export Finale?**`_
32. `**Can Humdrum do automatic Roman-numeral type harmonic analysis?**`_
33. `**What else can't Humdrum do?**`_
34. `**Does Humdrum provide a graphic user interface?**`_
35. `**Is Humdrum easy to use?**`_
36. `**Why should I consider using Humdrum?**`_
37. `**I am a PC user who has had no experience with UNIX.**`_ How should
    I go about learning to use Humdrum?**
38. `**Where can I see Humdrum in action?**`_
39. `**Are there any seminars or courses that teach Humdrum?**`_
40. `**Where does Humdrum come from?**`_
41. `**How can I be kept informed about Humdrum?**`_

--------


1. What is Humdrum?
-------------------

Humdrum is a set of general-purpose software tools intended to assist music
researchers in posing and answering research questions. Humdrum allows
researchers to encode, manipulate, and output a wide variety of musically-
pertinent representations. The emphasis is on posing and answering questions
about music.

Humdrum is **not** (1) a MIDI sequencer, (2) a music printing package, or (3)
a computer sound synthesis language; however, Humdrum provides tools that
allow limited MIDI, notation, and Csound connectivity.

Humdrum allows users to pose and answer questions such as the following:

-   In Stravinsky, are dissonances more common in strong metric positions
    than in weak metric positions?
-   Is there evidence of greater metric syncopation in later Gershwin
    than in early Gershwin?
-   What passages of the original `Salve Regina' antiphon are preserved
    in the settings by Tomas Luis de Victoria?
-   In Urdu folk songs, how common is the so-called "melodic arch" --
    where phrases tend to ascend and then descend in pitch?
-   Which of the Brandenburg Concertos contains the B-A-C-H motif?
-   What are the most common fret-board patterns in guitar riffs by Jimi
    Hendrix?
-   Which of two English translations of Schubert lyrics best preserves
    the vowel coloration of the original German?
-   After the V-I progression, which harmonic progression is most apt to
    employ a suspension?
-   In what harmonic contexts does Handel double the leading-tone?
-   Are crescendos in Wagner more strongly associated with rising pitch
    than is the case for other composers?
-   Which of several MIDI performances displays the greatest contrast in
    dynamics between the initial thematic statement and the thematic return?

Only a few of the above questions are "easy" to answer using Humdrum.
Although the Humdrum tools may take just seconds to compute an answer for a
given problem, the primary impediment to quick solution is the user's skill
in interconnecting the right tools for the task at hand. `Detailed
documentation`_ (in both on-line and printed forms) is available to help
users develop fluency in using Humdrum.

--------


2. Can you say more?
--------------------

"Humdrum" is actually two things: (1) the *Humdrum Syntax* and (2) the
*Humdrum Toolkit*.

The *Humdrum Syntax* is a grammar for representing sequential symbolic
information using ASCII (text) data. Note that "Humdrum" is not a
representation scheme in the conventional sense -- like DARMS. Humdrum is a
*syntax* within which an endless number of representation schemes can be
defined. Theoretically, any type of sequential symbolic data may be
accommodated -- such as square notation, Schenkerian graphs, piano
fingerings, changes of emotional states, MIDI data, acoustic spectra, North
Indian tabla bols, ballet steps, concurrent television schedules, or
industrial chemical processes.

The *Humdrum Toolkit* is a set of more than 60 inter-related software tools.
These general-purpose tools manipulate ASCII (text) data that conforms to the
Humdrum Syntax. If the ASCII data represent music-related information, then
we can say that the Humdrum Tools manipulate music-related information. `On-
line documentation`_ is available describing each of the tools.

--------


3. What can Humdrum do?
-----------------------

Humdrum's capabilities are quite abstract, and so it is difficult to
characterize briefly what it can do.

Humdrum can encode information in various forms, such as French lute
tablatures, conducting gestures, or structural relationships. It can
transform, classify, coordinate, transfer, restructure, contextualize, and
otherwise manipulate both pre-defined and user-defined information.

Humdrum can be used to search for a mind-boggling variety of types of
patterns. For example, you can look for specific finger-fret combinations
(independent of the string, say) in a work for Indian sitar. Or you can look
for particular patterns of open and closed vowels in vocal lyrics that are
associated with a certain melodic contour, and are also anchored to a
specified metrical context.

Humdrum is also able to characterize the similarity between various types of
information according to user-defined criteria of similarity.

Humdrum's search and similarity commands are generalized software tools that
are independent of any given representation. As a consequence, these tools do
not impose any pre-defined notions of what you might want to search for, or
what properties you wish to compare.

Several hundred `concrete examples`_ of Humdrum's capabilities are described
on-line. In addition, several examples are given later in this document.

--------


4. Who will benefit from using Humdrum?
---------------------------------------

Humdrum will be of potential benefit to anyone wishing to pursue systematic
investigations of musical information. This includes the posing of "factual"
questions about music, and the testing of hypotheses about musical
organization.

In short, Humdrum may prove valuable to music theorists, music analysts,
ethnomusicologists, historical musicologists, psychomusicologists, music
librarians, dance scholars, linguists, and people who have a general interest
in music.

Humdrum is less well suited to individuals involved in creative (i.e.
generative) musical activities -- such as composition, conducting, or
performance. However, Humdrum is well suited to *studying* compositions,
conducting, performances ...

--------


5. What computer systems does Humdrum run on?
---------------------------------------------

Humdrum was designed for the UNIX operating system. It runs on a variety of
UNIX systems including Linux, HPUX, NeXTSTEP, etc. It also runs under Windows
'95, Windows '98, Windows NT, DOS and OS/2 -- provided basic UNIX commands
are available. For example, Humdrum runs on Microsoft systems that have
installed either the `MKS Toolkit', or the Consensys Corporation `Portage'
utilities. Humdrum has also been installed and used on Apple computer systems
(see below).

--------


6. Does Humdrum run on Macintosh systems?
-----------------------------------------


Mac OS 8/9
~~~~~~~~~~

Since Apple computer systems do not provide basic UNIX utilities, the Humdrum
Toolkit cannot be run on native Apple systems. There are three ways to
configure Apple hardware to run Humdrum. The least disruptive way to install
the Humdrum Toolkit is to purchase a commercial set of UNIX utilities for
Apple Systems. ` **Tenon Intersystems**`_ distributes a suitable product
called ` **MachTEN.**`_

A ` **review of the MachTEN software**`_ (including a comparison with A/UX)
was published in *Advanced Systems Magazine* (formerly *Sun World Magazine*).


Mac OS >
~~~~~~~~

Since Mac OS X is a flavor of UNIX, the Humdrum tools run fine from the
command line.
A/UX
~~~~

Humdrum can also run under APPLE's A/UX system.


Linux MK kernal (MkLinux)
~~~~~~~~~~~~~~~~~~~~~~~~~

Another possibility is to install the `**Linux MK kernal (MkLinux)**`_ for
Apple hardware.

These latter two approaches preclude running standard Apple software on the
machine. For this reason, purchasing MachTEN is usually considered the best
solution for Apple users.

--------


7. How can I get a copy of Humdrum?
-----------------------------------

You can `download Humdrum`_ from this site, or obtain it from the non-profit
` Center for Computer Assisted Research in the Humanities(CCARH)`_, at
Stanford University, CA.

--------


8. How can I access Humdrum via FTP?
------------------------------------

At present, Humdrum is not accessable via FTP, only `via HTTP`_.

--------


9. What is the current version of Humdrum?
------------------------------------------

The current official distribution for Humdrum is Version 1.0.

Humdrum continues to be up-dated by adding options to some tools, fixing
bugs, and augmenting the Toolkit with new commands. More recent versions
exist -- up to Version 2.6, however, these versions are not official
distributions. In order for a version to be designated "official," we test
all of the tools using extensive test suites on a wide variety of hardware
platforms, running different operating systems, and using different
compilers. This is a time-consuming process and can be done only when we have
funds to hire a programmer for about a month.

When making modifications to Humdrum, we don't know whether the modifications
we have made are fully portable to other systems. Without full-scale testing
of the software on a variety of platforms, it is not a good idea to replace
the former distributed version. Hence the discrepancy between the "official"
version and more current versions. Users are free to use later versions, but
we are not as confident that these later versions have the same portability
as version 1.0.

--------


10. How do I install Humdrum on my machine?
--------------------------------------------

It is **essential** to read the `*Humdrum Toolkit Installation Guide*`_.

For users who have downloaded Humdrum from the FTP site, the file
"install.txt" contains a complete ASCII text of the Installation Guide. If
you have access to a postscript printer, it is preferable to print the entire
installation guide (16 pages) from the FTP file "install.ps".

For users who have ordered disks by mail, the distribution disks are
accompanied by a printed Installation Guide.

--------


11. How can I get a copy of Humdrum if I don't have HTTP access?
----------------------------------------------------------------

Copies of the Humdrum Toolkit may be ordered on 1.4 Mb, 3-1/2 inch DOS disks
from the non-profit `Center for Computer Assisted Research in the Humanities
(CCARH)`_. The cost of the 3 disks, plus *Installation Guide* and shipping is
$10.00. A 552-page *Humdrum Reference Manual* may be purchased from CCARH for
$30.00 (plus shipping). The disks, *Installation Guide*, and *Reference
Manual* can be purchased for $40.00 (plus shipping). These prices are current
as of January 1, 1999. NOTE: The installation disks are available in DOS-
format only; the data are compressed and can be uncompressed only via a UNIX
"uncompress" program. This means that the Humdrum Toolkit DOS disks cannot be
installed on a DOS system unless appropriate UNIX utilities have already been
installed.

> ` Center for Computer Assisted Research in the Humanities,`_
Braun Music Center
Stanford University
Stanford, California 94305-3076

Revised pricing information and availability inquiries may be addressed to:

> Tel. (650) 725-9240

--------


12. Does it cost money?
-----------------------

The Humdrum Toolkit software itself is "free" -- but remains protected by
copyright. If you order Humdrum by mail, you will be asked to pay for the
cost of the disks, documentation, and mailing. On FTP the software is
available without charge.

Any serious user will want to have copies of the printed documentation,
including the *Humdrum Toolkit Reference Manual* and *Humdrum Toolkit User
Guide*. The reference manual is also available as postscript files on FTP,
and can be printed on a local postscript printer. The reference manual
entails about 550 pages of material. The `**Humdrum Toolkit User Guide**`_ is
also available on-line.

--------


13. How big is the Humdrum Toolkit?
-----------------------------------

The size of Release 1.0 is about 7 megabytes when uncompressed. This includes
printable postscript files for the manuals (approximately 3 megabytes). The
postscript files may be deleted after installation.

--------


14. What does the Toolkit include?
----------------------------------

The Humdrum Toolkit includes some 60 software tools, demonstration software,
a selection of about 150 musical scores, an *Installation Guide*, and a
*Reference Manual*.

--------


15. What's contained in the Reference Manual?
---------------------------------------------

The Humdrum Toolkit *Reference Manual* provides technical descriptions of
representation formats, file organizations, command invocations, options, and
other features for Release 1.0. The documentation includes sections on:

> -   Humdrum General Introduction (35 pages)
> -   Humdrum Representation Reference (180 pages)
> -   Humdrum Command Reference (260 pages)
> -   Regular Expression Reference (18 pages)
> -   Software Development Reference (15 pages)
> -   Bibliography (8 pages)
> -   Index (25 pages)

--------


16. Is source code included in the distribution?
------------------------------------------------

Yes.

About 15% of the code is written in C, another 15% in kornshell, and about 2%
using the LEX lexical parser and YACC compiler-compiler. The bulk of the code
is written in AWK (a fast prototyping language). C is used for tools that
have special I/O requirements and to accelerate some computationally
intensive tools.

--------


17. How do you represent, say, a quarter-note in Humdrum?
---------------------------------------------------------

The question is mal-formed. Humdrum doesn't dictate how to represent such
things as a quarter-note. Remember, that Humdrum is a *syntax* within which
representations can be defined. Users are free to use whatever string of
ASCII characters they want in order represent a quarter-note. The only
restriction is that the representation must conform to the Humdrum Syntax.

--------


18. If that's so, how do users exchange data?
---------------------------------------------

Actually, there are a large number of pre-defined representations each
conforming to the Humdrum Syntax. Users aren't required to use these pre-
existing representations, but they are generally more convenient than
starting from scratch. Think of these predefined representations as analogous
to macro packages.

Each representation conforming to the Humdrum Syntax is given a unique name,
preceded by two asterisks. For example, "**freq" is a pre-defined
representation used to represent frequency; "**pcset" is a pre-defined
representation used to represent pitch-class sets; "**cocho" is a pre-defined
representation used to represent basilar-membrance coordinates in the
cochlea. There are lots of these pre-defined representations.

To answer the previous question: in the "**recip" representation, quarter-
notes are represented by the ASCII numeral "4" (the reciprocal of the
American duration names). But remember, HUMDRUM, does not require you to
represent quarter-notes this way. Only the "**recip" representation requires
this. If you prefer "crotchet" to "quarter note", Humdrum obliges.

--------


19. Can you show an example of how to encode a piece of music in Humdrum?
-------------------------------------------------------------------------

Still not catching on. There are an infinite number of ways of representing a
piece in the Humdrum format -- it depends on what sort of information the
user is interested in. Some users will be interested in stem-direction and
size of note-heads. Other users will be interested in representing the valve-
combinations for the trumpet part.

For example, here is an encoding of a complete sonata-allegro movement that
conforms to the Humdrum syntax:

> **form
> Introduction
> Exposition
> Development
> Recapitulation
> Coda
> *-

Probably not what you had in mind.

--------


20. Okay, how might you encode the pitch and duration for a piece of
    music?
---------------------------------------------------------------------------

Currently, the most commonly used Humdrum representation is `**kern.`_ Kern
is a core pitch/duration representation. Below is a **kern representation
showing the beginning of "Happy Birthday." In addition, we've represented the
lyrics as well:

> ``**kern``**lyrics``
> ``8.g``Hap-``
> ``16g``py``
> ``4a``birth-``
> ``4g``day``
> ``4cc``to``
> ``2b``you.``
> ``8.g``Hap-``
> ``16g``py``
> ``4a``birth-``
> ``4g``day``
> ``4dd``to``
> ``2cc``you.``
> ``*-``*-``

Note the following: Time moves down the page. Data are arranged in columns
(called "spines") beginning with a keyword (e.g. **kern) indicating the type
of representation. Data are terminated by a "spine-path terminator" (*-).
Each line represents concurrent activities across all spines. Spines are
separated by tabs. In the case of **kern, durations are represented by the
reciprocal numbers of the American designations (4=quarter, 2=half; 8
.=dotted-eighth). Pitches are represented by letter names (a-g and A-G).
Lower-case letters indicate pitches above (and including) middle C; upper-
case letters indicate pitches below middle C. Letters are repeated (e.g. "cc"
or "CC") for each successive octave distance from middle C. Although not
shown in the above example, **kern is also able to represent rests, ties,
phrases, slurs, keys, key signatures, meter signatures, keys, accidentals,
articulation marks, stem directions, beaming, barlines, and ornaments.

The following example shows the first and last two measures for Fugue 20 from
the *Well-Tempered Clavier* Vol. II:

> ``!! J.S. Bach, WTC Book II, Fugue 20; BWV 889b``
> ``**kern``**kern``**kern``
> ``*k[]``*k[]``*k[]``
> ``*a:``*a:``*a:``
> ``*M4/4``*M4/4``*M4/4``
> ``*MM72``*MM72``*MM72``
> ``=1``=1``=1``
> ``4r``1r``1r``
> ``4e``.``.``
> ``4c``.``.``
> ``4f``.``.``
> ``=2``=2``=2``
> ``4G#``1r``1r``
> ``4r``.``.``
> ``8r``.``.``
> ``8d``.``.``
> ``8B``.``.``
> ``8e``.``.``
> ``!! Skipping ahead to measure 27:``
> ``=27``=27``=27``
> ``8r``8E``8r``
> ``8Dn``8r``32r``
> ``.``.``32e``
> ``.``.``32f#``
> ``.``.``32g#``
> ``8BB``4r``8.g#T``
> ``8E``.``.``
> ``.``.``32f#``
> ``.``.``32g#``
> ``8C``8r``[2a``
> ``8AA``32r``.``
> ``.``32B``.``
> ``.``32c``.``
> ``.``32d``.``
> ``8EE``8.c#T``.``
> ``8GG``.``.``
> ``.``32B``.``
> ``.``32c#``.``
> ``=28``=28``=28``
> ``32FF``8d``8a]``
> ``32EE``.``.``
> ``8DD``.``.``
> ``.``8f``8b``
> ``32EE``.``.``
> ``32FF``.``.``
> ``8.EET``8G#``8e``
> ``.``8B``8g#``
> ``32DD``.``.``
> ``32EE``.``.``
> ``2AAA; 2AA;``2c; 2e;``2a;``
> ``==``==``==``
> ``*-``*-``*-``

Lines beginning with a double exclamation mark are "global comments" and
pertain to all spines. ("Local comments" pertain to single columns or
spines.) Following the "exclusive interpretation" (**kern), several "tandem
interpretations" specify the key-signature (*k[]), the key (*a:), the meter
signature (*M4/4), and the tempo (*MM72). Barlines are indicated by an
equals-sign. Rests are indicated by the lower-case letter `r'. Columns of
data (spines) are separated by tabs. In this case, each spine represents a
different musical part or voice. Parts are ordered from left-to right with
the lowest voice in the left-hand spine. In the final chord, double-stops
(two pitches) are evident in the lower two voices. When only one voice is
active, the other voices encode "null tokens" (.) as place holders. The file
is structured like a score turned sideways. Whole-tone trills are designated
by the upper-case `T'; tied notes are designed by square brackets; pauses are
indicated by the semicolon.

Remember, we have highlighted only the **kern representation. This is only
one of a (potentially infinite) number of representations consistent with the
Humdrum Syntax. Do not mistake **kern for Humdrum.

--------


21. What kinds of representations are pre-defined in Humdrum?
-------------------------------------------------------------

There are currently independent pre-defined representations for such data as:
pitch, frequency, MIDI, cents, semitones, pitch-class, German Tonhoene,
French solfege, chroma, absolute and relative scale degree, fretted-
instrument tablatures, figured bass, functional harmony, embellishment tones,
melodic accent, harmonic and melodic intervals, sensory dissonance, dates,
elapsed duration, time-spans, metric position, sequential event ordering,
canonical note durations, metric syncopation, beat-position, time, rhythmic
prototypes, parametric and non-parametric similarity, sound pressure level,
relative amplitude, spectral content, spectral centroid, dynamics, pitch-
class set, normal form, interval vectors, textual underlay, plus many others.

Remember that users are free to concoct their own task-specific
representations -- such as a scheme to represent Telugu notation or Dagomba
dance. Humdrum representations may be very highly crafted, or they may be
invented in a matter of seconds. It is common to generate "throw-away"
representations that are used only for a single research task.

--------


22. How much music is encoded in Humdrum?
-----------------------------------------

There are currently roughly 10,000 encoded works consistent with the Humdrum
syntax -- most in the **kern representation.

--------


23. What sort of repertoires are encoded?
-----------------------------------------

Gregorian chant, Cantigas de Santa Maria, School of Notre Dame polyphony,
vocal works by Machaut, Morley, Dunstable, Power, Schubert, Brahms, Weber,
Foster. Traditional British folk ballads, Kentucky folk organum, Barbershop
quartets, hymns; instrumental works by JC Bach, JS Bach, WF Bach, Beethoven,
Brahms, Buono, Buxtehude, Corelli, Chopin, Clementi, David, Debussy, Dowland,
Dvorak, Fischer, Franck, Frescobaldi, Froberger, Gabrieli, Granados, Grieg,
Handel, Haydn, Josquin, Liszt, Mattheson, Mendelssohn, Merulo, Mozart,
Nielsen, Pachelbel, Reger, Scheidt, Schoenberg, Schubert, Schumann, Sibelius,
Soriano, Sweelinck, Telemann, Webern, Weckmann.

Non-western music from Bali, Burma, Cameroon, Caucacus, China, Columbia,
Japan, Korean, Tahiti, Thailand, and from Pondo, Venda, Xhosa, and Zulu
cultures. Refer to the following ` repertoire list`_.

--------


24. Are all of these repertoires available?
-------------------------------------------

No. Some of the encoded data are proprietary or restricted by copyright and
so not likely to be released in the near future. About 6,500 encoded works
are available.

--------


25. Who else produces Humdrum databases?
----------------------------------------

The `Center for Computer Assisted Research in the Humanities (CCARH)`_ has
encoded large databases of musical score information. The databases are high
quality electronic editions suitable for scholarship. These "MuseData" (TM)
databases represent a major resource for music research. CCARH has begun
making portions of their databases available to music scholars. Currently,
the following repertoires are available:

> -   J.S. Bach, Chorale Harmonizations
> -   J.S. Bach, Brandenburg Concertos (Bach Gesellschaft edition)
> -   Archangelo Corelli, Trio Sonatas
> -   Antonio Vivaldi, Violin Concertos (including The Four Seasons)
> -   Essen Folk melody collection (more than 6,000 European folksongs)

Further releases of data are expected. For further information contact:

> ` Center for Computer Assisted Research in the Humanities,`_
Braun Music Center
Stanford University
Stanford, California 94305-3076

(MuseData Ordering information, telephone: 1-800-JSB-MUSE)

--------


26. Can other musical databases be accessed using Humdrum?
----------------------------------------------------------

Currently, there are a handful of software tools that translate from various
formats to Humdrum. Music encoded in Leland Smith's SCORE format can be
translated to Humdrum using a program written by Andreas Kornstaedt of the
University of Hamburg. Music encoded in Helmut Schaffrath's ESAC
representation (Essen Associative Code) can also be translated to Humdrum.
Another program can translate Barry Brook's Plaine and Easie Code (used by
RILM) to Humdrum.

These translation tools are not currently distributed as part of the Humdrum
Toolkit. They are available by special request.

--------


27. What do the Humdrum software tools do?
------------------------------------------

Nearly all Humdrum commands accept some Humdrum-format input(s) and produce
some corresponding Humdrum-format output. This means that information can be
processed through a series of successive Humdrum commands.

--------


28. Can you provide some examples of Humdrum processes?
-------------------------------------------------------

Here are some examples of simple Humdrum pipelines.

The following command extracts all woodwind parts from the file "ives":

> `` extract -i '*ICww' ives ``

The following command identifies the frequency of light-related words such as
"lumen" or "lumine" in the different monastic offices for Thomas of
Canterbury:

> `` extract -i '*Latin' office* | egrep -ic 'lum.+n[e]*$' ``

The following command outputs the location of all sonorities in the file
"machaut" where the leading-tone has been doubled:

> `` deg -x machaut | grep -n '7.*7' ``

The following commands identify all phrase-endings in the file "wagner" that
are approached by a descending semitone:

> `` semits -xt wagner | fill > temp
assemble wagner temp | grep -n '}.*-1[^0-9]' ``

The following commands identify German, French, and Italian sixth chords.

> `` solfa -x input | fill -s = | grep '.*6-.*4+' | grep '3-' [German]
solfa -x input | fill -s = | grep '.*6-.*4+' | grep '2' [French]
solfa -x input | fill -s = | grep '.*6-.*4+' | grep '[^23]' [Italian] ``

A common musicological task is searching for various patterns. The `patt' and
`pattern' commands accept a user-specified template file such as the
following:

> `` P5
P5 ``

Given the above two-line file ("template"), the following command will
identify all instances of parallel fifths between the bass and alto parts for
the file "caccini":

> `` extract -i '*bass,*alto' caccini | hint -c | pattern -s = -f template ``

Given the following three-line "template" file:

> =
.* +
sus ``

... the following command outputs the measure numbers where suspensions are
found in the file "bwv552":

> `` extract -i '**embel' bwv552 | patt -e -f template | grep '=' ``

The following command produces an inventory of all pitch-class sets evident
for successive vertical sonorities in the file "opus24". In this case, only
Z-related sets are requested in the inventory:

> `` pc opus24 | fill -s = | pcset | grep 'Z' | sort | uniq ``

The following script command finds all instances of 12-tone rows in Webern's
Opus 24:

> `` matrix -n 12 prime
rowfind opus24 ``

The following command outputs the final two measures for all works in the
current directory; the output is played as a MIDI output.

> `` yank -o ^= '$-1-$' * | midi | perform ``

The above examples are mostly simple one-line invocations, and do not begin
to exhaust Humdrum's capabilities. ` Further sample problems`_ using Humdrum
are available on the web.

--------


29. Can I search for a specific theme or motif?
-----------------------------------------------

Yes. There are innumerable ways of defining a "theme" or "motif." Typically,
motives are thought of as pitch/duration patterns. However, motivic instances
typically appear at different pitch heights, in transpositions, different
modes, in augmentation, and so on. Hence, a motif might be better defined as
an interval/duration pattern, or as an interval/relative-duration pattern, or
as a diatonic interval pattern, a pitch-contour pattern, a metric pattern,
etc. Searching for any such patterns is trivial using Humdrum. Most such
searches can be accomplished by executing a one-line shell-level command.

Humdrum also allows the user to constrain pattern searches by looking for
combinations of information. For example, the user might seek only those
pitch patterns that exhibit certain sequences of articulation marks, are
anchored in some specified way to a phrase boundary, and/or are accompanied
by certain harmonies.

Pattern searches need not be melodically oriented (horizontal search).
Searches can also be vertical, or even diagonal (e.g. a Klangfarbenmelodie --
a melody that traverses between several instruments). Patterns may also be
combinations of horizontal, vertical, and diagonal. For example, find all
instances of a lowered seventh based a subdominant root approaching a V
chord, when the oboe and bassoon are playing, but not at the beginning of a
phrase.

In addition to exact pattern matches, Humdrum provides tools that allow
matches with passages that are *similar* but not identical to the sought
pattern. Patterns can be sought in which embellishments have been added to
specified structural elements. Patterns of patterns, and patterns of patterns
of patterns can be studied.

--------


30. Does Humdrum import/export MIDI?
------------------------------------

Yes. Humdrum can important MIDI data via the `record' and `encode' commands.
`Record' allows the recording of raw MIDI data in the Humdrum format.
`Encode' permits the user to map real-time MIDI activity to any user-defined
Humdrum representation.

Humdrum can export MIDI data via the `smf' and `perform' commands. `smf' is
used to generate Standard Midi Files which can be imported to other
applications software -- such as MIDI sequencers or notation packages. The
`perform' command plays Humdrum-format MIDI information in real-time.

In order to use the Humdrum MIDI capabilities, you must have access to an
MPU-401 compatible MIDI card. Currently, the Humdrum MIDI tools only work
under DOS, Windows 95/98/NT, and Linux..

--------


31. Does Humdrum import/export Finale?
--------------------------------------

See the commands `hum2fin`_ and `fin2hum`_.

--------


32. Can Humdrum do automatic Roman-numeral type harmonic analysis?
------------------------------------------------------------------

Not currently. A program to do automatic functional analysis is being
developed by Craig Sapp.

--------


33. What else can't Humdrum do?
-------------------------------

Humdrum has only limited abilities to print musical scores. The Humdrum
**ms** tool generates output suitable for the commercial "Mup" notation
package. Humdrum users wishing to have postscript notational output must
purchase "Mup" (cost $29) from `Arkkra Enterprises`_.

Although Humdrum might be used in high-level aspects of composition, Humdrum
is not well suited to very low-level acoustical (sound-function)
manipulations common in electroacoustic music.

Remember that Humdrum's emphasis is on *posing* and *answering* research
questions rather than *displaying* or *formatting* information. Suitable
questions might be theoretical, analytic, historical, ethnographic,
stylistic, perceptual, cognitive, or whatever.

--------


34. Does Humdrum provide a graphic user interface?
--------------------------------------------------

A general graphic user interface for Humdrum has been developed by Michael
Taylor of Queen's University, Belfast. The Taylor interface features pull-
down help menus and on-line assistance in constructing and launching analytic
tasks. The Taylor interface runs under MS Windows. Distribution and pricing
arrangements have not yet been announced. Mr. Taylor may be reached at:
wmt@bfs.Unibol.com

--------


35. Is Humdrum easy to use?
---------------------------

Humdrum is rooted in the UNIX "software tools" design philosophy. That is,
each tool in the toolkit carries out a simple operation. However, by
interconnecting the tools, the capacity for music processing is legion. In
essence, assembling Humdrum command lines amounts to a form of computer
programming. Learning Humdrum is comparable in complexity to learning a
programming language such as pascal or C.

Users who understand the concept of a UNIX pipeline, will readily grasp how
Humdrum works. Users who are familiar only with menu-driven software will
find Humdrum takes some time to learn. An ` on-line course`_ is available to
learn Humdrum.

The graphic user interface developed by Michael Taylor considerably
simplifies the use of Humdrum -- especially for inexperienced users.
Graphical approaches clearly hold much promise, especially if the generality
of Humdrum remains accessible.

Another graphical approach has been pioneered by Andreas Kornstaedt.
Kornstaedt has suggested that the Humdrum be used as the analytic engine for
task-specific applications that are designed for use by ordinary
musicologists. For example, Kornstaedt has developed a graphical environment
("Ring") for doing Leitmovic analysis of Wagner operas. The user interacts
only with a graphical environment tailored to particular kinds of tasks.
Although this approach does not allow access to Humdrum's full capabilities,
it may be of greater appeal to music scholars with little programming
experience.

--------


36. Why should I consider using Humdrum?
----------------------------------------

The principal reasons for using computers in music scholarship are the
following:

> 1.  the computer increases your scholarly productivity,
> 2.  the computer lets you address problems that are otherwise impossible to
pursue.

Not every musicologist will benefit from using Humdrum. It depends on the
types of tasks in which the user is interested.

--------


37. I am a PC user who has had no experience with UNIX.
-------------------------------------------------------

How should I go about learning to use Humdrum?

Understanding UNIX is an essential pre-requisite to the lucid use of Humdrum.
If you do not have access to a UNIX system, you can purchase a set of
commercial UNIX utilities that will operate on your PC. The recommended
utilities are available in the "MKS Toolkit" -- which you can purchase in
most university computer stores. (In the case of Windows NT, Humdrum should
also work under Consensys Corporation's "Portage".)

The essential foundation for using Humdrum includes:

> 1.  knowledge of how to use a text editor -- such as "vi" or "emacs"
> 2.  knowledge of how to define and manipulate "regular expressions" (a
standard UNIX syntax for defining patterns)
> 3.  knowledge of how to read and interpret manual pages ("man")
> 4.  familiarity with UNIX "pipelines"

Wordprocessors can be used in lieu of an editor, provided ASCII text is
handled properly. Many wordprocessors treat carriage returns and tabs in
irregular ways -- although most wordprocessors allow the user to override
these defaults. For example, Microsoft Word can be used provided you invoke
the "save as text file" option.

Note that Microsoft "edit" (comes with DOS) is unsuitable for Humdrum since
it insists on replacing ASCII tabs by spaces.

--------


38. Where can I see Humdrum in action?
--------------------------------------

A 50-minute VHS videotape is available that demonstrates many of the types of
manipulations that can be carried out using the Humdrum Toolkit. The
videotape is available in the North American NTSC format only, and can be
ordered for minimal cost.

--------


39. Are there any seminars or courses that teach Humdrum?
---------------------------------------------------------

Humdrum seminars have been offered at several universities. A two-day Humdrum
seminar will be given at Stanford University from April 15th and 16th, 1999.

For further information contact:

> ` Center for Computer Assisted Research in the Humanities,`_
Braun Music Center
Stanford University
Stanford, California 94305-3076

In addition, an ` on-line course`_ is available to help users learn Humdrum.

--------


40. Where does Humdrum come from?
---------------------------------

Humdrum was designed and originally programmed by David Huron. The Humdrum
Toolkit was extensively revised and augmented with the assistance of Tim
Racinsky and Kyle Dawkins.

--------


41. How can I be kept informed about Humdrum?
---------------------------------------------

"Humdrum News" is an electronic newsletter for Humdrum users and those
contemplating using the Humdrum Toolkit. The newsletter contains regular
announcements, brief articles, and tutorials describing various ways of using
the toolkit. Subscriptions are free.

Both snail-mail and e-mail mailing lists are maintained. You can receive
direct information concerning Humdrum by sending your name, address, and
e-mail address to huron.1@osu.edu (please ignore the umlauts: they are
present to foil web crawlers).

If you are reading this document in printed form and have no access to
electronic mail, you can send the above information to:

> `David Huron`_,
School of Music
1866 College Road
Ohio State University
Columbus, Ohio 43210
U.S.A.

--------




-   ` **Humdrum Home Page**`_
-   ` **Humdrum Toolkit User's Guide**`_
-   ` **Humdrum Command Reference**`_

(C) Copyright 1999 David Huron

.. _Humdrum Toolkit: index.html
.. _David Huron: http://csml.som.ohio-state.edu/Huron/Huron.html
.. _What is Humdrum?: #Humdrum
.. _Can you say more?: #Say_More
.. _What can Humdrum do?: #Do
.. _Who will benefit from using Humdrum?: #Who_Benefit
.. _What computer systems does Humdrum run on?: #Systems
.. _Does Humdrum run on Macintosh systems?: #Macintosh
.. _How can I get a copy of Humdrum?: #Copy
.. _How can I access Humdrum via FTP?: #FTP
.. _What is the current version of Humdrum?: #Version
.. _How do I install Humdrum on my machine?: #Install
.. _How can I get a copy of Humdrum if I don't have HTTP access?:
    #Other_Access
.. _Does it cost money?: #Cost
.. _How big is the Humdrum Toolkit?: #Size
.. _What does the Toolkit include?: #Include
.. _What's contained in the Reference Manual?: #Documentation
.. _Is source code included in the distribution?: #Source_Code
.. _How do you represent, say, a quarter-note in Humdrum?: #Quarter_Note
.. _If that's so, how do users exchange data?: #Exchange_Data
.. _Can you show an example of how to encode a piece of music in
    Humdrum?: #Example
.. _Okay, how might you encode the pitch and duration for a piece of
    music?: #Kern
.. _What kinds of representations are pre-defined in Humdrum?:
    #Predefined
.. _How much music is encoded in Humdrum?: #Volume
.. _What sort of repertoires are encoded?: #Repertoire
.. _Are all of these repertoires available?: #Availability
.. _Who else produces Humdrum databases?: #Databases
.. _Can other musical databases be accessed using Humdrum?:
    #Other_Databases
.. _What do the Humdrum software tools do?: #Tools_Do
.. _Can you provide some examples of Humdrum processes?: #Processing
.. _Can I search for a specific theme or motif?: #Searching
.. _Does Humdrum import/export MIDI?: #MIDI
.. _Does Humdrum import/export Finale?: #Finale
.. _Can Humdrum do automatic Roman-numeral type harmonic analysis?:
    #Harmony
.. _What else can't Humdrum do?: #Not_Do
.. _Does Humdrum provide a graphic user interface?: #Interface
.. _Is Humdrum easy to use?: #Easy
.. _Why should I consider using Humdrum?: #Why
.. _I am a PC user who has had no experience with UNIX.: #UNIX
.. _Where can I see Humdrum in action?: #Video
.. _Are there any seminars or courses that teach Humdrum?: #Seminars
.. _Where does Humdrum come from?: #Where
.. _How can I be kept informed about Humdrum?: #Information
.. _Detailed documentation: guide.toc.html
.. _On-line documentation: commands.toc.html
.. _concrete examples: problems.html
.. _Tenon Intersystems: http://www.tenon.com
.. _MachTEN.: http://www.tenon.com/products/machten/
.. _review of the MachTEN software:
    http://www.opus1.com/www/jms/machten.html
.. _Linux MK kernal (MkLinux): http://www.mklinux.apple.com/
.. _download Humdrum: ../HumdrumDownload/downloading.html
.. _ Center for Computer Assisted Research in the Humanities(CCARH):
    http://musedata.Stanford.edu
.. _via HTTP: http://csml.som.ohio-
    state.edu/HumdrumDownload/downloading.html
.. _Humdrum Toolkit Installation Guide: install.html
.. _      Center for Computer Assisted Research in the Humanities,:
    http://www.ccarh.org
.. _**kern.: representations/kern.html
.. _ repertoire list: http://csml.som.ohio-
    state.edu/Music824/databases.index.html
.. _hum2fin: commands/hum2fin.html
.. _fin2hum: commands/fin2hum.html
.. _Arkkra Enterprises: http://www.arkkra.com/
.. _ on-line course: http://csml.som.ohio-
    state.edu/Music824/music824.html
