===========================
Syntax Coloring in Vim
===========================

Users of VIM rejoice! You can work with Humdrum files with the 
wonderful addition of syntax highlighting. Your days of monochromatic 
editing are gone!

Simply download the following file `humdrum.vim <http://www.ccarh.org/software/humdrum/vi/syntax/humdrum.vim>`_
to use in the editor program *vim* for coloring while editing the different components of the Humdrum data format.

There are several ways one might use this:

- *Manual loading*: you can load the colorizing for Humdrum data manually by typing one of the following commands inside the vim editor:

    - ``:source humdrum.vim``
        - ``so humdrum.vim``

        - *Automatic Loading*

          - First, add these lines to a file in your home directory called ``.vimrc:``
                    - ``syntax on``
                    - ``au BufRead,BufNewFile *.hmd set filetpye=humdrum``
                    - ``au! Syntax humdrum source ~/.vim/humdrum.vim``

          This basically tells vim to turn on the 
          syntax highlighting for filetypes **.hmd** and **.krn**.

          - Then copy the humdrum.vim file into the location ~/.vim/humdrum.vim

All done!

.. image:: images/vimhighlighting.png
   :align: right
   :scale: 80%


Here we have an example of syntax highlighting in 
vim using the following coloring conventions:

- Green: Bibliographic Records
- Light Blue: Global Comments
- Blue: Local Comments
- Pink: Tandem Interpretations
- Red Background: Invalid Tabs

Some more highlighting designed for the ``**kern`` representation:

- White Background: Measure Lines
- White Background: Chords
- Blue Background: Invalid Chording Spaces
