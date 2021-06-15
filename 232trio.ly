\header {
  title = "232 trio wannabe"
}
\version "2.18.2"

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4 g g g  g a8[ g] f[ e] f4 e f g f e d c2
g'4 g g g  g a8[ g] f[ e] f4 e f g f e d c2

d4 g fis g a b c b a b c8[ b] a4 b a g2
g4 g g g  g a8[ g] f[ e] f4 e f g f e d c2
    
  % Music follows here.
  
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
e4 d c d e a f a c d e d c b c2
d4 b c b e d c a c d e a, b a a2
b4 c d b fis g a g fis g a e' g fis g2
c,4  d e f e c d  c c a c d c d e2
  % Music follows here.
  
}

leftTwo = \relative c, {
  \global
c'4 g a b c f, a d a' g8[ f] e4 f g g, c2
g'4 f e d c bes a d g, f e d e fis8[ gis] a2
g4 a b e d b a e' c b a c b d g,2 e'4 b c d e f d a g f e f g2 c
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