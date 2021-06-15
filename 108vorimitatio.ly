\header {
  title = "108 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key f \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1*8
c,4 f8[ a8] g4 f g4 g8[ bes] a4 g
a4 bes c bes a g f2
a4 g f2


}



rightTwo = \relative c' {
  \global
s1*4 g4 c8 e8 d4 c
d4 d8 f e4 d4 e f g f e d c2
a2 c4 a e'2 f4 c4~c4 d f d c2 d2
c1


}

leftOne = \relative c {
  \global
c4 f8 a8 g4 f g4 g8 bes a4 g
a bes c bes a g f2 e2 g4 e4
g2. b4 c2. a4 c4 b  e,2 f2 c2
c1 f1 f4 g4 bes2 f4 bes a2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
f4 a bes a g8 f e4 f4 c'4
f, g a8 f g e f4 e f8 g a b 
c2 b4 c4 b2 c4 g4 c8 bes8 a4
e4 f4 g2 c,8 bes' a g
f2 e4 f4 c2 f4 e4 f2 a4 bes
f4 e bes'2 c2 f,2

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