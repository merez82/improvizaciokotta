\header {
  title = "Toccata C"
}
\version "2.18.2"
#(set-global-staff-size 25)
global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
g''16 c, e g, a b c d e g, c e,
f g a b c e, g c, d e f g
f g f g f g e d
c''16 e, g c, d e f g a c, f a,
b c d e
f b, d g, f' b, c d < c e,>2

d'16 g, b d, e fis g a b d, g b,
c d e fis
g16 b, d g, a b c d e g, c e, fis g a b
c b a g fis d e fis g e fis g a fis g a 
b g a b c a b c d b c d f e f d

e f g c, e g, c e,
e' f g c, e g, c e,
e' f g c, f a, c f,
f' g a g f e d c b c d e f e f d e2
%b c b c b c b a b2~
%b16 d16 e fis g d e b c2
%c16 a' e d c d e d c2
%c fis, g fis c' a g fis <g b,>2



  % Music follows here.
  
}

rightTwo = \relative c' {
  \global
s1 s1 s1 s1
  % Music follows here.
  
}

leftOne = \relative c {
  \global
  % Music follows here.
s1 s1 e'4 e, f a g1
g2 b4 c g2 c a4~a16 fis g a 
b g a b c a b c  d b a g
a c d e d4 b4
c1 a2
d16 e f e d c d f g,1

%d e d e d e d c
%d16 g, b d, g a b c d2
%e16 g, a b c a c b c2
%f16 a, c f, g a b c

}

leftTwo = \relative c, {
  \global
s1 s1 c1 c1 g'1 g g g
c2 a2 f2 d2 g2 c2
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