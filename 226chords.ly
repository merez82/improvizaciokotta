\header {
  title = "226 scheme"
}
\version "2.18.2"

#(set-global-staff-size 44)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4^"C" g^"G6" g^"C" f^"F" e^"C" d^"G" d^"G7" c^"C"
c^"a" c^"a" a'^"F" f^"F" d^"G" d8[ e] d2
g4^"C" g d'^"G" c^"C" b^"G" a^"a" a^"a" g^"C"
gis^"E" gis^"E" a^"a" f^"d" e^"C64" d^"G7" c2^"C"

}



rightTwo = \relative c' {
  \global


}

leftOne = \relative c {
  \global


% Music follows her0e.
}



leftTwo = \relative c, {
  \global

}
 

 
%ketto = \lyricmode {
%\repeat "unfold" 12 { \skip 8 } 
%\set stanza = #"23.7. "
%\once \override LyricText.self-alignment-X = #LEFT "Áldalak téged, Atyám, mennynek és föld" -- nek Is -- te -- ne,,
%\once \override LyricText.self-alignment-X = #LEFT "mert feltártad a kicsinyeknek" or -- szá -- god tit -- ka -- it.
%}


\score {
 

  \new PianoStaff \with {
    instrumentName = ""
  } <<
    \new Staff = "right" \with { 
      midiInstrument = "acoustic grand"
    } << 
      \override Staff.TimeSignature.stencil = ##f
      \new Voice = "rightOne" {
        \override Stem  #'direction = #UP
        \transpose f f {\rightOne  } 
      }
      
     
      \new Voice = "rightTwo" {
        \override Stem  #'direction = #DOWN
        \transpose f f {\rightTwo }
      }
     
    >>

    
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { 
      \override Staff.TimeSignature.stencil = ##f
      \clef bass << \transpose f f {\leftOne   } 
                    \\ \transpose f f {\leftTwo  } >> }
    
      %\new Lyrics \with { alignBelowContext = "left" }
      %\lyricsto "rightOne"{ \ketto}
      
  >>
   \layout {
  ragged-right = ##f

  \context {
    \Score
      \override LyricText #'font-size = #+2
  }
} 
  \midi {
    \tempo 4=100
  }
}
%\markup { \fontsize #+3 \column{
%  \line{  \bold "21.7."  "Áldalak téged, Atyám, mennynek és föld | nek Istene, " }
%  \line{ \hspace #30  "mert feltártad a kicsinyeknek | országod titkait."}
%  }
%  }