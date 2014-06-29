.. ####### AUTOMATICALLY GENERATED TEXT, DO NOT EDIT ######

.. |rarrow| unicode:: 0x21d2
	:trim:

.. |nbsp| unicode:: 0xA0
	:trim:

.. Humdrum Extras Chapter Sequence:
	1:	Introduction
	2:	Rhythm and Time
	3:	Melody and Pitch
	4:	Harmony
	5:	Data Entry
	6:	Music Searching
	7:	MIDI Rendering
	8:	Notation Rendering
	9:	Other Useful Tools

.. Section counters for the "Rhythm and Time" chapter:
	1:	**kern and **recip Extensions
	2:	Rhythm scaling
	3:	Composite rhythms

.. ########################################################################

===========================================================================
2. Rhythm and Time
===========================================================================

This chapter discusses various concepts and Humdrum Extras tools
related to rhythm and time.


2.1. Extensions to `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ and `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ rhythms
===========================================================================


Humdrum Extras programs recognize an extension to `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_
and `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ rhythm representations which allows any rational
rhythm to be encoded.  A majority of rhythms found in printed music
can be represented in standard `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ data.  For example
a dotted quarter-note is encoded as ``4.`` and a quintuplet sixteenth
note is ``20``.  Such rhythms are based upon integral divisions of
the whole note.  The value ``4`` means 1/4th of a whole note; ``4.``
means 1/4 of a whole note plus half of that (1/8 of a whole note).
Rhythms which are composed of equal divisions of whole notes plus
augmentation dots can be represented in this system. But a problem
occurs when trying to represent other rhythms as illustrated in
Example 2.1, like triplet whole-notes or non-power-of-two
tuplet bases.


.. :Example:Start: 2.1

**Example 2.1:** Difficult rhythms to represent in 
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ data.

.. image:: rhythm.rstd/Example_53eighth/53eighth.svg
	:align: center
	:width: 100%

.. :Example:End: 2.1


|
|

In other words when `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ encodes reciprocal durations
of rhythms, the durations must always have a 1 in the numerator
(excluding duration additions from augmentation dots).  For example
an eighth note is represented in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ or `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_
data as ``8``.  This means that the duration of an eighth note is
1/8th that of a whole note.  Likewise, ``12`` means 1/12 of a whole note
which translates musically into "triplet eighth-notes".  Here is a
demonstration of the calculations that relate ``12`` to a "triplet
eighth-note":

.. math::

	12 = \frac{1}{\frac{1}{8} \times \frac{2}{3}}

"1/8" is an eighth-note duration, and "2/3" is the tuplet relation of "three 
notes in the time of two", or a "3:2" tuplet.  By analogy, 5:3-tuplet
eighth notes have the reciprocal duration of 40/3:

.. math::

	\frac{40}{3} = \frac{1}{\frac{1}{8} \times \frac{3}{5}}

This means that a 5:3-tuplet eighth note is equal to 3/40ths of a
whole note.  Notice that this duration is not a integral division
of the whole note since the numerator of the duration (or the
denominator in the reciprocal duration) is not 1.  The difficulty
in the standard `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ representation is that it includes
a default value of 1 for the denominator of the reciprocal duration
since only integers are allowed for rhythms in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_
data.  The quarter note value ``4`` is more generally the ratio 4/1
with the "/1" implied in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ data. The Humdrum Extras
programs allow for the denominator to be any other positive integer.
In order to represent the duration 3/40 in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ data,
the symbol ``40%3`` can be used, where the ``%`` sign indicates a
reciprocal duration ratio with a denominator other than one is being
represented.

.. :Table:Start: 1

**Table 2.1:** Sample rational encodings of
rhythms in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ and `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ representations.

.. csv-table::
	:header: Encoding, Reciprocal dur., Dur. (whole-note units), Musical name

	``4``,	4/1,	1/4, 	Quarter note
	``4%1``,	4/1,	1/4, 	Quarter note
	``8%2``,	4/1,	1/4, 	Quarter note
	``4.``,	4/1 + dot |rarrow| 8/3,	1/4 + dot |rarrow| 3/8, 	Dotted quarter-note
	``1%2``,	1/2,	2/1,	Breve (double whole-note)
	``1%4``,	1/4,	4/1,	Longa (quadruple whole-note)
	``1%8``,	1/8,	8/1,	Maxima (octuple whole-note)
	``40%3``,	40/3,	3/40,	5:3-tuplet eighth-note
	``3``,		3/1,	1/3,	Triplet half-note
	``7``,		7/1,	1/7,	Septuple quarter-note
	``7%2``,	7/2,	2/7,	Septuple half-note
	``7%3``,	7/3,	3/7,	7:3-tuplet whole-note
	``3%2``,	3/2,	2/3,	Triplet whole-note
	``3%2.``,	3/2+dot |rarrow| 1/1,	2/3+dot |rarrow| 1/1,	Dotted triplet whole-note
	``1``,		1/1,	1/1,	Whole-note
	``3%4``,	3/4,	4/3,	Triplet breve
	``16%3``,	16/3,	3/16,	4:3-tuplet quarter-note
	``8.``,		8/1+dot |rarrow| 16/3, 1/8+dot |rarrow| 3/16, Dotted eighth-note

.. :Table:End: 2.1

Notice that the duration 3/16 at the bottom of the table can represent
both 4:3-tuplet quarter notes and dotted eighth-notes (both have a
duration of 0.75 quarter notes).  The augmentation dot count is
necessary in order to determine the musical name of the duration.

The rational-duration extension to the `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ representation
is mostly backwards-compatible with `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_.  The ``%``
sign is a user signifier in `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_, meaning it does not
have a fixed meaning, and can be given a temporary meaning.  For
the rational rhythm extension this character is reserved to separate
the two integers in a reciprocal duration value.  Example
2.2 shows the method for generating compatible
rhythms for standard Humdrum Tools that don't recognize the extension
use the `rscale <http://extras.humdrum.org/man/rscale>`_ program to scale the rhythm to a timebase
which does not require the extension.  For example if the duration
of triplet whole-notes are decreased by half, they become triplet
half-notes which are representable in the standard `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_
system.


.. :Example:Start: 2.2

**Example 2.2:** Halving note duration in a
`\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ score to remove rational rhythms.  The ``-o``
option will read the ``!!rscale: 1/2`` structured global command
to return the the original rhythmic scale after processing with
Humdrum Toolkit programs.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/Example_halve/tripletwholenotes.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/rscale>rscale</a> -f 1/2</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/Example_halve/triplethalfnotes.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/Example_halve/triplethalfnotes.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/rscale>rscale</a> -o</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/Example_halve/tripletwholenotes-original.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

