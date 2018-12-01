Source: http://manpages.ubuntu.com/manpages/precise/man1/icns2png.1.html

NAME

       icns2png - convert Mac OS icns files to png images

SYNOPSIS

       icns2png [-x|-l] [options] [file ... ]

DESCRIPTION

       icns2png  extracts images from mac .icns files, and exports them to png
       format.

OPTIONS

       -l, --list
              List the contents of one or more icns images

       -x, --extract Extract one or more icons to png images

       -o, --output
              Where to place extracted files. If not specified, icons will  be
              extracted to the same path as the source file.

       -d, --depth
              Sets the pixel depth of the icons to extract. (1,4,8,32)

       -s, --size
              Sets  the  width and height of the icons to extract. (16,48,etc)
              Sizes 16x12, 16x16, 32x32, 48x48, 128x128, etc. are also valid.

       -h, --help
              Displays this help message.

       -v, --version Displays the version information

EXAMPLES

       icns2png  -x  anicon.icns             #  Extract  all  icon  found   in
       anicon.icns
       icns2png -x -s 48 anicon.icns      # Extract all 48x48 32-bit icons
       icns2png -x -s 32 -d 1 anicon.icns # Extract all 32x32 1-bit icons
       icns2png  -l  anicon.icns             #  Lists  the  icons contained in
       anicon.icns

AUTHOR

       Written by Mathew Eis

COPYRIGHT

       Copyright © 2001-2008 Mathew Eis
       This is free software; see the source for copying conditions.  There is
       NO  warranty;  not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
       PURPOSE.

