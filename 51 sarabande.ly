\header {
  title = "51 sarabande"
}
\version "2.18.2"
#(set-global-staff-size 29)
global = {
  \key c \minor
  \time 3/2
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
c2^"c" g'2. as4 bes2^"Es" g1
f2^"f6" es2.^"as" d4^"G7" c2^"c" c1
c'2^"as" c2.^"f" c4 bes2^"g" d1
c2^"c64" bes2.^"g" a4^"D" g2^"g" g1
bes2^"g" g2.^"Es"  g4 g2^"c" g1^"Es"
f2^"f" es2.^"c64" d4^"g" c2^"as" c1
bes'2^"g" g2.  g4 g2^"Es" g1
f2^"f" es2.^"c64" d4^"G7" c2^"c | C" c1
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


}

leftTwo = \relative c, {
  \global
c'4 d c bes c as 
es' f g f g es
as, g as bes c g c bes c d es c
as g f f' g f g as bes as bes g
es f g a g d g, a bes c bes a
g g' es f g es c d es 
f g es f f, g as bes g as bes c bes c as
g as bes c bes g
es f g as bes es,
f as g c g b c2 c,1
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