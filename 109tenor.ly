\header {
  title = "109 trio c.f. in tenor"
}
\version "2.18.2"

#(set-global-staff-size 22)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
   
g4 bes8 as8 g4 es4 es8 d es8 c
f4 g8 as as4 g8 f8 g2
bes4 c8 d es4 bes4 
es,4 c d8 es f d es4 f8 d8 es2
g4 f8 es es4 d4 c8 d8 es8 g8
bes4 g f bes bes es, d1 

g4 f8 es es4 f d
es8 f g as bes es
c4 bes4 as4 g8 f8 g1
}



rightTwo = \relative c' {
  \global



}

leftOne = \relative c {
  \global

es4 f g g g as bes2 g1
es4 f g g g as bes2 g4 as4 g2
bes4 bes c bes as g f g
bes as g2 f1

bes4 bes c bes as g f g as g f2 es1
% Music follows her0e.
}



leftTwo = \relative c, {
  \global
es4 d es4 es' c as d bes es1
g,4 as4 es2 c4 f4 bes2 es4 bes4 es2
es,4 g as bes  f es d es
d2 es8 f g as bes4 c d bes4
es,4 g as d, bes'1~bes1 es,1
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