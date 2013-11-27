#!/usr/bin/python

from defs import *

def content(x):
   r = strRange(4 * x) 
   inclLyrics = ""
   for i in xrange(4 * x - 3, 4 * x + 1):
      inclLyrics += '\\include "lyrics%d.ly"\n' % i
   staves = ""
   for i in xrange(4 * x - 3, 4 * x + 1):
      l = numToLetter(i)
      staves += """
     \\new Staff { \\new Voice = "voice%s" \\global \\voice%s  }
     \\new Lyrics \\lyricsto voice%s { \\lyrics%s }""" % (l, l, l, l)
   return """
%c file automatically generated by ./ytemplate.py

\\include "header.ly"
\\include "melodies%s.ly"
%s

#(set-default-paper-size "a3" 'landscape)

\header {
   piece = "Choir %d of 3"
}

\\score{
   \\new ChoirStaff << %s
   >>
   \\layout{}
   \\midi{}
}
""" % ('%', r, inclLyrics, x, staves)


for i in xrange(1, 4):
   file = open('voices' + strRange(4 * i) + '.ly', 'w')
   file.write(content(i))
   file.close()




