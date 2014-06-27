
Detailed Table of Contents
--------------------------


` **Regular Table of Contents**`_

> -   **Preface**
> -   **Acknowledgments**
> -   **How to Use This Book**
>
> **Chapter**
>
> 1.  ` **Humdrum: A Brief Tour**`_
>
>    > `What Can Humdrum Do?`_
`The Humdrum Syntax and the Humdrum Toolkit`_
`Humdrum Syntax`_
`Humdrum Tools`_
`Some Sample Commands`_
`Reprise`_
>
> 2.  ` **Representing Music Using **kern (Part I)**`_
>
>    > `Comment Records`_
`Reference Records`_
`Reprise`_
>
> 3.  ` **Some Initial Processing**`_
>
>    > `The census Command`_
`Simple Searches Using the *grep* Command`_
`Pattern Locations Using *grep -n*`_
`Counting Pattern Occurrences Using *grep -c*`_
`Searching for Reference Information`_
`The *sort* Command`_
`The *uniq* Command`_
`Options for the *uniq* Command`_
`Reprise`_
>
> 4.  ` **Basic Pitch Translations**`_
>
>    > `ISO Pitch Representation`_
`German Tonohe`_
`French Solfege`_
`Frequency`_
`Cents`_
`Semitones`_
`MIDI`_
`Scale Degree`_
`Pitch Translations`_
`Transposition Using the *trans* Command`_
`Key Interpretations`_
`Pitch Processing`_
`Uses for Pitch Translations`_
`Reprise`_
>
> 5.  ` **The Humdrum Syntax**`_
>
>    > `Types of Records`_
`Comment Records`_
`Interpretation Records`_
`Data Records`_
`Data Tokens and Null Tokens`_
`Data Sub-Tokens`_
`Spine Paths`_
` The Humdrum Syntax: A Formal Definition`_
`The *humdrum* Command`_
`Reprise`_
>
> 6.  ` **Representing Music Using **kern (Part II)**`_
>
>    > `Grace Notes, Gruppetos and Appoggiaturas`_
`Multiple Stops`_
`Further Examples`_
`Reprise`_
>
> 7.  ` **MIDI Output Tools**`_
>
>    > `The ***MIDI* Representation`_
`The *midi* Command`_
`The *perform* Command`_
`Data Scrolling During Playback`_
`Changing Tempo`_
`The *tacet* Command`_
`The *smf* Command`_
`Reprise`_
>
> 8.  ` **The Shell (I)**`_
>
>    > `Shell Special Characters`_
`File Redirection`_
`Pipe (|)`_
`Shell Wildcard (*)`_
`Comment (#)`_
`Command Delimiter (;)`_
`Background Command (&)`_
`Shell Command Syntax`_
`Output Redirection`_
`Tee`_
`Reprise`_
>
> 9.  ` **Searching with Regular Expressions**`_
>
>    > `Literals`_
`Wild-Card`_
`Escape Character`_
`Repetition Operators`_
`Context Anchors`_
`OR Logical Operator`_
`Character Classes`_
`Examples of Regular Expressions`_
`Examples of Regular Expressions in Humdrum`_
`Basic, Extended, and Humdrum-Extended Regular Expressions`_
`Reprise`_
>
> 10. ` **Musical Uses of Regular Expressions**`_
>
>    > `The *grep* Command (Again)`_
`German, French, Italian, and Neapolitan Sixths`_
`AND-Searches Using the *xargs* Command`_
`OR-Searches Using the *grep -f* Command`_
`Reprise`_
>
> 11. ` **Melodic Intervals**`_
>
>    > `Types of Melodic Intervals`_
`Melodic Intervals Using the *mint* Command`_
`Unvoiced Inner Intervals`_
`Calculating Distance Intervals Using the *mint -s* Command`_
`Simple and Compound Melodic Intervals`_
`Diatonic Intervals, Absolute Intervals and Contour`_
`Using the *mint* Command`_
`Calculating Melodic Intervals Using the *xdelta* Command`_
`Reprise`_
>
> 12. ` **Selecting Musical Parts and Passages**`_
>
>    > ` Extracting Spines: The *extract* Command`_
`Extraction by Interpretation`_
`Using *extract* in Pipelines`_
`Extracting Spines that Meander`_
`Field-Trace Extracting`_
` Extracting_Passages: The *yank* Command`_
`Yanking by Marker`_
`Yanking by Delimiters`_
`Yanking by Section`_
`Examples Using *yank*`_
`Using *yank* in Pipelines`_
`Reprise`_
>
> 13. ` **Assembling Scores**`_
>
>    > `The *cat* Command`_
`The *rid* Command`_
`Assembling Parts Using the *assemble* Command`_
`Aligning Durations Using the *timebase* Command`_
`Assembling N-tuplets`_
`Checking an Assembled Score Using *proof*`_
`Other Uses for the *timebase* Command`_
`Additional Uses of *assemble* and *timebase*`_
`Reprise`_
>
> 14. ` **Stream Editing**`_
>
>    > `The *sed* and *humsed* Commands`_
`Simple Substitutions`_
`Selective Elimination of Data`_
`The *stats* Command`_
`Eliminate Everything But...`_
`Deleting Data Records`_
`Adding Information`_
`Multiple Substitutions`_
`Switching Signifiers`_
`Executing from a File`_
`Writing to a File`_
`Reading a File as Input`_
`Reprise`_
>
> 15. ` **Harmonic Intervals**`_
>
>    > `Types of Harmonic Intervals`_
`Harmonic Intervals Using the *hint* Command`_
`Propagating Data Using the *ditto* Command`_
`Using the *ditto* and *hint* Commands`_
`Determining Implicit Harmonic Intervals`_
`The *ydelta* Command`_
`More Examples Using the *ydelta* Command`_
`Reprise`_
>
> 16. ` **The Shell (II)**`_
>
>    > `Shell Special Characters`_
`Shell Variables`_
`The Shell Greve`_
`Single Quotes, Double Quotes`_
`Using Shell Variables`_
`Aliases`_
`Reprise`_
>
> 17. ` **Creating Inventories**`_
>
>    > `Filter, Sort, Count`_
`Filtering Data with the *rid* Command`_
`Inventories for Multi-spine Inputs`_
`Sorting By Frequency of Occurrence`_
`Counting with the *wc* Command`_
`Excluding or Seeking Rare Events`_
`Transforming and Editing Inventory Data`_
`Further Examples`_
`Reprise`_
>
> 18. ` **Fingers, Footsteps and Frets**`_
>
>    > `Heart Beats and Other Esoterica`_
`The ***fret* Representation`_
`Additional Features of ***fret*`_
`Reprise`_
>
> 19. ` **Musical Contexts**`_
>
>    > `The *context* Command`_
`Harmonic Progressions`_
`Using *context* with the *-b* and *-e* Options`_
`Using context with *sed* and *humsed*`_
`Linking context Outputs with Inputs`_
`Using *context* with the *-p* Option`_
`Reprise`_
>
> 20. ` **Strophes, Verses and Repeats**`_
>
>    > `Section Labels`_
`Expansion Lists`_
`Using *yank* to Extract Sections`_
`Using the *thru* Command to Expand Encodings`_
`Alternative Versions`_
`Section Types`_
`Hierarchical Sections`_
`Using the *yank* and *thru* Commands`_
`Strophic Representations`_
`The *strophe* Command`_
`Using the *strophe* and *thru* Commands`_
`Reprise`_
>
> 21. ` **Searching for Patterns**`_
>
>    > `The *patt* Command`_
`Using *patt*'s Tag Option`_
`Matching Multiple Records Using the *patt* Command`_
`The *pattern* Command`_
`Patterns of Patterns`_
`Reprise`_
>
> 22. ` **Classifying**`_
>
>    > `The *recode* Command`_
`Classifying Intervals`_
`Clarinet Registers`_
`Open and Close Position Chords`_
`Flute Fingering Transitions`_
`Classifying with *humsed*`_
`Classifying Cadences`_
`Orchestration`_
`Reprise`_
>
> 23. ` **Rhythm**`_
>
>    > `The ***recip* Representation`_
`The *dur* Command`_
`Classifying Durations`_
`Using *yank* with the *timebase* Command`_
`The *metpos* Command`_
`Changes of Stress`_
`Reprise`_
>
> 24. ` **The Shell (III)**`_
>
>    > `Shell Programs`_
` Flow of Control: The *if* Statement`_
` Flow of Control: The *for* Statement`_
`A Script for Identifying Transgressions of Voice-Leading`_
>>
>>    > ` (1) Parts Out Of Range`_
` (2) Augmented/Diminished Melodic Intervals`_
` (3) Consecutive Fifths or Octaves`_
` (4) Doubled Leading Tone`_
` (5) Avoid Unisons`_
` (6) Crossed Parts`_
` (7) Parts Separated by Greater than an Octave`_
` (8) Overlapped Parts`_
` (9) Exposed Octaves`_
>>
>>     `Reprise`_
>
> 25. ` **Similarity**`_
>
>    > `The *correl* Command`_
`Using a Template with *correl*`_
`The *simil* Command`_
`Defining Edit Penalties`_
`The *accent* Command`_
`Reprise`_
>
> 26. ` **Moving Signifiers Between Spines**`_
>
>    > `The *rend* Command`_
`The *cleave* Command`_
`Creating Mixed Representations`_
`Reprise`_
>
> 27. ` **Text and Lyrics**`_
>
>    > `The ***text* and ***silbe* Representations`_
`The *text* Command`_
`The *fmt* Command`_
`Rhythmic Feet in Text`_
`Concordance`_
`Simile`_
`Word Painting`_
`Emotionality`_
`Other Types of Language Use`_
`Reprise`_
>
> 28. ` **Dynamics**`_
>
>    > `The ***dynam* and ***dyn* Representations`_
`The ***dyn* Representation`_
`The ***dB* Representation`_
`The *db* Command`_
`Processing Dynamic Information`_
`Terraced Dynamics`_
`Dynamic Swells`_
`MIDI Dynamics`_
`Reprise`_
>
> 29. ` **Differences and Similarities**`_
>
>    > `Comparing Files Using *cmp*`_
`Comparing Files Using *diff*`_
`Comparing Inventories -- The *comm* Command`_
`Reprise`_
>
> 30. ` **MIDI Input Tools**`_
>
>    > `The *record* Command`_
`The *encode* Command`_
`Reprise`_
>
> 31. ` **Repertoires and Links**`_
>
>    > `The *find* Command`_
`Content Searching`_
`Using *find* with the *xargs* Command`_
`Repertoires As File Links`_
`Reprise`_
>
> 32. ` **The Shell (IV)**`_
>
>    > `The *awk* Programming Language`_
`Automatic Parsing of Input Data`_
`Arithemtic Operations`_
`Conditional Statements`_
`Assigning Variables`_
`Manipulating Character Strings`_
`The *for* Loop`_
`Reprise`_
>
> 33. ` **Word Sounds**`_
>
>    > `The ***IPA* Representation`_
`Alliteration`_
`Classifying Phonemes`_
`Properties of Vowels`_
`Vowel Coloration`_
`Rhyme and Rhyme Schemes`_
`Reprise`_
>
> 34. ` **Serial Processing**`_
>
>    > `Pitch-Class Representation`_
`The *pcset* Command`_
`Prime Form and Normal Form`_
`Interval Vectors Using the *iv* Command`_
`Segmentation Using the *context* Command`_
`The *reihe* Command`_
`Generating a Set Matrix`_
`Locating and Identifying Tone-Rows`_
`Reprise`_
>
> 35. ` **Layers**`_
>
>    > `Implied Harmony`_
>
> 36. ` **Sound and Spectra**`_
>
>    > `The ***spect* Representation`_
`The SHARC Database and *spect* Command`_
`The *mask* Command`_
`The *sdiss* Command`_
`Connecting Humdrum with Csound -- the *kern2cs* Command`_
`Sound Analysis`_
`Reprise`_
>
> 37. ` **Electronic Music Editing**`_
>
>    > `The Process of Electronic Editing`_
`Establishing the Goal`_
`Documenting Encoded Data`_
`Sources`_
`Selecting a Sample from Some Repertory`_
`Encoding`_
`Transposing Instruments`_
`Instrument Identification`_
`Leading Barlines`_
`Ornamentation`_
`Editing Sections`_
`Editorialisms in the ***kern* Representation`_
`Adding Reference Information`_
`Proof-reading Materials`_
`Data Integrity Using the VTS Checksum Record`_
`Preparing a Distribution`_
`Electronic Citation`_
`Reprise`_
>
> 38. ` **Systematic Musicology**`_
>
>    > `Comparison Repertory`_
`Randomizing`_
`Using the *scramble* Command`_
`Retrograde Controls Using the *tac* Command`_
`Autophase Procedure`_
`Reprise`_
>
> 39. ` **Troubleshooting**`_
>
>    > `Encoding Errors`_
`Searching Tips`_
`Pipeline Tips`_
`Reprise`_
>
> 40. ` **Conclusion**`_
>
>    > `Pursuing a Project with Humdrum`_
>
> -   ` **Bibliography**`_
> -   ` **Appendix I: Humdrum Reference Records**`_
>
>    > ` Authorship Information`_
` Performance Information`_
` Work Identification Information`_
` Imprint Information`_
` Copyright Information`_
` Analytic Information`_
` Representation Information`_
` Electronic Citation`_
` Further Reference Record Codes`_
>
> -   ` **Appendix II: Instrumentation Codes**`_
>
>    > ` Introduction`_
` Voice Range`_
` Voice Quality`_
` String Instruments`_
` Wind Instruments`_
` Percussion Instruments`_
` Keyboard Instruments`_
>
> -   ` **Index to Problems**`_
> -   ` **Index to Names, Works and Genres**`_
> -   ` **General Index**`_

