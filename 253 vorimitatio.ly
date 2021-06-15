\header {
  title = "253"
}
\version "2.18.2"

#(set-global-staff-size 24)

global = {
  \key bes \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1 s1 f,4 g a bes d c bes a
bes1 ~bes1 s1 s1
bes4 g f g8[ es] d4 c bes2 s1 s1
f'4 es d c g' f es d c es f g
bes1 c1 bes f4 es d c
g' f es d c bes c d f es g2
f4 g a bes d c bes a bes2 a4 g
f4 es g4 a bes4 g f g8[ es] d4 c bes2
%coda
es4 d c2 f4 es d c d1
  % Music follows here.
}



rightTwo = \relative c' {
  \global
s1 s1
  % Music follows here.
  
}

leftOne = \relative c {
  \global
f4 g a bes d c bes a
bes es f8[ es] d4 f es d es d es4 f g
f g8[ es] d4 f
s1 bes,4 a bes as g4 bes a4 bes8 c
bes4 a d,4 es s1 es'4 d c bes
d g, bes8[ a] g4
bes  a bes8 g8 bes4 a g bes es
d2.  f4 es1 d4 c d es d4 c bes a
bes a g bes a g f2 bes4 c d c
d4  es c d f es d es d2 f4 bes,~bes2. c4 d2
a4 bes~bes a d,2 g4 f a2~a4 c bes a f1
  % Music follows here.
}



leftTwo = \relative c, {
  \global
s1 bes'4 c d es d c f, g f2 bes4 c bes c
d es d c bes4  d 
bes'4 g f4 g8[ es] d4 c bes2 es f2 bes,4 f' bes,2
f'4 es d c g' f es d
bes c d es
bes d c bes
f' es d c g' f es d
c es f bes8 a8 bes2 bes,2
d4 es f2
d2 es 4 f
f, g a bes d c bes a bes1 f2 f'2
bes4 g f g8 es d4 c bes2 g4 es f es
f2 g4 f4 es2 f4 es f1 bes
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