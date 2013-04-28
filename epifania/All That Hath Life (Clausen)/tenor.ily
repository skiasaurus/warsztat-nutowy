\version "2.16.1"

% funkcje pomocnicze:

unisono =
#(define-music-function (parser location music)
   (ly:music?)
   #{
     \oneVoice
     \new Voice {
       \override NoteColumn #'ignore-collision = ##t
       \hideNotes
       \oneVoice
       \override Hairpin #'stencil = ##f
       \override DynamicText #'stencil = ##f
       \override DynamicTextSpanner #'stencil = ##f
       \override Slur #'stencil = ##f
       \override PhrasingSlur #'stencil = ##f
       #music
     }
   #})

rownyRytm =
#(define-music-function (parser location music)
   (ly:music?)
   #{
     \unHideNotes
     \oneVoice
     #music
   #})

podzial =
#(define-music-function (parser location music)
   (ly:music?)
   #{
     \voiceTwo
     \new Voice  {
       \voiceOne
       \override Hairpin #'stencil = ##f
       \override DynamicText #'stencil = ##f
       \override DynamicTextSpanner #'stencil = ##f
       #music
     }
   #})

tenorII = \relative f {

  % w komentarzach to, czego w danym takcie
  % nie potrafię zrealizować
  
  g8\f g g b b b
  \slurDashed
  \set melismaBusyProperties = #'()
  a b c b4.\<(
  bes8.--\!) bes16 bes8 c c c
  \slurSolid
  \unset melismaBusyProperties
  b4\> b8\! r g b
  d d16( c d8) f-- e c
  d2.
  f8-- e c d4.\breathe
  g,4 g8 a4 a8
  g( a) b a4.\breathe
  
  % kartka 2.
  g2.\fp~
  \time 9/8
  \slurDashed
  \set melismaBusyProperties = #'()
  g~ g4.\<(
  \time 6/8
  e'\f) d\breathe
  \slurSolid
  \unset melismaBusyProperties
  b4 b8 d4 d8
  e4 e8 d b c
  d( b g a4.\>)
  g2.\p
  R2.*2
  
  % kartka 3.
  c8\< c c c c c
  c4\cresc c8 a4 a8
  g\f g g b b b
  \slurDashed
  \set melismaBusyProperties = #'()
  a b c b4.(
  bes8.--) bes16 bes8 c c c
  \slurSolid
  \unset melismaBusyProperties
  b4\> b8--\! r g b
  d d16( c d8) f-- e c
  d2.
  f8-- e c d4.~\>
  << d{s8 s4\!}>> r4.
  
  % kartka 4.
  g,8 g g d' d d
  e e e d4 d8
  c4 c8 d4.\breathe
  c4 c8\> b4 b8^\markup{\italic{rit.}}
  a4 a8 b4.~
  b2.\fermata\p
  % nie wiem, co zrobić z tą częścią, aż do
  % końca kartki
  
  %kartka 5.
  g8\p^\markup{legato} g\< g d'\! d d
  d4.\> << a~({s8\! s4}>>
  a4. bes4) c8^\markup{\italic{ten.}}
  \time 5/4
  d4 d2\> r4\! r
  R1*5/4
  a4\p\<^\markup{sempre legato (without accents)} b a8\! b d4\> b\!
  a4 b a8 b d4 b
 a4 b a8 b d4 b
 a4 b a8 b d4 b
 a4 b a8 b d4 b
 
 % kartka 6.
  a4 b a8 b d4 b
  a4 b a8 b d4 b
  a4 b a8 b d4 b
  a4 b a8 b d4\> b
  a4 b a8 b d4 b
  r\! g8\pp a a4 a2^\markup{\italic{rit.}} \bar "||"
  \time 6/8
  % nie wiem, co zrobić z tą częścią, aż do
  % końca kartki
  
  % kartka 7.
  R2.*2^\markup{Tempo primo}
  c8\mf\< c c c c c
  c4 c8 a4 a8
  g\f g g b b b
  \slurDashed
  \set melismaBusyProperties = #'()
  a b c b4.(
  bes8.--) bes16 bes8 c c c
  \slurSolid
  \unset melismaBusyProperties
  b4\> b8--\! r g\mf b
  d d16( c d8) f-- e c
  d2.\<
  d4.\f b?\breathe
  
  % kartka 8.
  d4--\mf\< b8 d4-- b8
  d4-- b8 d4-- b8
  r d bes b4.~
  b b4\ff r8 \bar "|."
}

tenorI = \relative f {
  \rownyRytm{
    g8\f g g d' d d
    \slurDashed
    \set melismaBusyProperties = #'()
    c d e d4.\<(
    es8.--\!) es16 es8 f f f
    \slurSolid
    \unset melismaBusyProperties
    d4\> d8\!
  }
  \unisono{
    r g, b
    d d16( c d8) f-- e c
    d2.
    f8-- e c d4.\breathe
  }
  \rownyRytm{
    g,4 g8 d'4 d8
    c( d) e d4.\breathe
  }
  
  \unisono{
    % kartka 2.
    g,2.\fp~
    \time 9/8
    \slurDashed
    \set melismaBusyProperties = #'()
    g~ g4.\<(
    \time 6/8
    e'\f) d\breathe
    \slurSolid
    \unset melismaBusyProperties
  }
  \rownyRytm{
    e4 e8 fis4 fis8
  }
  \unisono{
    e4 e8 d b c
    d( b g a4.\>)
    g2.\p
    R2.*2
    
    % kartka 3.
    c8\< c c c c c
  }
  \rownyRytm{
    c4\cresc c8 c4 c8
    g\f g g d' d d
    \slurDashed
    \set melismaBusyProperties = #'()
    c d e d4.(
    es8.--) es16 es8 f f f
    \slurSolid
    \unset melismaBusyProperties
    d4\> d8--\!
  }
  \unisono{
    r g, b
    d d16( c d8) f-- e c
    d2.
    f8-- e c d4.~\>
    << d{s8 s4\!}>> r4.
    
    % kartka 4.
    g,8 g g d' d d
    e e e d4 d8
    c4 c8 d4.\breathe
    c4 c8\> b4 b8^\markup{\italic{rit.}}
    a4 a8 b4.~
    b2.\fermata\p
    % nie wiem, co zrobić z tą częścią, aż do
    % końca kartki
    
    %kartka 5.
    g8\p^\markup{legato} g\< g d'\! d d
    d4.\> << a~({s8\! s4}>>
    a4. bes4) c8^\markup{\italic{ten.}}
    \time 5/4
    d4 d2\> r4\! r
    R1*5/4
    a4\p\<^\markup{sempre legato (without accents)} b a8\! b d4\> b\!
    a4 b a8 b d4 b
   a4 b a8 b d4 b
   a4 b a8 b d4 b
   a4 b a8 b d4 b
   
   % kartka 6.
    a4 b a8 b d4 b
    a4 b a8 b d4 b
    a4 b a8 b d4 b
    a4 b a8 b d4\> b
    a4 b a8 b d4 b
    r\! g8\pp a a4 a2^\markup{\italic{rit.}} \bar "||"
    \time 6/8
    % nie wiem, co zrobić z tą częścią, aż do
    % końca kartki
    
    % kartka 7.
    R2.*2^\markup{Tempo primo}
    c8\mf\< c c c c c
  }
  \rownyRytm{
    c4 c8 c4 c8
    g\f g g d' d d
    \slurDashed
    \set melismaBusyProperties = #'()
    c d e d4.(
    es8.--) es16 es8 f f f
    \slurSolid
    \unset melismaBusyProperties
    d4\> d8--\!
  }
  \unisono{
    r g,\mf b
    d d16( c d8) f-- e c
    d2.\<
  }
  \rownyRytm{
  f4.\f d\breathe
  
  % kartka 8.
  f4--\mf\< d8 f4-- d8
  f4-- d8 f4-- d8
  r d f d4.~
  d d4\ff r8 \bar "|."
  }
}
  
\new Staff \with { \consists "Ambitus_engraver" } {
  \tag #'solo {
    \set Staff.midiInstrument = "clarinet"
    \set Staff.midiMinimumVolume = #0.6
    \set Staff.midiMaximumVolume = #0.8
  }
  \tag #'chor {
    \set Staff.midiInstrument = "acoustic grand"
    \set Staff.midiMinimumVolume = #0.4
    \set Staff.midiMaximumVolume = #0.6
  }
  \set Staff.instrumentName = "T "
  \set Staff.shortInstrumentName = "T "
  \dynamicUp
  \tupletUp
  \clef "treble_8"
  
  \key g \major
  \time 6/8
  <<
    \tenorI
    \tenorII
  >>
}

