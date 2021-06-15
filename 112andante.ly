\header {
  title = "112 andante"
}
\version "2.18.2"

#(set-global-staff-size 25)

global = {
  \key g \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4 fis g e d c b2

g'4 fis g c8[ b] a4 b a2

a4 b c g fis g a d,
e e fis a g fis g2
\bar "|."
fis4 g a a d, c b2
g'4 a b b fis e dis2
e4 fis g e fis g a fis
b a g fis g dis e2
\bar "|."
g4 fis g e d c b2

g'4 fis g c8[ b] a4 b a2

g4 fis g a b a b c
d g, c8[ b8] a4 b a g2
g4 a c8[ b] a4 b1


}



rightTwo = \relative c' {
  \global
b4 a b g~g1 

c2. e4 fis4 g4 fis2

d2 e2 d2. b4 c1 b4 d2.
d1 b4 a g2
e'1 d4 c b2 b1~b1~b1~b1
b2. g4 b a g2

c2. e4 fis4 g4 fis2

b,4 c4 d2 d1 d1 g4 fis d2
es1 d1
}

leftOne = \relative c {
  \global
d2. c4 b c d2  
e2. g4 d'1
fis,2 g4 e4 a4 b fis g
g2 a4 fis g a b2
a2 fis2 g2 d b'2 g b2 fis
g1 fis1 g1 g4 fis4 g2 
d2. e4  g2 d2
e2. g4 d'1
g,4 a b c g4 fis g a b2
a2 d4 c4 b2 g1
g1

% Music follows her0e.
}



leftTwo = \relative c, {
  \global
g'4 d g c, g' e4 g2  c1 d1
d2 c2 d2. g,4 c2 a4 d d2 g,2

d1 g1 e2 e'2 b1 e1 dis1 e1 b2 e2
g,2. c4 g1 c1 d1
d1 d1
g2 fis2 g4 d4 
g8 g, a b 
c1 g1
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