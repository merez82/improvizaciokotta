\header {
  title = "253"
}
\version "2.18.2"

#(set-global-staff-size 34)

global = {
  \key bes \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
f,4 g a bes d c bes a bes g f g8[ es] d4 c bes2
f'4 g a bes d c bes a bes g f g8[ es] d4 c bes2

f'4 es d c g' f es d f es d c g' f es d
f4 g a bes d c bes a bes g f g8[ es] d4 c bes2
  % Music follows here.
}



rightTwo = \relative c' {
  \global
d2 f4 d f4 es d c d2 c2 bes4 a f2
bes2 c4 d f1 d4 c2. bes4 a g2
a4  bes2 a4 bes1 a2 bes4 g bes4 d c bes
a2 c4 d d es2 c4 d es c2 bes4 a f2
  % Music follows here.
  
}

emptyrightTwo = {
  s1*16
}

leftOne = \relative c {
  \global
f1 d4 es f2 bes f4 es f2 d
d2 f d4 f d4 es d es f es f2 d
f4 g f2 d2 g4 f f2. es4 es f2.
f2 es4 d g2. a4 bes2 a4 g f es d2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
bes'2 f4 bes bes c d f,4 g2 a4 c d f, bes2
bes4 g f bes bes a bes f g c a c d f, g2
f4 es bes' f g4 bes2 bes4 f2 bes4 c bes2 a4 bes
f2. bes4 bes es2 f4 bes, es f es f,2 bes

}
 
quiveredleftTwo = \relative c, {
  \global
  f'8 d' c bes f' es d c d f es f
  bes, d c f  bes, d g, bes c d es c
  bes c a c d es d c d c bes a c bes d bes
  f' f, c' es d es f es d c es c c bes a c
  bes f a f bes g bes d
  c f, g es' d bes a c bes c d bes c es f d
  a bes c a bes c g es f es d f a g f bes
  a c bes d c es d bes f bes g es'
  d es c f  d c bes g' a bes es, g
  bes f es c d2
  
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
        \transpose f f {\rightOne \bar "|." \break \rightOne } 
      }
      
     
      \new Voice = "rightTwo" {
        \override Stem  #'direction = #DOWN
        \transpose f f {\rightTwo \emptyrightTwo}
      }
     
    >>

    
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { 
      \override Staff.TimeSignature.stencil = ##f
      \clef bass << \transpose f f {\leftOne  \quiveredleftTwo } 
                    \\ \transpose f f {\leftTwo \leftTwo } >> }
    
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