\addlyrics {
  All that hath life and breath praise ye the Lord,
  shout to the Lord, Al -- le -- lu -- ia!
  Al -- le -- lu -- ia, __ Al -- le -- lu -- ia!
  Al -- le -- lu -- ia.
  Praise __ the Lord with joy -- ful song,
  
  % kartka 2.
  praise, __ _ _ praise Him!
  praise the Lord with joy -- ful song,
  Al -- le -- lu -- ia.
  
  % kartka 3.
  All that hath life and breath praise Him,
  praise Him,
  All that hath life and breath praise ye the Lord.
  Shout to the Lord, Al -- le -- lu -- ia,
  Al -- le -- lu -- ia, __ Al -- le -- lu -- ia,
  Al -- le -- lu -- ia. __
  
  % kartka 4.
  All that hath life and breath sing to the Lord
  a new- made song, % nie wiem, co z myślinikiem w tekście
  praise his name, Al -- le -- lu -- ia.
  
  % kartka 5.
  All that hath life and breath praise Him, __
  O praise Him.
  Praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  
  % kartka 6.
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  praise Him, al -- le -- lu -- ia,
  Al -- le -- lu -- ia. __
  
  % kartka 7.
  all that hath life and breath praise Him,
  praise Him,
  All that hath life and breath praise ye the Lord,
  Shout to the Lord, al -- le -- lu --ia!
  Al -- le -- lu -- ia, __ Al -- le -- lu -- ia,
  praise Him!
  
  % kartka 8.
  Praise Him, laud Him,
  praise Him, laud Him,
  Al -- le -- lu -- ia!
  
}