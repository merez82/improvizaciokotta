\header {
  title = "59 intro"
}
\version "2.18.2"

#(set-global-staff-size 35)

global = {
  \key c \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    
r2 c''4 g8 as8 g4 f es d 
es2. d4 c b c g8 as g4 f4
es4 d es2. d4 c b c4 c8 d8
es4 es8 f g4 g8 as8 as4 as8 bes 
bes4 bes8 c
as4 as8 bes c4 bes4 c as d2^~d1^~d2
g,4 g8 as bes4 as bes g c1~c1
f,4 f8 g8 as4 b
  % Music follows here.
}

rightTwo = \relative c' {
  \global
s1 s1 c'4 g8 as8 g4 f es d es~es8 f
es4 d c b s1 s2 c2_~c1_~c2 d2
f1_~f1~f1_~f2 es2_~es1~es1~es1
d1
% Music follows here.
  
}

leftOne = \relative c' {
  \global
r1 r1 r1 r1 r1 c4 g8 as g4 f es d
es2 g2 es2 f2 d2 f4 c'2.~c2
bes4 f8 g f4 es d c d2 bes'2~bes1
as4  es8 f es4 d c bes c2



% Music follows here.
}

 
leftTwo = \relative c, {
  \global
c1~c1~c1~c1~c1~c1~c1~c1~c2 g'2
f1~f2 bes2~bes1~bes2 es,2~es1
as1~as1 d,1
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