-   ` **Regular Table of Contents**`_
-   `**Index of Humdrum Commands**`_
-   `**On-line Humdrum Course Description**`_
-   `**Index to Humdrum On-line Resources**`_
-   `**Humdrum Exercises****`_
-   `**Summary of **kern Music Representation**`_
-   `** Humdrum Toolkit Home Page**`_
-   `** Humdrum Toolkit Home Page (University of Virginia) **`_
-   `**Ohio State University Music Cognition Home Page**`_





(C) Copyright 1999 David Huron

.. _Regular Table of Contents: guide.toc.html
.. _Humdrum:  A Brief Tour: ch01.html
.. _What Can Humdrum Do?: ch01.html#What_Can_Humdrum_Do
.. _The Humdrum Syntax and the Humdrum Toolkit:
    ch01.html#The_Humdrum_Syntax_and_the_Humdrum_Toolkit
.. _Humdrum Syntax: ch01.html#Humdrum_Syntax
.. _Humdrum Tools: ch01.html#Humdrum_Tools
.. _Some Sample Commands: ch01.html#Some_Sample_Commands
.. _Reprise: ch01.html#Reprise
.. _Representing Music Using **kern (Part I): ch02.html
.. _Comment Records: ch02.html#Comment_Records
.. _Reference Records: ch02.html#Reference_Records
.. _Reprise: ch02.html#Reprise
.. _Some Initial Processing: ch03.html
.. _The census Command: ch03.html#The_census_Command
.. _ Command: ch03.html#Simple_Searches_using_the_grep_Command
.. _grep -n: ch03.html#Pattern_Locations_Using_grep_-n
.. _grep -c: ch03.html#Counting_Pattern_Occurrences_Using_grep-c
.. _Searching for Reference Information:
    ch03.html#Searching_for_Reference_Information
