\header {
  title = "223 seq"
}
\version "2.18.2"

#(set-global-staff-size 30)

global = {
  \key d \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
f2 a g f e4 f e d c1 c2 d d c2

    
f2^"solo" a g f e4 f e d c2
f2^"seq" f2 e e d d e


f2^"solo"
g a2 f2 bes4 bes bes a g2
f2^"seq" f2 e e d d e



a2^"solo" bes c f, a4 a g g f1
  % Music follows here.
}

rightTwo = \relative c' {
  \global
a2 c2 c2 a2 a2. f4 g2 a2 a1 bes2 g2


a2 c2 c2 a2 a2. f4 g2 a2 bes  g a f g g

a2 c2 c2 a2 d2 e4 f4 c2
%seq
a2 bes  g a f g g



c2 d e a, c1 a1 

% Music follows here.
  
}

leftOne = \relative c {
  \global
 c2 f2 e2 f c2. d4 e1 f1 f2 e
  

c2 f2 f2 f c2. d4 e2 c2 d bes c a bes c

c2 e2 e2 f2 f2 c'4 f, e2
%seq
c2 d bes c a bes c



f1 g2 c,2 e1 c1
  % Music follows here.
}

 
leftTwo = \relative c, {
  \global
f1 c'2 d a2. bes4 c2 a2 f2 d bes' c
  

f,1 c'2 d a2. bes4 c2 f,2  bes e, a d, g c,

f2 c' a d bes2 c2 c2
f,2  bes e, a d, g c,



f2 d2 c2 f2 c1 f1
}
 

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