\header {
  title = "109 Bach-form"
}
\version "2.18.2"

#(set-global-staff-size 22)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff

es, f g g g as bes2 g1
\bar ":|."
bes4 bes c bes as g f g
bes as g2 f1

bes4 bes c bes as g f g as g f2 es1
}



rightTwo = \relative c' {
  \global
bes8 c f,16 g as bes16~bes2
c16 d es c f es d c d2
r16 es d es c d es f
es8 d c bes
es16 f d es d8 bes es4
f16 es es d es d d c bes4
f'16 es es d bes16 c d es
d4 c4 es4 bes~bes16
d c d es g, as c bes4 d

es16 d es f g8 es8 as16 bes as f g16 f es d
es2 c16 d es c
d16 es f d
es2 d16 es c d bes c d bes~bes16
c as bes as bes c as bes2


}

leftOne = \relative c {
  \global
g'16 f as g  d4 g16 es16 f g  
d es f g es8 g f4
r16 as16 g as f g es f g2 r16
g f g es f d es

g8 es as16 g as f
g f g es bes'8 d,8 as'4
g16 f f es bes'4
es,4 g16 as f g es f d es
bes'16 as g f es f g es
 d4 es8 f
 as16 g f es d es f as
 
 g8 bes es16 des c  bes16 es4 bes 
 c16 as bes c bes g as bes
 as4 bes 
 c16 bes c as
 bes g as bes as2 g16 as f g f4 g2

% Music follows her0e.
}



leftTwo = \relative c, {
  \global
es'8 c bes as es f g des c c'
as f bes c d bes es, f g d
es2
es8 g bes d c as d bes
c d es es, d f es c
g' bes f as es f g es
bes' as g f d d' bes d

es8 d  es g as f es g
f as, c es f as, g 

bes as c es es, bes' c d bes
es8 es, f4 es2
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