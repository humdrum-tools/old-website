.. ####### AUTOMATICALLY GENERATED TEXT, DO NOT EDIT ######

.. |flat|    unicode:: 0x266d
.. |natural| unicode:: 0x266e
.. |sharp|   unicode:: 0x266f


===============================
Harmony
===============================

Roman Numeral Chords to Pitches
===========================================================================

The `harm2kern <http://extras.humdrum.org/man/harm2kern>`_ program can be used to convert Roman numeral
chords in the `\*\*harm <http://www.humdrum.org/Humdrum/representations/harm.rep.html>`_ representation into `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_
pitches.  Here is an example conversion, using the Pachelbel's canon
chord sequence:

**Example.** Pachelbel's canon chord sequence mapped onto pitches.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel.hmd
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/harm2kern>harm2kern</a></tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel-out.hmd
	:language: humdrum


.. raw:: html

	</td></tr></table>

Rhythm can be added to the output `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ data as shown
in the following examples.  This is useful if you want to align
to a musical score or listen to the resulting pitches by converting
the result into a MIDI file.  A constant rhythm value can be prefixed
to each output chord note by using the ``-P`` option followed by a
`\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ rhythm (although ``-P`` will also prefix any arbitrary
text).

**Example.** Add half note rhythm to all chord notes using the ``-P`` (prefix) option.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel.hmd
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/harm2kern>harm2kern</a> -P 2</tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel-2.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

**Example.** Include a `\*\*recip <http://www.humdrum.org/Humdrum/representations/recip.rep.html>`_ or `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ spine with the input to automatically generate rhythmic values in output.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel-recip.hmd
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/harm2kern>harm2kern</a> </tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel-recip-out.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>


Automatic transpositions of `\*\*harm <http://www.humdrum.org/Humdrum/representations/harm.rep.html>`_ data can be done
before or after conversion to `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_ data 
with the `transpose <http://extras.humdrum.org/man/transpose>`_ command.  Also note that the following
input data was created by appending the conversion to `\*\*kern <http://www.humdrum.org/Humdrum/representations/kern.rep.html>`_
data to the input `\*\*harm <http://www.humdrum.org/Humdrum/representations/harm.rep.html>`_ data by using the ``-a`` option.


**Example.** Transposing Pachelbel's canon chords to F\ |sharp| major.

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel-both.krn
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/transpose>transpose</a> -qk f# </tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: harmony.rstd/pachelbel-fsharp.krn
	:language: humdrum


.. raw:: html

	</td></tr></table>

Here is a chord label sampler with conversions into pitches:


**Example.** Various chord types

.. raw:: html

	<table width="100%"><tr><td width="30%">

.. literalinclude:: harmony.rstd/allchords.hmd
	:language: humdrum


.. raw:: html

	</td><td align="center" width="30%"> 
	   &#x21d2;&nbsp;<tt><a href=http://extras.humdrum.org/man/harm2kern>harm2kern</a> </tt>&nbsp;&#x21d2;
	</td><td width="30%">

.. literalinclude:: harmony.rstd/allchords-out.hmd
	:language: humdrum


.. raw:: html

	</td></tr></table>



