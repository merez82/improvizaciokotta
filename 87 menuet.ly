\header {
  title = "87 menuet"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key a \minor
  \time 3/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
d,2.^"d" a'2^"d" d4^"d" c2^"C6'" b4^"G"
a2^"a" g4^"e'" a2.~a2.^"a"
c4^"F" b^"G" a^"a" g2.^"e" a4^"F" g^"C64" f^"F6"
e2.^"C" f4^"F" g^"e" e^"A" d2.^"d"
\bar ":|."
g2 a4
bes8[ a bes g] c4 d2 c4 d4. c8 bes4
a2.
d4 bes g a2. bes8[ a bes g] 
d4 es4 d g
a4 bes c bes4. a8 fis4 g2.
%d4 es d c es g a2 fis4 g2.

%bes c d2 c4 bes2 a4 g2.

}

rightTwo = \relative c' {
  \global
}

leftOne = \relative c {
  \global
% Music follows her0e.
}
leftTwo = \relative c, {
  \global
d'4 c d d e f e f g a c, e4
a, b c b c a f g a e f g f g a c d c
f e a, d d, d'

g,4  g' fis4 g4 d c g8[ a8] bes4 c bes c g
d'8 c d c bes a g8[ a] bes4 c d d, fis
g a bes c b c fis, g c d c d g,2.
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