.. _ Command: ch03.html#The_sort_Command
.. _ Command: ch03.html#The_uniq_Command
.. _ Command: ch03.html#Options_for_the_uniq_Command
.. _Reprise: ch03.html#Reprise
.. _Basic Pitch Translations: ch04.html
.. _ISO Pitch Representation: ch04.html#Pitch_Representation
.. _he: ch04.html#German_Ton&#246he
.. _ge: ch04.html#French_Solf&#232ge
.. _Frequency: ch04.html#Frequency
.. _Cents: ch04.html#Cents
.. _Semitones: ch04.html#Semitones
.. _MIDI: ch04.html#MIDI
.. _Scale Degree: ch04.html#Scale_Degree
.. _Pitch Translations: ch04.html#Pitch_Translations
.. _ Command: ch04.html#Transposition_Using_the_trans_Command
.. _Key Interpretations: ch04.html#Key_Interpretations
.. _Pitch Processing: ch04.html#Pitch_Processing
.. _Uses for Pitch Translations: ch04.html#Uses_for_Pitch_Translations
.. _Reprise: ch04.html#Reprise
.. _The Humdrum Syntax: ch05.html
.. _Types of Records: ch05.html#Types_of_Records
.. _Comment Records: ch05.html#Comment_Records
.. _Interpretation Records: ch05.html#Interpretation_Records
.. _Data Records: ch05.html#Data_Records
.. _Data Tokens and Null Tokens: ch05.html#Data_Tokens_and_Null_Tokens
.. _Data Sub-Tokens: ch05.html#Data_Sub-Tokens
.. _Spine Paths: ch05.html#Spine_Paths
.. _    The Humdrum Syntax:  A Formal Definition:
    ch05.html#The_Humdrum_Syntax:_A_Formal_Definition
