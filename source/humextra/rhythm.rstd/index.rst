.. ####### AUTOMATICALLY GENERATED TEXT, DO NOT EDIT ######


.. |rarrow| unicode:: 0x21d2
	:trim:

===========================================================================
Rhythm and Time
===========================================================================

Extensions to `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ and `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ rhythms
===========================================================================


Humdrum Extras programs recognize an extension to `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_
and `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ rhythm representations which allows any rational
rhythm to be encoded.  A majority of notatable rhythms found
in music can be represented in standard `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_
data.  For example a dotted quarter-note is encoded as ``4.`` and
a quintuplet sixteenth note is ``20``.  Such rhythms are based upon
integral divisions of the whole note.  The value ``4`` means 1/4th of
a whole note; ``4.`` means 1/4 of a whole note plus half of that
(1/8 of a whole note).  Only rhythms which are composed of equal
divisions of whole notes plus augmentation dots can be represented
in this system. But a problem occurs when trying to represent other
rhythms such as triplet whole-notes or non-power-of-two tuplet bases 
such as five eighth notes in the time of three eighth notes.

In other words when `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ encodes reciprocal durations
of rhythms, the durations must always have a 1 in the numerator
(excluding augmentations dots which are not considered when
calculating the reciprocal duration).  For example an eighth note
is represented in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ or `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ data as
``8``.  This means that the duration of an eighth note is 1/8th of
a whole note.  Likewise, ``12`` means 1/12 of a whole note which
translates musically into "triplet eighth-notes".  Here is a
demonstration of the calculations that relate ``12`` to a "triplet
eighth-note":

.. math::

	12 = \frac{1}{\frac{2}{3} \times \frac{1}{8}}

"1/8" is an eighth-note duration, and "2/3" is the tuplet relation of "three 
notes in the time of two", or a "3:2" tuplet.  By analogy, 5:3-tuplet
eighth notes have the reciprocal duration of 40/3:

.. math::

	\frac{40}{3} = \frac{1}{\frac{3}{5} \times \frac{1}{8}}

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


**Table.** Sample rational encodings of rhythms in `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ and `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ representations.

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

Notice that the duration 3/16 at the bottom of the table can represent
both 4:3-tuplet quarter notes and dotted eighth-notes (both have a
duration of 0.75 quarter notes).  The augmentation dot count is
necessary in order to determine the musical name of the duration.

The rational-duration extension to the `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ representation
is mostly backwards-compatible with `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_.  The ``%`` sign
is a user signifier, meaning it does not have a fixed meaning, and
can be given a temporary meaning.  For the rational rhythm extension
this character is reserved to separate the two integers in a
reciprocal duration value.  For generating compatible rhythmic
values for standard Humdrum Tools that don't recognize the extension
use the `rscale <http://extras.humdrum.org/man/rscale>`_ program to scale the rhythm to a timebase
which does not require the extension.  For example if the duration
of triplet whole-notes are decreased by half, they become triplet 
half-notes which are representable in the standard `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ 
system:

**Example.** Halving the duration of notes in a `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ score.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/tripletwholenotes.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/rscale>rscale</a> -f 1/2</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/triplethalfnotes.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>



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
``00000`` or larger exotic rhythmic values:

**Example.** Duration of various large rhythms in quarter-note units using
the "zero" representation.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/zero.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/beat>beat</a> -d</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/zero-beat-d.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

Compare this to durational equivalents in the rational representation
in the following example:

**Example.** Duration of various large rhythms in quarter-note units using
the rational representation.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: rhythm.rstd/zero-rational.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/beat>beat</a> -d</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: rhythm.rstd/zero-rational-beat-d.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>


Rhythm scaling
===========================================================================

The `rscale <http://extras.humdrum.org/man/rscale>`_ program can be used to multiply or divide the duration
of all rhythms in a score.  The two main purposes of rhythmic scaling are
(1) to remove rational representations, and (2) to switch between early
and modern rhythmic units for the beat.

