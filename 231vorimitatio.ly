\header {
  title = "231 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 34)

global = {
  \key bes \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
s1*8    
f4 g a bes d c bes a
bes g f g8[ es] d4 c bes2
c4 bes c d f8 g es4 g4 a
bes d es8 d c4 bes4 a bes2

  % Music follows here.
}

rightTwo = \relative c' {
  \global
s1*4
c4 d e f a g f e
f d c d8[ bes] a4 g f2
s1*4
a4 g a4 f4 bes4 c d es d2 a'2
f1
% Music follows here.
  
}

leftOne = \relative c {
  \global
f4 g a bes d c bes a
bes g f g8[ es] d4 c bes8 c d e
f2  c'4 d c bes a8 bes g a
f2 e4 d f e d c
d4 es4 f4 d4 bes' es,4 f c' g4 bes4 a4 bes4~
bes4 a4 d,2
f4 d f4 d f4 g2 f4 f4 g c2
d4 es4 d2


% Music follows here.
}

 
leftTwo = \relative c, {
  \global
s1*8
bes'2 f4 bes4 g4 c d f
es2 f4 es4 f4 f,4 bes2

f4 g a bes d c bes a
bes g f g8[ es] d'4 c bes2

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