.. _ Command: ch05.html#The_humdrum_Command
.. _Reprise: ch05.html#Reprise
.. _Representing Music Using **kern (Part II): ch06.html
.. _Grace Notes, Gruppetos and Appoggiaturas:
    ch06.html#Grace_Notes,_Gruppetos_and_Appoggiaturas
.. _Multiple Stops: ch06.html#Multiple_Stops
.. _Further Examples: ch06.html#Further_Examples
.. _Reprise: ch06.html#Reprise
.. _MIDI Output Tools: ch07.html
.. _ Representation: ch07.html#The_**MIDI_Representation
.. _ Command: ch07.html#The_midi_Command
.. _ Command: ch07.html#The_perform_Command
.. _Data Scrolling During Playback:
    ch07.html#Data_Scrolling_During_Playback
.. _Changing Tempo: ch07.html#Changing_Tempo
.. _ Command: ch07.html#The_tacet_Command
.. _ Command: ch07.html#The_smf_Command
.. _Reprise: ch07.html#Reprise
.. _The Shell (I): ch08.html
.. _Shell Special Characters: ch08.html#Shell_Special_Characters
.. _File Redirection: ch08.html#File_Redirection
.. _Pipe (|): ch08.html#Pipe_(|)
.. _Shell Wildcard (*): ch08.html#Shell_Wildcard_(*)
.. _Comment (#): ch08.html#Comment_(octothorpe)
.. _Command Delimiter (;): ch08.html#Command_Delimiter_(;)
.. _): ch08.html#Background_Command_(&)
.. _Shell Command Syntax: ch08.html#Shell_Command_Syntax
.. _Output Redirection: ch08.html#Output_Redirection
.. _Tee: ch08.html#Tee
.. _Reprise: ch08.html#Reprise
.. _Searching with Regular Expressions: ch09.html
.. _Literals: ch09.html#Literals
.. _Wild-Card: ch09.html#Wild-Card
.. _Escape Character: ch09.html#Escape_Character
.. _Repetition Operators: ch09.html#Repetition_Operators
.. _Context Anchors: ch09.html#Context_Anchors
.. _OR Logical Operator: ch09.html#OR_Logical_Operator
.. _Character Classes: ch09.html#Character_Classes
.. _Examples of Regular Expressions:
    ch09.html#Examples_of_Regular_Expressions
.. _Examples of Regular Expressions in Humdrum:
    ch09.html#Examples_of_Regular_Expressions_in_Humdrum
.. _Basic, Extended, and Humdrum-Extended Regular Expressions:
    ch09.html#Basic,_Extended,_and_Humdrum-Extended_Regular_Expressions
.. _Reprise: ch09.html#Reprise
.. _Musical Uses of Regular Expressions: ch10.html
.. _ Command (Again): ch10.html#The_grep_Command_(Again)
.. _German, French, Italian, and Neapolitan Sixths:
    ch10.html#German,_French,_Italian,_and_Neapolitan_Sixths
