\version "2.18.2"

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
  % Music follows here.
  
}

rightTwo = \relative c'' {
  \global
  % Music follows here.
  
}

leftOne = \relative c' {
  \global
  % Music follows here.
  a4 b8 a g4 b a g fis2
}

leftTwo = \relative c {
  \global
  % Music follows here.
  
}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = "Organ"
    } <<
      \new Staff = "right" \with {
        midiInstrument = "church organ"
      } \rightOne
      
      \new Staff = "left" \with {
        midiInstrument = "church organ"
      } { \clef bass << \transpose f f {\rightTwo   } 
                    \\ \transpose f f {\leftOne  } >> }
    >>
    \new Staff = "pedal" \with {
      midiInstrument = "church organ"
    } { \clef bass \leftTwo }
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
