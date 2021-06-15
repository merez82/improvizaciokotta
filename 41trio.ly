\header {
  title = "41"
}
\version "2.18.2"

#(set-global-staff-size 38)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
  %  \autoBeamOff
g8 es g bes es d c bes
c as c es bes es, bes' es
c bes c as c g c f,
g f es g f es d f
es bes es g d bes d f
g bes as bes g as f g

bes es, bes' c bes as g f
d c d es f es f d


  % Music follows here.
}

rightTwo = \relative c' {
  \global


  % Music follows here.
  
}

leftOne = \relative c {
  \global
  %solo
es2 g2 f g
as4 as as as g2 f2
g4 g f f es2 r2

g4 f g bes as g f2
f4 g as as g2 f2
es4 es as as g2 r2
f4 as g f es1
  % Music follows here.
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