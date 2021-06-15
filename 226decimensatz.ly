\header {
  title = "226 decimensatz"
}
\version "2.18.2"

#(set-global-staff-size 38)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4 g g4 f4 e d d4
c4 c4 c4 a'  f  d4 d8[ e8] d2

g4 g4 d'4 c4 b  a4 a g4
gis gis a f e4 d c2
  % Music follows here.
}

rightTwo = \relative c' {
  \global
e4 d e  b c g gis a
a bes a 2 f2 g2
e'2 g4 e4 g c, d e
e2 c4 d4 c4 b4 g2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
g'1 g4 d d e
e e c  d d1
g1 d4 a'2 b4
b2 a2 g4 f4 e2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
c'4 b c d c b bes a
a g f d bes'2 b2
c2 b4 a g f f' e
e2 f4 d g,2 c2
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