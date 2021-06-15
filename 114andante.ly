\header {
  title = "114 andante"
}
\version "2.18.2"

#(set-global-staff-size 25)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4 c b d c a g2
a4 f e d8[ e] f4 e d2
\bar "|."
d4 e g f e fis a g
c a g fis8[ g] a4 b g2
\bar "|."
d4 g fis a b g fis8[ g] a4
e a gis b c a gis8[ a] b4
\bar "|."
c b b a a g fis g a2 fis2 g1
\bar "|."
g4 c b d c a g2
a4 f e d8[ e] f4 e d2
\bar "|."
d4 e g f a b d c
e b c a b c d b c1~c1~c1

}



rightTwo = \relative c' {
  \global
e2 d4 f e4 c b2 a4 c2 b8 c8
b4 c b2 b4 c4 b2 c2. b4
e4 c2._~c2 b2
b2 d4 fis4 d1 c2 b2
c2 e2
e4 f g d dis e dis e
a,2 c d1

e2 d4 f e4 d~d2 c2 c4 b8 c8
b4 c b2
b4 c4 b d c4 f2. e2. f4
g4 a4  b4 f e1 f1 e1

}

leftOne = \relative c {
  \global
g'1 e1 c4 a' g2~g1
g2. gis4 a2 fis4 g4
a2 g2 fis2 g2
d2 a'2 g2 a2~a2 b4 gis
a2 b2 c4 d e a, a b2. fis2 a2 b1

g1 e4 fis4 b2 f4 a g2~g1
g2.  a4 a4 d b c4 d2 c2 
d1 c1~c2. as4 g1
% Music follows her0e.
}



leftTwo = \relative c, {
  \global
c'2 g2 a2 e2 f2 g2~g1
g4 c e d c d2 e4
a,2  e' dis g,2
g2 d2 g2 d'2 c2 e2
a,2 e'
a4 gis g fis f e b e
d1 g4 f e d

c2 g2 a4 d4 g,2 f2 g2~g1

g4 c e d f g2 a4 gis2 a2
g1

c,4 f e g  as4 f d8 e f4 c1
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