The Humdrum Toolkit programs will not understand reciprocal rhythms
such as ``3%2`` for triplet whole notes.  Typically a datafile with
rational rhythms will contain a line such as ``!!!rscale-alt: 1/2``
which indicates that the original file contains reciprocal rhythms,
and a rhythmic-scaling by 1/2 will remove them.  For example, if
``3%2`` (triplet whole-note) is halved, then the reciprocal rhythm
becomes ``3`` (triplet half-note).

Compare the following two results from the `census <http://www.humdrum.org/Humdrum/commands/census.html>`_ command
when searching for the largest note value in the JRP repertory of
Pierre de la Rue:

.. code::

	humcat -s h://jrp/Rue | census -k

.. literalinclude:: rhythm.rstd/Rue.census




Composite rhythm
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

**Example.** J.S. Bach, Chorale *Hilf, Gott, laß mir's gelingen*, BWV 343, mm. 16--19.

.. image:: rhythm.rstd/chor199i.svg
	:align: center
	:width: 100%
	:alt: myank -m 16-19 h://371chorales/chor199.krn  | satb2gs | ridx -GL


.. raw:: html

	<table width="100%"><tr> <td style="background-color: #cccccc;" colspan="3" align="center">
	   &#x21d2;&nbsp;&nbsp;<tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/beat>beat</a> -dp</tt>&nbsp;&nbsp;&#x21d2;
	</td></tr><tr><td width="48%>

.. literalinclude:: rhythm.rstd/durationinput.krn
	:language: humdrum


.. raw:: html

	</td><td width="4%">&nbsp;</td><td width="48%">

.. literalinclude:: rhythm.rstd/durationoutput-dp.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>


The ``-d`` option for `beat <http://extras.humdrum.org/man/beat>`_ is used to extract the
duration of each data line.  The ``-p`` option prepends the
duration analysis data to the start of each line (``-a`` will
append the analysis data to the end of the line).


The ``-f`` option will display duration information as fractional
ratio values instead of decimal numbers.  When the ``-f`` option
is used, the value of one represents the duration of a while
note (rather than a quarter note with the default floating-point
duration vales).


**Example.** Extracting durations as rational numbers instead 
of floating-point values.

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/myank>myank</a> -m 16-19 h://370chorales/chor199.krn | <a href=http://extras.humdrum.org/man/ridx>ridx</a> -GL | <a href=http://extras.humdrum.org/man/beat>beat</a> -dpf</tt>
	</td></tr><tr><td colspan="3">

.. literalinclude:: rhythm.rstd/durationoutput-dpf.krn
	:language: humdrum
	:tab-width: 12


.. raw:: html

	</td></tr></table>


Here is an example of extracting the distribution of durations
for the composite rhythm of 370 Bach chorales:

**Example.** Create a frequency distribution of composite rhythm durations in 370 Bach chorales.

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/beat>beat</a> -df h://370chorales | <a href=http://extras.humdrum.org/man/ridx>ridx</a> -H | sortcount -p</tt>
	</td></tr><tr><td colspan="3">

.. literalinclude:: rhythm.rstd/chorale-composite-rhythm.txt
	:language: humdrum


.. raw:: html

	</td></tr></table>


The most common composite rhythmic value is the eighth note (69.43%), then in
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


**Example.** F. Chopin, Nocturne in B major, op. 9/3, mm. 8--10.

.. image:: rhythm.rstd/noc9-3.svg
	:align: center
	:width: 100%

.. raw:: html

	<table width="100%"><tr> <td align="center" style="background-color: #cccccc;" colspan="3">
	   <tt style="border: none; background-color: #cccccc;"><a href=http://extras.humdrum.org/man/beat>beat</a> -dpf </tt>
	</td></tr><tr><td colspan="3">

.. literalinclude:: rhythm.rstd/noc9-3-pdf.krn
	:language: humdrum
	:tab-width: 15


.. raw:: html

	</td></tr></table>