.. :Example:End: 2.2


"Zero" extension to `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ rhythm interpretation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A different extension to the `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ rhythm representation
uses the symbol ``0`` (zero) for breves (double whole notes).
Note that ``q`` is used to represent grace notes with a zero notated
duration.  Most rhythm-parsing Humdrum Toolkit programs (such as
`census <http://www.humdrum.org/Humdrum/commands/census.html>`_) recognize this zero convention.  By extension, the
symbol ``00`` represents a longa (quadruple whole note), and ``000``
represents a maxima (octuple whole note); however, most Humdrum
Toolkit rhythm-parsing programs do not understand these longer
durations.  The Humdrum Extras programs will recognize all such
rhythms, and will increase the power-of-two to parse ``0000``,
``00000`` or larger exotic rhythm values:


.. :Example:Start: 2.3

**Example 2.3:** Duration of various large rhythms
in quarter-note units using the "zero" representation.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/Example_zerobig/zero.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/beat>beat</a> -d</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/Example_zerobig/zero-beat-d.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

.. :Example:End: 2.3


Compare this to durational equivalents in the rational representation
in Example 2.4, where the analyzed durations of the
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ rhythms in the right column match to those in
Example 2.3.


.. :Example:Start: 2.4

**Example 2.4:** Duration of various large rhythms in quarter-note units using
the rational representation.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/Example_ratbig/zero-rational.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/beat>beat</a> -d</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/Example_ratbig/zero-rational-beat-d.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

.. :Example:End: 2.4


Nested tuplets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Nested tuplets are a recursive representation of rhythm which allows
for iterative non-binary subdivisions.  It is a further generalization
of rhythm that is not accounted for in the `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_
representation.  Consider the music in Example 2.5
where quintuplets and septuplets are further subdivided into other
tuplets.  In the top part of the example, the third quintuplet
quarter-note is further divided into triplets, with two of those
triplet notes even further subdivided into a quintuplet.


.. :Example:Start: 2.5

**Example 2.5:** Nested tuplets, with notes equal to
1/50 of a whole note marked in red (see Example 2.7
for the `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ representation of this music).

.. image:: rhythm.rstd/Example_messy/messy.svg
	:align: center
	:width: 50%

.. :Example:End: 2.5


|
|

The reciprocal durations of the shortest notes on the top line of
Example 2.5 (highlighted in red) are ``50`` in the
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ representation.  The following equation demonstrates
the process of dividing the quarter note three successive times to
arrive at this rhythm value: the quarter note is first subdivided
by 3/5 then by 1/2 and finally by 2/5:

.. math::

	50 = \frac{1}{\frac{1}{4} \times \left[\left(\frac{3}{5}\right)\left(\frac{1}{3}\right)\left(\frac{2}{5}\right)\right]  } = 4 \times \left[\left(\frac{5}{3}\right)\left(\frac{3}{1}\right)\left(\frac{5}{2}\right)\right] = 4 \times \frac{25}{2}

Going from `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ data to graphical music notation poses
a problem in the general case, since the ordering of the subdividing
factors are not specified in the data token ``50``.  In other words,
this rhythm can be approached from any number of tuplet subdivisions
of notes.  Consider the smallest notes in Example 2.6.
These are also represented as ``50`` rhythms, as can be seen in the
following equation:

.. math::

	50 = 4 \times \left[\left(\frac{5}{4}\right)\left(\frac{2}{1}\right)\left(\frac{5}{1}\right)\right] = 4 \times \frac{25}{2}


.. :Example:Start: 2.6

**Example 2.6:** Alternate notational interpretation of the
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ token ``50`` (highlighted in red).

.. image:: rhythm.rstd/Example_nested2/nested2.svg
	:align: center
	:width: 50%

.. :Example:End: 2.6


|
|

In order to disambiguate such cases, the ordering of the factors
within the brackets in the above equations must be known.  This can
be done with tuplet layout codes in Humdrum data which give clues
to notation renders on how to organize the notation.  Layout codes
are structured local comments which start with ``!LO:``, followed
by the specific layout code, which is ``TUP`` for tuplets, followed by
a colon-separated list of parameters for the layout code.  Example
2.7 show the music of Example 2.5
encoded as Humdrum `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ data.  The layout code in the
second spine on line 4 of the file (``!LO:TUP:r=2.:t=5``) indicates
the outer quintuplet bracket.  The ``r=2.`` parameter is the rhythm value
(reciprocal duration) of the bracket, and the second parameter,
``t=5`` indicates that the tuplet's duration will be split into 5
equal parts.


