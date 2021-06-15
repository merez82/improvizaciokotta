\header {
  title = "85 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 30)

global = {
  \key a \minor
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1*8
a4 a g a c d a2
a4 g a f e f d2

a'4 g8[ f] e4 c
d f e8[ d] c4
e4 f8[ g] f8[ e] d4 e1
a8[ bes c a] bes4 g
f g f8[ e] d4
cis4 d8[ e] d4 cis d1
s1*8
%2.
g4 g d c f g a2 a4 g a f e f d2

g4 f4 e d a'4 g8[ f] g2
f4 a g8[ f] e4 cis4 d e d
e f g e a4 g f g e f8[ g8] a[ g fis g] fis1

}



rightTwo = \relative c' {
  \global
s1*4
e4 e d e g a e2
e4 d e c b c a2

c2 b4 a4 d2 c2
c2 . a4 c2 b2
c2 a2 b c8 b a4
g2 bes2 c1 f2 d2 c2 a2
a1 a1

s1*4
d4  d a g c d e2
e4 d e c b c a2
c2 bes4 a~a g c2~c2. a4
c2 b2
b2 c4 b c1 a2 g4 bes a1 
cis2 d4 bes4 a2 d2
bes2 a2 d1


}

leftOne = \relative c {
  \global
a'4 a  g a c d a2
a4 g a f e f d2

e8 fis g4 fis g e2 c8 d c b
a4 b c8 d e4 g4 e4 f2

a2 e4 f4 f2 a2
f4 e d2 c2 g'2
e2 c4 e4 f d c8 d e4
e2 f2 e1 c2 d2 f1 g2
f8 e d e f1
%2.
g4 g d c f g a2 a4 g a f e f d2
b8 c d e f4 e f8 e d4 c2
a4 b c a g2 f
e2 g4 a d4 e f2
f4 e f8 e d4 c2 g'2
d2 g2 f2 e2 c2 e2
e4 f g f g a bes g f1
g1 a1

% Music follows her0e.
}



leftTwo = \relative c, {
  \global
s1*12
a'2 a g a c d a1
a2 g a f e f d1

%2.
s1*12
g2 g d c f g a1 a2 g a f e a d1

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