.. _ Command: ch10.html#AND-Searches_Using_the_xargs_Command
.. _ Command: ch10.html#OR-Searches_Using_the_grep_-f_Command
.. _Reprise: ch10.html#Reprise
.. _Melodic Intervals: ch11.html
.. _Types of Melodic Intervals: ch11.html#Types_of_Melodic_Intervals
.. _ Command: ch11.html#Melodic_Intervals_Using_the_mint_Command
.. _Unvoiced Inner Intervals: ch11.html#Unvoiced_Inner_Intervals
.. _ Command: ch11.html
    #Calculating_Distance_Intervals_Using_the_mint_-s_Command
.. _Simple and Compound Melodic Intervals:
    ch11.html#Simple_and_Compound_Melodic_Intervals
.. _Diatonic Intervals, Absolute Intervals and Contour:
    ch11.html#Diatonic_Intervals,_Absolute_Intervals_and_Contour
.. _ Command: ch11.html#Using_the_mint_Command
.. _ Command:
    ch11.html#Calculating_Melodic_Intervals_Using_the_xdelta_Command
.. _Reprise: ch11.html#Reprise
.. _Selecting Musical Parts and Passages: ch12.html
.. _ Command: ch12.html#Extracting_Spines:_The_extract_Command
.. _Extraction by Interpretation:
    ch12.html#Extraction_by_Interpretation
.. _ in Pipelines: ch12.html#Using_extract_in_Pipelines
.. _Extracting Spines that Meander:
    ch12.html#Extracting_Spines_that_Meander
.. _Field-Trace Extracting: ch12.html#Field-Trace_Extracting
.. _ Command: ch12.html#Extracting_Passages:_The_yank_Command
.. _Yanking by Marker: ch12.html#Yanking_by_Marker
.. _Yanking by Delimiters: ch12.html#Yanking_by_Delimiters
.. _Yanking by Section: ch12.html#Yanking_by_Section
.. _yank: ch12.html#Examples_Using_yank
.. _ in Pipelines: ch12.html#Using_yank_in_Pipelines
.. _Reprise: ch12.html#Reprise
.. _Assembling Scores: ch13.html
.. _ Command: ch13.html#The_cat_Command
.. _ Command: ch13.html#The_rid_Command
.. _ Command: ch13.html#Assembling_Parts_Using_the_assemble_Command
.. _ Command: ch13.html#Aligning_Durations_Using_the_timebase_Command
.. _Assembling N-tuplets: ch13.html#Assembling_N-tuplets
.. _proof: ch13.html#Checking_an_Assembled_Score_Using_proof
.. _ Command: ch13.html#Other_Uses_for_the_timebase_Command
.. _timebase: ch13.html#Additional_Uses_of_aassemble_and_timebase
.. _Reprise: ch13.html#Reprise
.. _Stream Editing: ch14.html
.. _ Commands: ch14.html#The_sed_and_humsed_Commands
.. _Simple Substitutions: ch14.html#Simple_Substitutions
.. _Selective Elimination of Data:
    ch14.html#Selective_Elimination_of_Data
.. _ Command: ch14.html#The_stats_Command
.. _Eliminate Everything But...: ch14.html#Eliminate_Everything_But...
.. _Deleting Data Records: ch14.html#Deleting_Data_Records
.. _Adding Information: ch14.html#Adding_Information
.. _Multiple Substitutions: ch14.html#Multiple_Substitutions
.. _Switching Signifiers: ch14.html#Switching_Signifiers
.. _Executing from a File: ch14.html#Executing_from_a_File
.. _Writing to a File: ch14.html#Writing_to_a_File
.. _Reading a File as Input: ch14.html#Reading_a_File_as_Input
.. _Reprise: ch14.html#Reprise
.. _Harmonic Intervals: ch15.html
.. _Types of Harmonic Intervals: ch15.html#Types_of_Harmonic_Intervals
.. _ Command: ch15.html#Harmonic_Intervals_Using_the_hint_Command
.. _ Command: ch15.html#Propagating_Data_Using_the_ditto_Command
.. _ Commands: ch15.html#Using_the_ditto_and_hint_Commands
.. _Determining Implicit Harmonic Intervals:
    ch15.html#Determining_Implicit_Harmonic_Intervals
.. _ Command: ch15.html#The_ydelta_Command
.. _ Command: ch15.html#More_Examples_Using_the_ydelta_Command
.. _Reprise: ch15.html#Reprise
.. _The Shell (II): ch16.html
.. _Shell Special Characters: ch16.html#Shell_Special_Characters
.. _Shell Variables: ch16.html#Shell_Variables
.. _The Shell Greve: ch16.html#The_Shell_Greve
.. _Single Quotes, Double Quotes:
    ch16.html#Single_Quotes,_Double_Quotes