.. :Example:Start: 2.7

**Example 2.7:** `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ encoding of the
music in Example 2.5, including tuplet layout codes.

.. raw:: html

	<table width="100%">
	<tr><td colspan="3">
	<div class="humDiv">
	<table class="humTable">
	<tr valign="baseline" class="humLine humExinterp"><td class=" humTok  humSSkern humTr1 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr2">**kern</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*clefX</td><td class=" humTok  humSSkern humTr2">*clefX</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*M3/4</td><td class=" humTok  humSSkern humTr2">*M3/4</td></tr>
	<tr valign="baseline" class="humLine humLcom"><td class=" humTok  humSSkern humTr1 humTrackpad">!LO:TUP:r=2.:t=7</td><td class=" humTok  humSSkern humTr2">!LO:TUP:r=2.:t=5</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28%3L</td><td class=" humTok  humSSkern humTr2">20%3</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28%3</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2">20%3</td></tr>
	<tr valign="baseline" class="humLine humLcom"><td class=" humTok  humSSkern humTr1 humTrackpad">!</td><td class=" humTok  humSSkern humTr2">!LO:TUP:r=20%3:t=3</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28%3</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2">20L</td></tr>
	<tr valign="baseline" class="humLine humLcom"><td class=" humTok  humSSkern humTr1 humTrackpad">!</td><td class=" humTok  humSSkern humTr2">!LO:TUP:r=10:t=5</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28%3</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td style="background-color:#dd0000" class=" humTok  humSSkern humTr2">50L@</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td style="background-color:#dd0000" class=" humTok  humSSkern humTr2">50@</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td style="background-color:#dd0000" class=" humTok  humSSkern humTr2">50@</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td style="background-color:#dd0000" class=" humTok  humSSkern humTr2">50@</td></tr>
	<tr valign="baseline" class="humLine humLcom"><td class=" humTok  humSSkern humTr1 humTrackpad">!LO:TUP:r=28%3:t=4</td><td class=" humTok  humSSkern humTr2">!</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">112%3LK</td><td style="background-color:#dd0000" class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td style="background-color:#dd0000" class=" humTok  humSSkern humTr2">50JJ@</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2">20%3</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">56%3</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">112%3Jk</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humLcom"><td class=" humTok  humSSkern humTr1 humTrackpad">!LO:TUP:r=28%3:t=3</td><td class=" humTok  humSSkern humTr2">!</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28.L</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">56k</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2">20%3</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28J</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">28%3J</td><td class=" humTok  humSSkern humTr2"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=</td><td class=" humTok  humSSkern humTr2">=</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSkern humTr1 humTrackpad">*-</td><td class=" humTok  humSSkern humTr2">*-</td></tr>
	<tr valign="baseline" class="humLine humRef"><td colspan=2><span class="humKey" title="User-defined signifiers">!!!RDF**kern: @ = marked note (rhythm of "50").</span></td></tr>
	</table>
	</div>

	</td></tr></table>

.. :Example:End: 2.7


|
|
|
|

2.2. Rhythm scaling
===========================================================================

The `rscale <http://extras.humdrum.org/man/rscale>`_ program can be used to multiply or divide the duration
of all rhythms in a score.  The two main purposes of rhythmic scaling are
(1) to remove rational rhythm representations, and (2) to switch between early
and modern rhythm units for the beat.

The Humdrum Toolkit programs will not understand reciprocal rhythms
such as ``3%2`` for triplet whole notes.  Typically a datafile with
rational rhythms will contain a line such as ``!!!rscale-alt: 1/2``
which indicates that the original file contains reciprocal rhythms,
and a rhythm-scaling by 1/2 will remove them.  For example, if
``3%2`` (triplet whole-note) is halved, then the reciprocal rhythm
becomes ``3`` (triplet half-note).  See the 
`rscale <http://extras.humdrum.org/man/rscale>`_ usage in Example 2.2 for 
such cases.

A related concept is the ``*rscale:`` tandem interpretation which
indicates that a rhythmic scaling should be applied to a spine when
creating graphical notation.  This interpretation is used frequently
in Humdrum scores of music from the early Renaissance created by
the `Josquin Research Project <http://josquin.stanford.edu>`_ (`also
available on GitHub
<https://github.com/josquin-research-project/jrp-scores>`_).  Music
of the fifteenth century was written in `mensural notation
<http://en.wikipedia.org/wiki/Mensural_notation>`_, and the JRP
edition tries faithfully preserve the original rhythm levels in
modern notation, with the beat typically occurring at the whole-note
level rather than the quarter note.

JRP Humdrum scores are in *resolved* notation, such that a whole note
in one part is always equal in duration to a whole note in another
part.  When an original part is in a different rhythmic scaling
from the other parts (typically the *cantus firmus*),
the rhythms are scaled to match the other parts, along with an ``*rscale:``
interpretation giving the factor which needs to be applied
to the part to generate rhythmic values of the original notation.
Example 2.8 demonstrates this sort of case.
Two parts switch to reverse-C mensuration in the second measure
while at the same time, increasing their rhythmic durations by a
factor of two.  Notice that the first and third parts have two whole
notes per measure at this point while the second and fourth parts have 
four whole notes per measure.


.. :Example:Start: 2.8

