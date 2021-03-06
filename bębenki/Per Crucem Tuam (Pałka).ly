\version "2.17.3"
#(set-global-staff-size 16.5)

\header	{
  title = "Per Crucem Tuam"
  composer = "muzyka: Piotr Pałka"
  tagline = \markup {
    skład nut: Jan Warchoł
    (jan.warchol@gmail.com, 509 078 203)
  }
}

\paper {
  paper-width = 165 \mm
  paper-height = 240 \mm
  line-width = 145 \mm
  top-margin = 8 \mm
  bottom-margin = 4 \mm
  ragged-last-bottom = ##f
  page-count = 1
  markup-system-spacing #'padding = -3
  last-bottom-spacing #'basic-distance = 8
  tagline = ##f
}
%--------------------------------MELODY--------------------------------
sopranomelody = \relative f' {
  \dynamicUp
  \key f \minor
  \time 3/4
  \tempo 4=40
  \set Timing.beamExceptions = #'()
  \repeat volta 2 {
    \partial 4
    c4\mp | c c f
    \time 4/4
    \set Timing.beamExceptions = #'()
    g2. \breathe g8 as
    bes4 f f f8 g
    e1 \breathe
  }
  \repeat volta 2 {
    as4( -\tweak #'X-offset #-2.7 \mf es) as as8-\tweak #'positions #'(2.5 . 3) ^[\melisma c]\melismaEnd
    bes2. \breathe bes8 c
  }
  \alternative {
    {
      des4 as as as8-\tweak #'positions #'(2.5 . 3) ^[ c] | bes1 \breathe
    }
    {
      \once \override Hairpin #'bound-padding = #2
      des4-\tweak #'X-offset #1 \> as4 as g8 f | g1\!
    }
  }
  \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \bold Fine
  \bar "|."
}
altomelody = \relative f' {
  \dynamicUp
  \key f \minor
  \time 3/4
  \tempo 4=40
  \set Timing.beamExceptions = #'()
  \repeat volta 2 {
    \partial 4
    c4\mp | c c c
    \time 4/4
    \set Timing.beamExceptions = #'()
    \shape Slur #'((0 . 0.25)(0 . 0.5)(0 . 0.5)(0 . 0.25))
    c8([ des c bes] c4) \breathe c8 c
    des4 f8\melisma es\melismaEnd des\melisma c\melismaEnd bes des
    \shape Slur #'((0 . 0.2)(0 . 0.5)(0 . 0.3)(0 . 0.2))
    des4( c8 bes c2) \breathe
  }
  \repeat volta 2 {
    es2-\tweak #'X-offset #-2.7 \mf f4 f
    as4( g8 f g4) \breathe es8 es
  }
  \alternative {
    {
      des4 des c des8 des
      as'4( g8 f g4 es) \breathe
    }
    {
      des4\> des c des8 des
      f4(\! e8 d e2)
    }
  }
  \bar "|."
}
tenormelody = \relative f {
  \dynamicUp
  \key f \minor
  \time 3/4
  \tempo 4=40
  \set Timing.beamExceptions = #'()
  \repeat volta 2 {
    \partial 4
    f4\mp | f8\melisma g\melismaEnd as\melisma bes\melismaEnd as\melisma f\melismaEnd
    \time 4/4
    \set Timing.beamExceptions = #'()
    \shape Slur #'((0 . 0)(0 . 0.3)(0 . 0.3)(0 . 0))
    g4( c g) \breathe g8 g
    bes4 as bes8\melisma as\melismaEnd g c16\melisma bes\melismaEnd
    g1 \breathe
  }
  \repeat volta 2 {
    as2-\tweak #'X-offset #-2.7 \mf as4 c
    bes2. \breathe bes8 bes
  }
  \alternative {
    {
      as4 as8\melisma bes\melismaEnd as8\melisma g\melismaEnd f f
      es2\melisma bes'\melismaEnd \breathe
    }
    {
      as4\> as8\melisma bes\melismaEnd as8\melisma g\melismaEnd f g
      g1\!
    }
  }
  \bar "|."
}
bassmelody = \relative f {
  \dynamicUp
  \key f \minor
  \time 3/4
  \tempo 4=40
  \set Timing.beamExceptions = #'()
  \repeat volta 2 {
    \partial 4
    f4\mp | f f f
    \time 4/4
    \set Timing.beamExceptions = #'()
    e2. \breathe c8 c
    bes4 des8\melisma c\melismaEnd bes4 g8 f
    c'1 \breathe
  }
  \repeat volta 2 {
    c2-\tweak #'X-offset #-2.7 \mf des4 des
    es2. \breathe es8 es
  }
  \alternative {
    {
      f4 f es bes8 bes | es1
    }
    {
      f4\> f es bes8 bes | c1\!
    }
  }
  \bar "|."
}
akordy = \chordmode {
}
%--------------------------------LYRICS--------------------------------
text = \lyricmode {
  Per Cru -- cem Tu -- am
  a -- do -- ra -- mus Te,
  Do -- mi -- ne.
  Cru -- cem Tu -- am
  a -- do -- ra -- mus Te,
  Do -- mi -- ne.
  ra -- mus Te,
  Do -- mi -- ne.
}

tenortext = \lyricmode {
  Per Cru -- cem Tu -- am
  a -- do -- ra -- mus Te,
  Do -- mi -- ne.
  Cru -- cem Tu -- am
  a -- do -- ra -- mus Te,
  Do -- mi -- ne. __
  ra -- mus Te,
  Do -- mi -- ne.
}
%--------------------------------ALL-FILE VARIABLE--------------------------------

\score {
  \new ChoirStaff <<
    \new Staff = soprano {
      \clef treble
      \new Voice = soprano {
        \sopranomelody
      }
    }
    \new Lyrics = sopranolyrics \lyricsto soprano \text

    \new Staff = alto {
      \clef treble
      \new Voice = alto {
        \altomelody
      }
    }
    \new Lyrics = altolyrics \lyricsto alto \text

    \new Staff = tenor {
      \clef "treble_8"
      \new Voice = tenor {
        \tenormelody
      }
    }
    \new Lyrics = tenorlyrics \lyricsto tenor \tenortext

    \new Staff = bass {
      \clef bass
      \new Voice = bass {
        \bassmelody
      }
    }
    \new Lyrics = basslyrics \lyricsto bass \text
  >>
  \layout {
    indent = 0
    \override Lyrics.VerticalAxisGroup #'nonstaff-relatedstaff-spacing #'padding = #0.35
    \override Lyrics.VerticalAxisGroup #'nonstaff-unrelatedstaff-spacing #'padding = #0.75
  }
}