.. _Using Shell Variables: ch16.html#Using_Shell_Variables
.. _Aliases: ch16.html#Aliases
.. _Reprise: ch16.html#Reprise
.. _Creating Inventories: ch17.html
.. _Filter, Sort, Count: ch17.html#Filter,_Sort,_Count
.. _ Command: ch17.html#Filtering_Data_with_the_rid_Command
.. _Inventories for Multi-spine Inputs: ch17.html
    #Inventories_for_Multi-spine_Inputs
.. _Sorting By Frequency of Occurrence:
    ch17.html#Sorting_By_Frequency_of_Occurrence
.. _ Command: ch17.html#Counting_with_the_wc_Command
.. _Excluding or Seeking Rare Events:
    ch17.html#Excluding_or_Seeking_Rare_Events
.. _Transforming and Editing Inventory Data:
    ch17.html#Transforming_and_Editing_Inventory_Data
.. _Further Examples: ch17.html#Further_Examples
.. _Reprise: ch17.html#Reprise
.. _Fingers, Footsteps and Frets: ch18.html
.. _Heart Beats and Other Esoterica:
    ch18.html#Heart_Beats_and_Other_Esoterica
.. _ Representation: ch18.html#The_**fret_Representation
.. _**fret: ch18.html#Additional_Features_of_**fret
.. _Reprise: ch18.html#Reprise
.. _Musical Contexts: ch19.html
.. _ Command: ch19.html#The_context_Command
.. _Harmonic Progressions: ch19.html#Harmonic_Progressions
.. _ Options: ch19.html#Using_context_with_the_-b_and_-e_Options
.. _humsed: ch19.html#Using_context_with_sed_and_humsed
.. _Linking context Outputs with Inputs:
    ch19.html#Linking_context_Outputs_with_Inputs
.. _ Option: ch19.html#Using_context_with_the_-p_Option
.. _Reprise: ch19.html#Reprise
.. _Strophes, Verses and Repeats: ch20.html
.. _Section Labels: ch20.html#Section_Labels
.. _Expansion Lists: ch20.html#Expansion_Lists
.. _ to Extract Sections: ch20.html#Using_yank_to_Extract_Sections
.. _ Command to Expand Encodings:
    ch20.html#Using_the_thru_Command_to_Expand_Encodings
.. _Alternative Versions: ch20.html#Alternative_Versions
.. _Section Types: ch20.html#Section_Types
.. _Hierarchical Sections: ch20.html#Hierarchical_Sections
.. _ Commands: ch20.html#Using_the_yank_and_thru_Commands
.. _Strophic Representations: ch20.html#Strophic_Representations
.. _ Command: ch20.html#The_strophe_Command
.. _ Commands: ch20.html#Using_the_strophe_and_thru_Commands
.. _Reprise: ch20.html#Reprise
.. _Searching for Patterns: ch21.html
.. _ Command: ch21.html#The_patt_Command
.. _'s Tag Option: ch21.html#Using_patt's_Tag_Option
.. _ Command:
    ch21.html#Matching_Multiple_Records_Using_the_patt_Command
.. _ Command: ch21.html#The_pattern_Command
.. _Patterns of Patterns: ch21.html#Patterns_of_Patterns
.. _Reprise: ch21.html#Reprise
.. _Classifying: ch22.html
.. _ Command: ch22.html#The_recode_Command
.. _Classifying Intervals: ch22.html#Classifying_Intervals
.. _Clarinet Registers: ch22.html#Clarinet_Registers
.. _Open and Close Position Chords:
    ch22.html#Open_and_Close_Position_Chords
.. _Flute Fingering Transitions: ch22.html#Flute_Fingering_Transitions
.. _humsed: ch22.html#Classifying_with_humsed
.. _Classifying Cadences: ch22.html#Classifying_Cadences
.. _Orchestration: ch22.html#Orchestration
.. _Reprise: ch22.html#Reprise
.. _Rhythm: ch23.html
.. _ Representation: ch23.html#The_**recip_Representation
.. _ Command: ch23.html#The_dur_Command
.. _Classifying Durations: ch23.html#Classifying_Durations
.. _ Command: ch23.html#Using_yank_with_the_timebase_Command
.. _ Command: ch23.html#The_metpos_Command
.. _Changes of Stress: ch23.html#Changes_of_Stress
.. _Reprise: ch23.html#Reprise
.. _The Shell (III): ch24.html
.. _Shell Programs: ch24.html#Shell_Programs
.. _ Statement: ch24.html#Flow_of_Control:_The_if_Statement
.. _ Statement: ch24.html#Flow_of_Control:_The_for_Statement
.. _A Script for Identifying Transgressions of Voice-Leading:
    ch24.html#A_Script_for_Identifying_Transgressions_of_Voice-Leading
.. _            (1) Parts Out Of Range: ch24.html#Parts_Out_Of_Range
.. _            (2) Augmented/Diminished Melodic Intervals: ch24.html
    #Augmented-Diminished_Melodic_Intervals
.. _            (3) Consecutive Fifths or Octaves:
    ch24.html#Consecutive_Fifths_or_Octaves
.. _            (4) Doubled Leading Tone:
    ch24.html#Doubled_Leading_Tone