**Example 2.8:** Josquin, Missa *L'homme armé* sexti toni, `Credo <http://josquin.stanford.edu/cgi-bin/jrp?a=notationwitheditorial&f=Jos0602c-Missa_Lhomme_arme_sexti_toni-Credo>`_, mm. 234--7.

.. image:: rhythm.rstd/Example_jos0602c/jos0602c.svg
	:align: center
	:width: 100%

|

.. raw:: html

	<table width="100%">
	<tr><td colspan="3">
	<div class="humDiv">
	<table class="humTable">
	<tr valign="baseline" class="humLine humRef"><td colspan=4><span class="humKey" title="Composer's name">!!!COM:	Josquin des Prez</span></td></tr>
	<tr valign="baseline" class="humLine humRef"><td colspan=4><span class="humKey" title="Title">!!!OTL:	Missa L'homme armé sexti toni, Credo</span></td></tr>
	<tr valign="baseline" class="humLine humExinterp"><td class=" humTok  humSSkern humTr1 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr2 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr3 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr4">**kern</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*clefF4</td><td class=" humTok  humSSkern humTr2 humTrackpad">*clefGv2</td><td class=" humTok  humSSkern humTr3 humTrackpad">*clefGv2</td><td class=" humTok  humSSkern humTr4">*clefG2</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr2 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr3 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr4">*k[b-]</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*M3/1</td><td class=" humTok  humSSkern humTr2 humTrackpad">*M3/1</td><td class=" humTok  humSSkern humTr3 humTrackpad">*M3/1</td><td class=" humTok  humSSkern humTr4">*M3/1</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*met(C|3)</td><td class=" humTok  humSSkern humTr2 humTrackpad">*met(C|3)</td><td class=" humTok  humSSkern humTr3 humTrackpad">*met(C|3)</td><td class=" humTok  humSSkern humTr4">*met(C|3)</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=234-</td><td class=" humTok  humSSkern humTr2 humTrackpad">=234-</td><td class=" humTok  humSSkern humTr3 humTrackpad">=234-</td><td class=" humTok  humSSkern humTr4">=234-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">1BB-</td><td class=" humTok  humSSkern humTr2 humTrackpad">0F</td><td class=" humTok  humSSkern humTr3 humTrackpad">1D</td><td class=" humTok  humSSkern humTr4">1f</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">0GG</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">1.BB-</td><td class=" humTok  humSSkern humTr4">1g</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad">1E</td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">1b-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">2AA/</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=235</td><td class=" humTok  humSSkern humTr2 humTrackpad">=235</td><td class=" humTok  humSSkern humTr3 humTrackpad">=235</td><td class=" humTok  humSSkern humTr4">=235</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*M2/1</td><td class=" humTok  humSSkern humTr2 humTrackpad">*M2/1</td><td class=" humTok  humSSkern humTr3 humTrackpad">*M2/1</td><td class=" humTok  humSSkern humTr4">*M2/1</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*met(Cr)</td><td class=" humTok  humSSkern humTr2 humTrackpad">*met(C|)</td><td class=" humTok  humSSkern humTr3 humTrackpad">*met(Cr)</td><td class=" humTok  humSSkern humTr4">*met(C|)</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*rscale:2</td><td class=" humTok  humSSkern humTr2 humTrackpad">*</td><td class=" humTok  humSSkern humTr3 humTrackpad">*rscale:2</td><td class=" humTok  humSSkern humTr4">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">0FF</td><td class=" humTok  humSSkern humTr2 humTrackpad">[0F</td><td class=" humTok  humSSkern humTr3 humTrackpad">1C</td><td class=" humTok  humSSkern humTr4">0a</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">2r</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">2C/</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=236</td><td class=" humTok  humSSkern humTr2 humTrackpad">=236</td><td class=" humTok  humSSkern humTr3 humTrackpad">=236</td><td class=" humTok  humSSkern humTr4">=236</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">1r</td><td class=" humTok  humSSkern humTr2 humTrackpad">0F]</td><td class=" humTok  humSSkern humTr3 humTrackpad">1D</td><td class=" humTok  humSSkern humTr4">1.f</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">1FF</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">1C</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">4e/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">4d/</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=237</td><td class=" humTok  humSSkern humTr2 humTrackpad">=237</td><td class=" humTok  humSSkern humTr3 humTrackpad">=237</td><td class=" humTok  humSSkern humTr4">=237</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">2FF/</td><td class=" humTok  humSSkern humTr2 humTrackpad">1r</td><td class=" humTok  humSSkern humTr3 humTrackpad">0F</td><td class=" humTok  humSSkern humTr4">2c/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">1BB-</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">2d/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad">1F</td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">2B-/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">2BB-/</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">2d/</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=</td><td class=" humTok  humSSkern humTr2 humTrackpad">=</td><td class=" humTok  humSSkern humTr3 humTrackpad">=</td><td class=" humTok  humSSkern humTr4">=</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSkern humTr1 humTrackpad">*-</td><td class=" humTok  humSSkern humTr2 humTrackpad">*-</td><td class=" humTok  humSSkern humTr3 humTrackpad">*-</td><td class=" humTok  humSSkern humTr4">*-</td></tr>
	</table>
	</div>

	</td></tr></table>

.. :Example:End: 2.8

|
|

The music can easily be converted to resolved and reduced notation as shown
in Example 2.9.


.. :Example:Start: 2.9

**Example 2.9:** Resolved and reduced version of
the music in Example 2.8.

.. image:: rhythm.rstd/Example_reduced/reduced.svg
	:align: center
	:width: 100%

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/rscale>rscale</a> -f 1/2 jrp://Jos0602c | <a href=http://extras.humdrum.org/man/autostem>autostem</a> | <a href=http://en.wikipedia.org/wiki/Sed>sed</a> 's/\*rscale:/*Xrscale:/g; s/\*met(/*Xmet(/g'</tt>
	</td></tr><tr><td colspan="3">
	<div class="humDiv">
	<table class="humTable">
	<tr valign="baseline" class="humLine humRef"><td colspan=4><span class="humKey" title="Composer's name">!!!COM:	Josquin des Prez</span></td></tr>
	<tr valign="baseline" class="humLine humRef"><td colspan=4><span class="humKey" title="Title">!!!OTL:	Missa L'homme armé sexti toni, Credo</span></td></tr>
	<tr valign="baseline" class="humLine humExinterp"><td class=" humTok  humSSkern humTr1 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr2 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr3 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr4">**kern</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*clefF4</td><td class=" humTok  humSSkern humTr2 humTrackpad">*clefGv2</td><td class=" humTok  humSSkern humTr3 humTrackpad">*clefGv2</td><td class=" humTok  humSSkern humTr4">*clefG2</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr2 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr3 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr4">*k[b-]</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*M3/2</td><td class=" humTok  humSSkern humTr2 humTrackpad">*M3/2</td><td class=" humTok  humSSkern humTr3 humTrackpad">*M3/2</td><td class=" humTok  humSSkern humTr4">*M3/2</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*Xmet(C|3)</td><td class=" humTok  humSSkern humTr2 humTrackpad">*Xmet(C|3)</td><td class=" humTok  humSSkern humTr3 humTrackpad">*Xmet(C|3)</td><td class=" humTok  humSSkern humTr4">*Xmet(C|3)</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=234-</td><td class=" humTok  humSSkern humTr2 humTrackpad">=234-</td><td class=" humTok  humSSkern humTr3 humTrackpad">=234-</td><td class=" humTok  humSSkern humTr4">=234-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">2BB-/</td><td class=" humTok  humSSkern humTr2 humTrackpad">1F/</td><td class=" humTok  humSSkern humTr3 humTrackpad">2D/</td><td class=" humTok  humSSkern humTr4">2f/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">1GG/</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">2.BB-/</td><td class=" humTok  humSSkern humTr4">2g/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad">2E/</td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">2b-\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">4AA/</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=235</td><td class=" humTok  humSSkern humTr2 humTrackpad">=235</td><td class=" humTok  humSSkern humTr3 humTrackpad">=235</td><td class=" humTok  humSSkern humTr4">=235</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*M2/2</td><td class=" humTok  humSSkern humTr2 humTrackpad">*M2/2</td><td class=" humTok  humSSkern humTr3 humTrackpad">*M2/2</td><td class=" humTok  humSSkern humTr4">*M2/2</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*Xmet(Cr)</td><td class=" humTok  humSSkern humTr2 humTrackpad">*Xmet(C|)</td><td class=" humTok  humSSkern humTr3 humTrackpad">*Xmet(Cr)</td><td class=" humTok  humSSkern humTr4">*Xmet(C|)</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSkern humTr1 humTrackpad">*Xrscale:2</td><td class=" humTok  humSSkern humTr2 humTrackpad">*</td><td class=" humTok  humSSkern humTr3 humTrackpad">*Xrscale:2</td><td class=" humTok  humSSkern humTr4">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">1FF/</td><td class=" humTok  humSSkern humTr2 humTrackpad">[1F/</td><td class=" humTok  humSSkern humTr3 humTrackpad">2C/</td><td class=" humTok  humSSkern humTr4">1a/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">4r</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">4C/</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=236</td><td class=" humTok  humSSkern humTr2 humTrackpad">=236</td><td class=" humTok  humSSkern humTr3 humTrackpad">=236</td><td class=" humTok  humSSkern humTr4">=236</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">2r</td><td class=" humTok  humSSkern humTr2 humTrackpad">1F/]</td><td class=" humTok  humSSkern humTr3 humTrackpad">2D/</td><td class=" humTok  humSSkern humTr4">2.f/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">2FF/</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">2C/</td><td class=" humTok  humSSkern humTr4"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">8e/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">8d/</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=237</td><td class=" humTok  humSSkern humTr2 humTrackpad">=237</td><td class=" humTok  humSSkern humTr3 humTrackpad">=237</td><td class=" humTok  humSSkern humTr4">=237</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">4FF/</td><td class=" humTok  humSSkern humTr2 humTrackpad">2r</td><td class=" humTok  humSSkern humTr3 humTrackpad">1F/</td><td class=" humTok  humSSkern humTr4">4c/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">2BB-/</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">4d/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr2 humTrackpad">2F/</td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">4B-/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSkern humTr1 humTrackpad">4BB-/</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4">4d/</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSkern humTr1 humTrackpad">=</td><td class=" humTok  humSSkern humTr2 humTrackpad">=</td><td class=" humTok  humSSkern humTr3 humTrackpad">=</td><td class=" humTok  humSSkern humTr4">=</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSkern humTr1 humTrackpad">*-</td><td class=" humTok  humSSkern humTr2 humTrackpad">*-</td><td class=" humTok  humSSkern humTr3 humTrackpad">*-</td><td class=" humTok  humSSkern humTr4">*-</td></tr>
	<tr valign="baseline" class="humLine humRef"><td colspan=4><span class="humKey" title="">!!!rscale: 1/2</span></td></tr>
	</table>
	</div>

	</td></tr></table>

