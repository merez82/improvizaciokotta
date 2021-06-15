\header {
  title = "41"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
  %  \autoBeamOff
g4 f es bes' as8 bes c d es2
f4 es d c bes4. c16 bes as4 c4
bes4 es, f4 es8 d8 es1

es4 d es bes d es f g
as bes c as bes2 c4 d4
es4 bes c d
es es, f g as f es d es1

  % Music follows here.
}

rightTwo = \relative c' {
  \global
bes4 as4 bes2 c4 as'2 g4
c2 bes4 as es2 c2 es4 bes4
as2 bes1

bes4 as4 bes f4 as4 bes4 as2
c4 es2 c4 es2 as4 f4 g es2 f4
es4 bes4 as4 bes4 c2 bes4 as4~
as4 f g2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
es1~es2 bes'2 f1
es2 f8 g as f es8 f g es~es4 f4 as4 g8 f8 g2

es4 f4 es d4 f4 es4 c2
f4 es2.~es1
bes'4 g as2 bes4 es,2. f4
es2 f4  bes,1
  % Music follows here.
}

leftTwo = \relative c, {
  \global
es2 g2 f g
as4 as as as g2 f2
g4 g f f es1

g4 f g bes as g f2
f4 g as as g2 f2
es4 es as as g1
f4 as g f es1
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