.. _            (5) Avoid Unisons: ch24.html#Avoid_Unisons
.. _            (6) Crossed Parts: ch24.html#Crossed_Parts
.. _            (7) Parts Separated by Greater than an Octave:
    ch24.html#Parts_Separated_by_Greater_than_an_Octave
.. _            (8) Overlapped Parts: ch24.html#Overlapped_Parts
.. _            (9) Exposed Octaves: ch24.html#Exposed_Octaves
.. _Reprise: ch24.html#Reprise
.. _Similarity: ch25.html
.. _ Command: ch25.html#The_correl_Command
.. _correl: ch25.html#Using_a_Template_with_correl
.. _ Command: ch25.html#The_simil_Command
.. _Defining Edit Penalties: ch25.html#Defining_Edit_Penalties
.. _ Command: ch25.html#The_accent_Command
.. _Reprise: ch25.html#Reprise
.. _Moving Signifiers Between Spines: ch26.html
.. _ Command: ch26.html#The_rend_Command
.. _ Command: ch26.html#The_cleave_Command
.. _Creating Mixed Representations:
    ch26.html#Creating_Mixed_Representations
.. _Reprise: ch26.html#Reprise
.. _Text and Lyrics: ch27.html
.. _ Representations: ch27.html#The_**text_and_**silbe_Representations
.. _ Command: ch27.html#The_text_Command
.. _ Command: ch27.html#The_fmt_Command
.. _Rhythmic Feet in Text: ch27.html#Rhythmic_Feet_in_Text
.. _Concordance: ch27.html#Concordance
.. _Simile: ch27.html#Simile
.. _Word Painting: ch27.html#Word_Painting
.. _Emotionality: ch27.html#Emotionality
.. _Other Types of Language Use: ch27.html#Other_Types_of_Language_Use
.. _Reprise: ch27.html#Reprise
.. _Dynamics: ch28.html
.. _ Representations: ch28.html#The_**dynam_and_**dyn_Representations
.. _ Representation: ch28.html#The_**dyn_Representation
.. _ Representation: ch28.html#The_**dB_Representation
.. _ Command: ch28.html#The_db_Command
.. _Processing Dynamic Information:
    ch28.html#Processing_Dynamic_Information
.. _Terraced Dynamics: ch28.html#Terraced_Dynamics
.. _Dynamic Swells: ch28.html#Dynamic_Swells
.. _MIDI Dynamics: ch28.html#MIDI_Dynamics
.. _Reprise: ch28.html#Reprise
.. _Differences and Similarities: ch29.html
.. _cmp: ch29.html#Comparing_Files_Using_cmp
.. _diff: ch29.html#Comparing_Files_Using_diff
.. _ Command: ch29.html#Comparing_Inventories--The_comm_Command
.. _Reprise: ch29.html#Reprise
.. _MIDI Input Tools: ch30.html
.. _ Command: ch30.html#The_record_Command
.. _ Command: ch30.html#The_encode_Command
.. _Reprise: ch30.html#Reprise
.. _Repertoires and Links: ch31.html
.. _ Command: ch31.html#The_find_Command
.. _Content Searching: ch31.html#Content_Searching
.. _ Command: ch31.html#Using_find_with_the_xargs_Command
.. _Repertoires As File Links: ch31.html#Repertoires_As_File_Links
.. _Reprise: ch31.html#Reprise
.. _The Shell (IV): ch32.html
.. _ Programming Language: ch32.html#The_awk_Programming_Language
.. _Automatic Parsing of Input Data:
    ch32.html#Automatic_Parsing_of_Input_Data
.. _Arithemtic Operations: ch32.html#Arithemtic_Operations
.. _Conditional Statements: ch32.html#Conditional_Statements
.. _Assigning Variables: ch32.html#Assigning_Variables
.. _Manipulating Character Strings:
    ch32.html#Manipulating_Character_Strings
.. _ Loop: ch32.html#The_for_Loop
.. _Reprise: ch32.html#Reprise
.. _Word Sounds: ch33.html
.. _ Representation: ch33.html#The_**IPA_Representation
.. _Alliteration: ch33.html#Alliteration
.. _Classifying Phonemes: ch33.html#Classifying_Phonemes
.. _Properties of Vowels: ch33.html#Properties_of_Vowels
.. _Vowel Coloration: ch33.html#Vowel_Coloration
.. _Rhyme and Rhyme Schemes: ch33.html#Rhyme_and_Rhyme_Schemes
.. _Reprise: ch33.html#Reprise
.. _Serial Processing: ch34.html
.. _Pitch-Class Representation: ch34.html#Pitch-Class_Representation
.. _ Command: ch34.html#The_pcset_Command
.. _Prime Form and Normal Form: ch34.html#Prime_Form_and_Normal_Form
.. _ Command: ch34.html#Interval_Vectors_Using_the_iv_Command
.. _ Command: ch34.html#Segmentation_Using_the_context_Command
.. _ Command: ch34.html#The_reihe_Command
.. _Generating a Set Matrix: ch34.html#Generating_a_Set_Matrix
.. _Locating and Identifying Tone-Rows: ch34.html
    #Locating_and_Identifying_Tone-Rows