.. :Example:End: 2.9


|
|
|

2.3. Composite rhythm
===========================================================================

The `beat <http://extras.humdrum.org/man/beat>`_ program can be used to calculate the duration of
each line of a Humdrum file containing `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ or
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ data.  Musically this called the *composite
rhythm*, which is the rhythm of all parts considered as a single
stream.  The following musical example shows four parts on the top
two staves along with a staff beneath showing the composite rhythm
of all parts.  In measures 1, 3 and 4, no single part contains a
complete measure of eighth notes, but when considered together the
rhythmic texture is a sequence of continuous eighth notes.


.. :Example:Start: 2.10

**Example 2.10:** J.S. Bach, Chorale *Hilf, Gott, 
laß mir's gelingen*, BWV 343, mm. 16--19. Composite rhythm of all parts given 
on the bottom line of the system.

.. image:: rhythm.rstd/Example_compositebach/chor199i.svg
	:align: center
	:width: 100%
	:alt: myank -m 16-19 h://371chorales/chor199.krn  | satb2gs | ridx -GL

|

.. raw:: html

	<table width="100%"><tr> <td style="background-color: #cccccc;" colspan="3" align="center">
	   &#x21d2;&nbsp;&nbsp;<tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/beat>beat</a> -dp</tt>&nbsp;&nbsp;&#x21d2;
	</td></tr><tr><td width="49%>

.. literalinclude:: rhythm.rstd/Example_compositebach/durationinput.krn
	:language: humdrum


.. raw:: html

	</td><td width="2%">&nbsp;</td><td width="49%">

.. literalinclude:: rhythm.rstd/Example_compositebach/durationoutput-dp.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

.. :Example:End: 2.10


The ``-d`` option for `beat <http://extras.humdrum.org/man/beat>`_ is used to extract the
duration of each data line.  The ``-p`` option prepends the
duration analysis data to the start of each line (``-a`` will
append the analysis data to the end of the line).


