\header {
  title = "Toccata d"
}
\version "2.18.2"
#(set-global-staff-size 25)
global = {
  \key d \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
r16 bes'16 a16 g f g f e d
f e d cis d e cis d d'
cis d a d cis d f, d' cis d 
a g f g e a g a e e d e
a, cis b cis d e f g

f d' cis d e f g a g e f cis d8 <f, a d>

<g bes d>4
r16 d'16 c16 d16 g8 d c\prall bes
<e, g c>4 r16 bes' a bes e8 bes a\prall g <c, f a>4
r16 a'16 g a d8 a g\prall f16 e16
<d f bes>2 <e g bes> <cis e a> <d f a>

a'16 e d e cis d e f cis' a g a cis d e cis d1


    
  % Music follows here.
  
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
s2 s16 a'16 g f e f g e d16
f16 e f d f e f a f e d f e d e cis4~cis16
g' f g cis, e d e f e d cis
d f e f g a e' f e cis d e f8 f,8
g,32 a bes c d e f g
g2 a8\prall g8
c,32 d e f g a bes c~c2 f,8\prall e
f,32 g a bes c d e f~f2 e8\prall d16 c
bes16 bes' a bes g bes f bes g bes a bes e, f g e
a, a' g a f a e a d, e f g a g a a,
cis16 e f g e f g a e a bes a   e f g8 fis1

  % Music follows here.

}

leftTwo = \relative c, {
  \global
d1~d1 a' d, s1*4 s1 a'1 d,1
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