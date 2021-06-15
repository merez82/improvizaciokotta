\header {
  title = "223 trio"
}
\version "2.18.2"

#(set-global-staff-size 38)

global = {
  \key f \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
  %  \autoBeamOff
a8 f a c f c a c
bes a bes g c a g a
bes g a f g e f a
g a bes c bes a bes g
c a bes c bes g a bes
a g f g f g a d, f e f d
f g a bes c g' f e d e d c
c bes c f, d' c d f,
e' f g c, d e f a
c, bes c f d c d e
f8 e d c bes c d bes a1
  % Music follows here.
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
f2 a2 g2 f2 e4 f e d c1
f2 g a f bes4 bes bes a g1
a2 bes c f, a4 a g g f1~f1
  % Music follows here.
}



leftTwo = \relative c, {
  \global
f1 c'2 d2 c4 a g f c d e c
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