The ``-f`` option will display duration information as fractional
ratio values instead of decimal numbers.  When the ``-f`` option
is used, the value of one represents the duration of a while
note (rather than a quarter note with the default floating-point
duration vales).


.. :Example:Start: 2.11

**Example 2.11:** Extracting durations as rational
numbers instead of floating-point values.

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/myank>myank</a> -m 16-19 h://370chorales/chor199.krn | <a href=http://extras.humdrum.org/man/ridx>ridx</a> -GL | <a href=http://extras.humdrum.org/man/beat>beat</a> -dpf</tt>
	</td></tr><tr><td colspan="3">
	<div class="humDiv">
	<table class="humTable">
	<tr valign="baseline" class="humLine humExinterp"><td class=" humTok  humSSdur humTr1 humTrackpad">**dur</td><td class=" humTok  humSSkern humTr2 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr3 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr4 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr5">**kern</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*clefF4</td><td class=" humTok  humSSkern humTr3 humTrackpad">*clefGv2</td><td class=" humTok  humSSkern humTr4 humTrackpad">*clefG2</td><td class=" humTok  humSSkern humTr5">*clefG2</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr3 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr4 humTrackpad">*k[b-]</td><td class=" humTok  humSSkern humTr5">*k[b-]</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*g:dor</td><td class=" humTok  humSSkern humTr3 humTrackpad">*g:dor</td><td class=" humTok  humSSkern humTr4 humTrackpad">*g:dor</td><td class=" humTok  humSSkern humTr5">*g:dor</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*M3/4</td><td class=" humTok  humSSkern humTr2 humTrackpad">*M3/4</td><td class=" humTok  humSSkern humTr3 humTrackpad">*M3/4</td><td class=" humTok  humSSkern humTr4 humTrackpad">*M3/4</td><td class=" humTok  humSSkern humTr5">*M3/4</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*MM100</td><td class=" humTok  humSSkern humTr2 humTrackpad">*MM100</td><td class=" humTok  humSSkern humTr3 humTrackpad">*MM100</td><td class=" humTok  humSSkern humTr4 humTrackpad">*MM100</td><td class=" humTok  humSSkern humTr5">*MM100</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=16-</td><td class=" humTok  humSSkern humTr2 humTrackpad">=16-</td><td class=" humTok  humSSkern humTr3 humTrackpad">=16-</td><td class=" humTok  humSSkern humTr4 humTrackpad">=16-</td><td class=" humTok  humSSkern humTr5">=16-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4G</td><td class=" humTok  humSSkern humTr3 humTrackpad">8dL</td><td class=" humTok  humSSkern humTr4 humTrackpad">4g</td><td class=" humTok  humSSkern humTr5">4.b-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">8e-J</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4F</td><td class=" humTok  humSSkern humTr3 humTrackpad">8fnXL</td><td class=" humTok  humSSkern humTr4 humTrackpad">4.d</td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">8FJ</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5">8a</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4E-X</td><td class=" humTok  humSSkern humTr3 humTrackpad">4G</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5">4g</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4 humTrackpad">8c</td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=17</td><td class=" humTok  humSSkern humTr2 humTrackpad">=17</td><td class=" humTok  humSSkern humTr3 humTrackpad">=17</td><td class=" humTok  humSSkern humTr4 humTrackpad">=17</td><td class=" humTok  humSSkern humTr5">=17</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/2</td><td class=" humTok  humSSkern humTr2 humTrackpad">2D;</td><td class=" humTok  humSSkern humTr3 humTrackpad">2A;</td><td class=" humTok  humSSkern humTr4 humTrackpad">2d;</td><td class=" humTok  humSSkern humTr5">2f#;</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/4</td><td class=" humTok  humSSkern humTr2 humTrackpad">4D</td><td class=" humTok  humSSkern humTr3 humTrackpad">[4d</td><td class=" humTok  humSSkern humTr4 humTrackpad">4f#</td><td class=" humTok  humSSkern humTr5">4a</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=18</td><td class=" humTok  humSSkern humTr2 humTrackpad">=18</td><td class=" humTok  humSSkern humTr3 humTrackpad">=18</td><td class=" humTok  humSSkern humTr4 humTrackpad">=18</td><td class=" humTok  humSSkern humTr5">=18</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4.G</td><td class=" humTok  humSSkern humTr3 humTrackpad">8dL]</td><td class=" humTok  humSSkern humTr4 humTrackpad">2g</td><td class=" humTok  humSSkern humTr5">2b-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">8B-J</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">4e-</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">8E-X</td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">[4B-</td><td class=" humTok  humSSkern humTr3 humTrackpad">8dL</td><td class=" humTok  humSSkern humTr4 humTrackpad">4fnX</td><td class=" humTok  humSSkern humTr5">4dd</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">8B-J</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=19</td><td class=" humTok  humSSkern humTr2 humTrackpad">=19</td><td class=" humTok  humSSkern humTr3 humTrackpad">=19</td><td class=" humTok  humSSkern humTr4 humTrackpad">=19</td><td class=" humTok  humSSkern humTr5">=19</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4B-]</td><td class=" humTok  humSSkern humTr3 humTrackpad">4G</td><td class=" humTok  humSSkern humTr4 humTrackpad">8ennXXL</td><td class=" humTok  humSSkern humTr5">2cc</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr4 humTrackpad">8d</td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4A</td><td class=" humTok  humSSkern humTr3 humTrackpad">8cL</td><td class=" humTok  humSSkern humTr4 humTrackpad">8e</td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">8AJ</td><td class=" humTok  humSSkern humTr4 humTrackpad">8f#J</td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">4G</td><td class=" humTok  humSSkern humTr3 humTrackpad">8B-L</td><td class=" humTok  humSSkern humTr4 humTrackpad">4g</td><td class=" humTok  humSSkern humTr5">4b-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3 humTrackpad">8dJ</td><td class=" humTok  humSSkern humTr4 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr5"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=</td><td class=" humTok  humSSkern humTr2 humTrackpad">=</td><td class=" humTok  humSSkern humTr3 humTrackpad">=</td><td class=" humTok  humSSkern humTr4 humTrackpad">=</td><td class=" humTok  humSSkern humTr5">=</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*-</td><td class=" humTok  humSSkern humTr2 humTrackpad">*-</td><td class=" humTok  humSSkern humTr3 humTrackpad">*-</td><td class=" humTok  humSSkern humTr4 humTrackpad">*-</td><td class=" humTok  humSSkern humTr5">*-</td></tr>
	</table>
	</div>

	</td></tr></table>

