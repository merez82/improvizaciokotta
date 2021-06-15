\version "2.18.2"

global = {
  \key f \major
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
  
}

leftTwo = \relative c' {
  \global
  % Music follows here.
  f,,1 bes c d bes c f \break 
  f,2 f2 bes g2 c a2 d1 bes c2 c2 f1 \break
  

}

chordnotation =  \chordmode {
    f1 bes c d:m g:m6 c f \break
    f2 f bes g c a d1:m g:m6 f2:6sus4 c f1
  }
  
\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
       
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } << \rightOne \\ \rightTwo >>
    
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \clef bass << \leftOne \\ \leftTwo >> }
    
 %   \new ChordNames = "chords" 
 %   <<  \chordnotation >>
    
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