.. _Reprise: ch34.html#Reprise
.. _Layers: ch35.html
.. _Implied Harmony: ch35.html#Implied_Harmony
.. _Sound and Spectra: ch36.html
.. _ Representation: ch36.html#The_**spect_Representation
.. _ Command: ch36.html#The_SHARC_Database_and_spect_Command
.. _ Command: ch36.html#The_mask_Command
.. _ Command: ch36.html#The_sdiss_Command
.. _ Command: ch36.html#Connecting_Humdrum_with_Csound--
    the_kern2cs_Command
.. _Sound Analysis: ch36.html#Sound_Analysis
.. _Reprise: ch36.html#Reprise
.. _Electronic Music Editing: ch37.html
.. _The Process of Electronic Editing:
    ch37.html#The_Process_of_Electronic_Editing
.. _Establishing the Goal: ch37.html#Establishing_the_Goal
.. _Documenting Encoded Data: ch37.html#Documenting_Encoded_Data
.. _Sources: ch37.html#Sources
.. _Selecting a Sample from Some Repertory:
    ch37.html#Selecting_a_Sample_from_Some_Repertory
.. _Encoding: ch37.html#Encoding
.. _Transposing Instruments: ch37.html#Transposing_Instruments
.. _Instrument Identification: ch37.html#Instrument_Identification
.. _Leading Barlines: ch37.html#Leading_Barlines
.. _Ornamentation: ch37.html#Ornamentation
.. _Editing Sections: ch37.html#Editing_Sections
.. _ Representation:
    ch37.html#Editorialisms_in_the_**kern_Representation
.. _Adding Reference Information:
    ch37.html#Adding_Reference_Information
.. _Proof-reading Materials: ch37.html#Proof-reading_Materials
.. _Data Integrity Using the VTS Checksum Record:
    ch37.html#Data_Integrity_Using_the_VTS_Checksum_Record
.. _Preparing a Distribution: ch37.html#Preparing_a_Distribution
.. _Electronic Citation: ch37.html#Electronic_Citation
.. _Reprise: ch37.html#Reprise
.. _Systematic Musicology: ch38.html
.. _Comparison Repertory: ch38.html#Comparison_Repertory
.. _Randomizing: ch38.html#Randomizing
.. _ Command: ch38.html#Using_the_scramble_Command
.. _ Command: ch38.html#Retrograde_Controls_Using_the_tac_Command
.. _Autophase Procedure: ch38.html#Autophase_Procedure
.. _Reprise: ch38.html#Reprise
.. _Troubleshooting: ch39.html
.. _Encoding Errors: ch39.html#Encoding_Errors
.. _Searching Tips: ch39.html#Searching_Tips
.. _Pipeline Tips: ch39.html#Pipeline_Tips
.. _Reprise: ch39.html#Reprise
.. _Conclusion: ch40.html
.. _Pursuing a Project with Humdrum:
    ch40.html#Pursuing_a_Project_with_Humdrum
.. _Bibliography: guide.bibliog.html
.. _Appendix I:  Humdrum Reference Records: guide.append1.html
.. _    Authorship Information: guide.append1.html#Authorship_Information
.. _    Performance Information:
    guide.append1.html#Performance_Information
.. _    Work Identification Information:
    guide.append1.html#Identification_Information
.. _    Imprint Information: guide.append1.html#Imprint_Information
.. _    Copyright Information: guide.append1.html#Copyright_Information
.. _    Analytic Information: guide.append1.html#Analytic_Information
.. _    Representation Information:
    guide.append1.html#Representation_Information
.. _    Electronic Citation: guide.append1.html#Electronic_Citation
.. _    Further Reference Record Codes:
    guide.append1.html#Further_Reference_Record_Codes
.. _Appendix II:  Instrumentation Codes: guide.append2.html
.. _    Introduction: guide.append2.html#Introduction
.. _    Voice Range: guide.append2.html#Voice_Range
.. _    Voice Quality: guide.append2.html#Voice_Quality
.. _    String Instruments: guide.append2.html#String_Instruments
.. _    Wind Instruments: guide.append2.html#Wind_Instruments
.. _    Percussion Instruments: guide.append2.html#Percussion_Instruments
.. _    Keyboard Instruments: guide.append2.html#Keyboard_Instruments
.. _Index to Problems: problems.html
.. _Index to Names, Works and Genres: guide.music.index.html
.. _General Index: guide.general.index.html
.. _Index of Humdrum Commands: commands.toc.html
.. _On-line Humdrum Course Description: http://dactyl.som.ohio-
    state.edu/Music824/descript.html
.. _Index to Humdrum On-line Resources: http://dactyl.som.ohio-
    state.edu/Music824/music824.index1.html
.. _Humdrum Exercises: http://dactyl.som.ohio-
    state.edu/Music824/music824.index2.html
.. _Summary of **kern Music Representation: representations/kern.html
.. _ Humdrum Toolkit Home Page: index.html
.. _ Humdrum Toolkit Home Page (University of Virginia)  :
    http://www.lib.virginia.edu/dmmc/Music/Humdrum/
.. _Ohio State University Music Cognition Home Page: http://dactyl.som
    .ohio-state.edu/home.html