.. :Example:End: 2.11


Here is an example of extracting the distribution of durations
for the composite rhythm of 370 Bach chorales:


.. :Example:Start: 2.12

**Example 2.12:** Create a frequency distribution of composite rhythm durations in 370 Bach chorales.

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/beat>beat</a> -df h://370chorales | <a href=http://extras.humdrum.org/man/ridx>ridx</a> -H | sortcount -p</tt>
	</td></tr><tr><td colspan="3">

.. literalinclude:: rhythm.rstd/Example_durfreq/chorale-composite-rhythm.txt
	:language: humdrum


.. raw:: html

	</td></tr></table>

.. :Example:End: 2.12


The most common composite rhythm value is the eighth note (69.43%), then in
decreasing frequency: quarter note, sixteenth note, half note, 
dotted half note, whole note, dotted quarter note, 32nd note, dotted eighth
note, breve, and dotted whole note.

.. note: The is a small bug in that composite rhythm of tied notes will 
	not be extracted properly.  Consider the following example:
	**kern
	1c
	=
	[2c
	2c]
	==
	*-
	This should have a composite rhythm of two whole notes, but the
	tied note duration value is given as a half note instead of
	a whole note.


Below is a more complicated example which contains a polyrhythmic composite
rhythm.  The right-hand rhythm in measure 9 is five eighth notes in the time
of three which has a duration of:

.. math::

	\frac{3}{5} \times \frac{1}{8} = \frac{3}{40} \quad \mbox{whole notes}

