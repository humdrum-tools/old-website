.. ####### AUTOMATICALLY GENERATED TEXT, DO NOT EDIT ######


.. |rarrow| unicode:: 0x21d2
	:trim:

===========================================================================
Rhythm 
===========================================================================

Extensions to \*\*recip and \*\*kern rhythms
===========================================================================


Humdrum Extras programs recognize an extension to \*\*recip
and \*\*kern rhythm representations that allows any rational
rhythm to be encoded.  A majority of notatable rhythms found
in music can be represented in standard \*\*recip
data.  For example a dotted quarter note is encoded as ``4.`` and
a quintuplet sixteenth note is ``20``.  Such rhythms are based upon
integral divisions of whole notes.  The value ``4`` means 1/4th of
a whole note; ``4.`` means 1/4 of a whole note plus half of that
(1/8 of a whole note).  Only rhythms which are composed of equal
divisions of whole notes plus augmentation dots can be represented
in this system, and a problem occurs when trying to represent other
rhythms such as a triplet whole-notes or non-binary tuplets such
as five eighth notes occurring within the time of three eighth
notes.

In other words when \*\*recip encodes reciprocal durations
of rhythms, the durations must always have a 1 in the numerator
(excluding augmentations dots which are not considered when
calculating the reciprocal duration).  For example an eighth note
is represented in \*\*recip or \*\*kern data as
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
in the standard \*\*recip representation is that it includes
a default value of 1 for the denominator of the reciprocal duration
since only integers are allowed for rhythms in \*\*recip
data.  The quarter note value ``4`` is more generally the ratio 4/1
with the "/1" implied in \*\*recip data. The Humdrum Extras
programs allow for the denominator to be any other positive integer.
In order to represent the duration 3/40 in \*\*recip data,
the symbol ``40%3`` can be used, where the ``%`` sign indicates a
reciprocal duration ratio with a denominator other than one is being
represented.

.. csv-table::
	:header: Encoding, Reciprocal duration, Duration (whole-note units), Musical name

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

The rational-duration extention to the \*\*recip representation
is mostly backwards-compatible with \*\*kern.  The ``%`` sign
is a user signifier, meaning it does not have a fixed meaning, and
can be given a temporary meaning.  For the rational rhythm extension
this character is reserved to separate the two integers in a
reciprocal duration value.  For generating compatible rhythmic
values for standard Humdrum Tools that don't recognize the extension
use the `rscale <http://extras.humdrum.org/man/rscale>`_ program to scale the rhythm to a timebase
which does not require the extension.  For example if the duration
of triplet whole-notes are decreased by half, they become triplet 
half-notes which are representable in the standard \*\*recip 
system:


.. humdrumio::
	:outputfile:	triplethalfnotes.krn
	:transform:	`rscale <http://extras.humdrum.org/man/rscale>`_ -f 1/2


"Zero" extension to \*\*recip rhythm interpretation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A different extension to the \*\*recip rhythm representation
uses the symbol ``0`` (zero) for breves (double whole notes).
Note that ``q`` is used to represent grace notes with a zero notated
duration.  Most rhythm-parsing Humdrum Toolkit programs (such as
`census <http://www.humdrum.org/Humdrum/commands/census.html>`_) recognize this zero convention.  By extension, the
symbol ``00`` represents a longa (quadrupal whole note), and ``000``
represents a maxima (octuple whole note); however, most Humdrum
Toolkit rhythm-parsing programs do not understand these longer
durations.  The Humdrum Extras programs will recognize all such
rhythms, and will increase the power of two to parse, ``0000``,
``00000`` or larger exotic rhythmic values:

**Example.** Number of quarter notes

.. literalinclude:: rhythm.rstd/zero-beat-da.krn
	:language: humdrum
	


Composite rhythm
=================

The `beat <http://extras.humdrum.org/man/beat>`_ tool can be used to calculate the duration of
each line of a Humdrum file containing \*\*kern or
\*\*recip data.  Musically this called the *composite
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

.. literalinclude:: rhythm.rstd/durationinput.krn
	:language: humdrum

The ``-d`` option for `beat <http://extras.humdrum.org/man/beat>`_ is used to extract the
duration of each data line.  The ``-p`` option prepends the
duration analysis data to the start of each line (``-a`` will
append the analysis data to the end of the line).

.. highlight:: bash
.. code:: bash

	beat -dp file.krn
	
.. literalinclude:: rhythm.rstd/durationoutput-dp.krn
	:language: humdrum


The ``-f`` option will display duration information as fractional
ratio values instead of decimal numbers.  When the ``-f`` option
is used, the value of one represents the duration of a while
note (rather than a quarter note with the default floating-point
duration vales).

.. highlight:: bash
.. code:: bash

	beat -dpf file.krn

.. literalinclude:: rhythm.rstd/durationoutput-dpf.krn
	:language: humdrum


.. highlight:: bash
.. code:: bash


Here is an example of extracting the distribution of durations
for the composite rhythm of 370 Bach chorales:


.. code:: bash

	beat -df h://370chorales | ridx -H | sortcount -p

.. code::

	69.43	1/8
	19.46	1/4
	7.11	1/16
	2.79	1/2
	0.94	3/4
	0.18	1
	0.04	3/8
	0.03	1/32
	0.02	3/16
	0.01	2
	0.01	3/2

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
\*\*recip by the rhythm value ``40%3``.  Likewise, the
septuplets in the last measure are 
:math:`\scriptstyle 3/7 \times 1/8 = 3/56` whole notes, 
which is the \*\*recip rhythm ``56%3``.


**Example.** F. Chopin, Nocturne in B major, op. 9/3, mm. 8--10.

.. image:: rhythm.rstd/noc9-3.svg
	:align: center
	:width: 100%

.. literalinclude:: rhythm.rstd/noc9-3-pdf.krn
	:language: humdrum

