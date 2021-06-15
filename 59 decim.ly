\header {
  title = "59 decim"
}
\version "2.18.2"
#(set-global-staff-size 33)
global = {
  \key c \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
c4 d es f g g as g
f g f es g f8 es d2
c4 d es f g g as g c g8 as g4 f
es d c2
es4 f g g f g as g
d es f f g f es d
c' g8 as g4 f es d c2


  % Music follows here.
  
}

rightTwo = \relative c' {
  \global
g4 g c c es es d es as,
es' b c bes b8 c b2
g4 g c b c bes d d
f es b b c b g2
g4 bes2. bes2 c4 b4
b c bes2
es4 bes c b
es2 d2 c4 b g2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
  % Music follows here.

es4 d g f bes bes as  bes
f bes g g g as8 a f2
es4 d g f es g c b
c bes g as as f es2
es4 as g2 g2 f4 d4
g2 f2 bes4 f fis4 g4
g1 g4 f es2
}

leftTwo = \relative c, {
  \global
c'4 b c d es es f es
d es d c es d8 c8 g2
c4 b c d c es f g
as es d d c g c2
c4 d es2 des4 c4 f,4 g4
g4 c d2 es4 des4 as g4
c2 b2 c4 g c2
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
        \transpose f f {\rightOne}
      }
      
     
      \new Voice = "rightTwo" {
        \override Stem  #'direction = #DOWN
        \transpose f f {\rightTwo}
      }
     
    >>

    
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { 
      \override Staff.TimeSignature.stencil = ##f
      \clef bass << \transpose f f {\leftOne} \\ \transpose f f {\leftTwo} >> }
    
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