The duration of 3/40th of a whole note is represented in extended
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ by the rhythm value ``40%3``.  Likewise, the
septuplets in the last measure are 
:math:`\scriptstyle 3/7 \times 1/8 = 3/56` whole notes, 
which is the `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ rhythm ``56%3``.


.. :Example:Start: 2.13

**Example 2.13:** F. Chopin, Nocturne in B major,
op. 9/3, mm. 8--10.

.. image:: rhythm.rstd/Example_nocturne/noc9-3.svg
	:align: center
	:width: 100%

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/beat>beat</a> -dpf </tt>
	</td></tr><tr><td colspan="3">
	<div class="humDiv">
	<table class="humTable">
	<tr valign="baseline" class="humLine humRef"><td colspan=3><span class="humKey" title="Composer's name">!!!COM: Chopin, Fr&eacute;d&eacute;ric</span></td></tr>
	<tr valign="baseline" class="humLine humRef"><td colspan=3><span class="humKey" title="Title">!!!OTL: Nocturne in B Major, op. 9/3</span></td></tr>
	<tr valign="baseline" class="humLine humExinterp"><td class=" humTok  humSSdur humTr1 humTrackpad">**dur</td><td class=" humTok  humSSkern humTr2 humTrackpad">**kern</td><td class=" humTok  humSSkern humTr3">**kern</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*clefF4</td><td class=" humTok  humSSkern humTr3">*clefG2</td></tr>
	<tr valign="baseline" class="humLine humInterp"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*k[f#c#g#d#a#]</td><td class=" humTok  humSSkern humTr3">*k[f#c#g#d#a#]</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=8-</td><td class=" humTok  humSSkern humTr2 humTrackpad">=8-</td><td class=" humTok  humSSkern humTr3">=8-</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">(8FF#\L</td><td class=" humTok  humSSkern humTr3">[2a#/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">8C#\</td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">8A#\</td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">8F#\</td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/24</td><td class=" humTok  humSSkern humTr2 humTrackpad">8e\</td><td class=" humTok  humSSkern humTr3">24a#]/LL</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/24</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">(24e#/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/24</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">24f#/J</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/32</td><td class=" humTok  humSSkern humTr2 humTrackpad">8A#\J)</td><td class=" humTok  humSSkern humTr3">32g#/LL</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/32</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">32a#/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/32</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">32b/</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/32</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">32c/JJJ)</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=9</td><td class=" humTok  humSSkern humTr2 humTrackpad">=9</td><td class=" humTok  humSSkern humTr3">=9</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/40</td><td class=" humTok  humSSkern humTr2 humTrackpad">(8BB\L</td><td class=" humTok  humSSkern humTr3">(40%3d#\L</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/20</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">40%3fn\</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*^</td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8F#\</td><td width="50%" class=" humTok  humSSkern">4F#/</td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">40%3e\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">40%3c##\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/20</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8f#\J)</td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">40%3d#\J)</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humManip"><td width="50%" class=" humTok  humSSkern humSubtrackpad">*v</td><td width="50%" class=" humTok  humSSkern">*v</td></tr></table></td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/40</td><td class=" humTok  humSSkern humTr2 humTrackpad">(8BB\L</td><td class=" humTok  humSSkern humTr3">(40%3dn\L</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/20</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">40%3e\</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*^</td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8Fn\</td><td width="50%" class=" humTok  humSSkern">4Fn/</td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">40%3d#\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">40%3c#\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/20</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8fn\J)</td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/40</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">40%3dn\J)</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humManip"><td width="50%" class=" humTok  humSSkern humSubtrackpad">*v</td><td width="50%" class=" humTok  humSSkern">*v</td></tr></table></td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=10</td><td class=" humTok  humSSkern humTr2 humTrackpad">=10</td><td class=" humTok  humSSkern humTr3">=10</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTok  humSSkern humTr2 humTrackpad">8BB\L</td><td class=" humTok  humSSkern humTr3">[4.c#^</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*^</td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8E\</td><td width="50%" class=" humTok  humSSkern">4E/</td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/8</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8e\J</td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humManip"><td width="50%" class=" humTok  humSSkern humSubtrackpad">*v</td><td width="50%" class=" humTok  humSSkern">*v</td></tr></table></td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/56</td><td class=" humTok  humSSkern humTr2 humTrackpad">8BB\L</td><td class=" humTok  humSSkern humTr3">(56%3c#]\LL</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/56</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">56%3b#\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/56</td><td class=" humTok  humSSkern humTr2 humTrackpad"><span class="humNull">.</span></td><td class=" humTok  humSSkern humTr3">56%3c#\</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTok  humSSkern humTr2 humTrackpad">*^</td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/28</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8Gn\</td><td width="50%" class=" humTok  humSSkern">4Gn/</td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/56</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">56%3c##\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/28</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">56%3d#\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">1/56</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad">8gn\J</td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3"><span class="humNull">.</span></td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/56</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">56%3e\</td></tr>
	<tr valign="baseline" class="humLine humDat"><td class=" humTok  humSSdur humTr1 humTrackpad">3/56</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humDat"><td width="50%" class=" humTok  humSSkern humSubtrackpad"><span class="humNull">.</span></td><td width="50%" class=" humTok  humSSkern"><span class="humNull">.</span></td></tr></table></td><td class=" humTok  humSSkern humTr3">56%3e#\JJ)</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*</td><td class=" humTr2 humTrackpad"><table width="100%" class="humSubtable"><tr valign=baseline class="humLine humManip"><td width="50%" class=" humTok  humSSkern humSubtrackpad">*v</td><td width="50%" class=" humTok  humSSkern">*v</td></tr></table></td><td class=" humTok  humSSkern humTr3">*</td></tr>
	<tr valign="baseline" class="humLine humBar"><td class=" humTok  humSSdur humTr1 humTrackpad">=</td><td class=" humTok  humSSkern humTr2 humTrackpad">=</td><td class=" humTok  humSSkern humTr3">=</td></tr>
	<tr valign="baseline" class="humLine humManip"><td class=" humTok  humSSdur humTr1 humTrackpad">*-</td><td class=" humTok  humSSkern humTr2 humTrackpad">*-</td><td class=" humTok  humSSkern humTr3">*-</td></tr>
	</table>
	</div>

	</td></tr></table>

.. :Example:End: 2.13


