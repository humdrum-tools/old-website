

Installing and Using the Humdrum "perform" Command under Linux
==============================================================

Outdated information below.  Name of perform program changed
to `humplay <http://extras.humdrum.org/humplay>`_.

How to Use the "perform" Command in Linux
-----------------------------------------

These directions are intended to help users install and use the revised
Humdrum "perform" version 2.0 command. These directions are for Red Hat 6.0
Linux, although they may be somewhat similar for other versions of Linux.

Author: Craig Stuart Sapp
Date: Tue Aug 31 13:21:36 PDT 1999

--------

1.  Install the soundcard. You will have to check the list in Appendix A
    to see if the soundcard you have will work in Red Hat Linux 6.0.

To install the soundcard, first turn off the computer and put the soundcard
into one of the expansion slots of the computer.

Now start the computer under Linux, and run the program /usr/sbin/sndconfig
as root.

If you have a recognized PCI interfaced soundcard, the installation should be
completely automatic. If you have an ISA interfaced soundcard, the you will
have to manually set the IRQs, DMAs, and I/O Ports. You can figure out these
manual settings in two ways: (1) log into Windows 95/98/NT, go to the control
panel system icon and click on the devices tab. Then go to the Multimedia
entries and search for the soundcard entry. Double click on the soundcard
entry and then select the resources tab. On the resources page, the IRQs,
DMAs, and I/O Ports which are used for the the soundcard are listed: copy
these settings and try them in /usr/sbin/sndconfig. Manual setting method (2)
is: try all possible permutations of the settings for the soundcard until one
of them works. The /usr/sbin/sndconfig program will play an audio file and a
MIDI file to test the sound configuration. It is also possible to mix methods
(1) and (2) together for manually setting the soundcard.


2.  Running the perform command.

The perform command understands **MIDI humdrum spines in input files. **MIDI
spines can be generated from **kern data with the "midi" humdrum tool. See
note 3A below however.

Here are some important setup options for the perform command:

"perform -l" lists all possible MIDI output ports. By default MIDI
information will be sent out port 0 unless otherwise specified with the
"perform -p X" option where X is another port number. For example on the
CCARH lab computer, there are three possible MIDI output ports to send MIDI
to:

    > 0:Sound Blaster 16 (MIDI Out)
>     1:AWE Midi Emu (MIDI Out)
>     2:AWE32-0.4.3 (RAM4096k) (Wavetable)

    There are two MIDI output ports (0 and 1) and one internal MIDI
    output port which sends the MIDI to the internale soundcard synthesizer,
    so to play MIDI output through port 1, you would use the option setting
    "perform -p1". See note 3C however.

Other interesting arguments to the perform command:

"perform -t X" sets the tempo scaling to X, for example to play a file twice
as fast, try "perform -t 2.0". The "<" and ">" keys can be used to control
the tempo while the performance is occurring.

"perform --memory 1000000" sets the storage area to 1 Mb. This is the default
size of the memory. Large orchestral works will need more memory, such as
8000000. In the newest (and as yet unfinished version of perform), there will
be no need of this option.

"perform --options" will list all command line arguments, including
hidden/undocumented options if present.

"perform -h" will give a short help message on using the perform command.

The options to perform can occur in any order. For example if you are
performing the file zzz.hmd, then both of these calls to perform are valid
and equivalent: perform -t2 zzz.hmd perform zzz.hmd -t2

Most command-line options have aliases. The default velocity setting can be
accessed with either "-v" or "--velocity": perform -v 64 zzz.hmd perform
--velocity 64 zzz.hmd The "perform --options" will list all options aliases.


3.  Known bugs/quirks in the perform command for Linux.



    -   The perform command cannot be used in a command pipeline. There
    is some strange terminal setting problem that needs to be worked with to
    get this working. Currently you must write an intermediate file with the
    "midi" humdrum tool and then run the "perform" command as a separate
    -   Not all of the performance commands have been implemented.
    -   On the internal MIDI in the soundcard at CCARH, only a monophonic
    voice is played at any given time. So if you are playing a symphony, you
    only hear one part. This seems to be a problem with the Linux driver for
    the soundcard. The external MIDI port output of perform works properly in
    the CCARH lab.
    -   If you have a very large file to perform you may have to increase
    the memory size of the internal storage space if directed to do so by an
    error message. Use perform with the --memory X option where X is the
    number of bytes to store the data in. The default setting is 1000000
    bytes.


Appendix A: Soundcards that can be used in Red Hat Linux 6.0:
-------------------------------------------------------------

Here is a list of the soundcards that work with Linux Red Hat 6.0. This list
was extracted from the binary program /usr/sbin/sndconfig which is the
program to use to install a soundcard in Red Hat 6.0 Linux.

/usr/sbin/sndconfig v 1.77 1999/04/19 15:29:04

> **Module to use****Description of Soundcard
> ad1816AD1816 (Acer FX-3D, HP Kayak)
> ad1848CMI8330 sound chip (Cyrix MediaGX, many motherboards)
> ad1848Compaq Deskpro XL Sound
> ad1848Ensoniq SoundScape VIVO
> ad1848Windows Sound System (AD1848/CS4248/CS4231)
> adlib_cardAdLib
> amd7930AMD7930 (sun4c) & cs4231 CS4231 (some sun4m, sun4u)
> cs4232Crystal CS423x sound chip
> es1370* Ensoniq AudioPCI 1370 (SoundBlaster 64/128 PCI)
> es1371Creative/Ensoniq AudioPCI
> gusGravis UltraSound
> gusGravis UltraSound MAX
> gusGravis UltraSound PnP
> mad16MAD16 Pro (OPTi 82C929/82C930)
> mad16Mozart/MAD16 (OPTi 82C928)
> mad16miroSOUND PCM12 opl3sa OPL3-SA1 sound chip
> msnd_classicTurtle Beach MultiSound Classic/Monterey/Tahiti
> msnd_pinnacleTurtle Beach MultiSound Pinnacle/Fiji
> opl3sa2OPL3-SA2/3/x sound chip
> pas2Pro Audio Spectrum/Studio 16, Logitech SoundMan
> pssPSS (Orchid SW32, Cardinal DSP16) sonicvibes S3 SonicVibes
> sbACER Notebook sound
> sbAdvance Logic ALS-007
> sbAdvance Logic ALS-100/110
> sbESS1688 AudioDrive
> sbESS1868 AudioDrive
> sbESS688 AudioDrive
> sbLogitech SoundMan Games (not SM16 or SM Wave!)
> sbMediaVision Jazz16 (ProSonic, SoundMan Wave)
> sbSound Blaster
> sbSound Blaster 16
> sb***,* Sound Blaster AWE32/64
> sbSound Blaster Pro
> sgalaxyAztech Sound Galaxy Waverider Pro 32-3D, Washington
> sscapeEnsoniq SoundScape
> trix** MediaTrix AudioTrix Pro

--------


