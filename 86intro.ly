\header {
  title = "86 intro"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key f \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
a'2 bes c2. c,4 d f f e f1
a4 a a c bes4. a8 g2
a4 a a c bes4. a8 g2
a2 bes c2. c4 d f f e f1~f1

  % Music follows here.
}

rightTwo = \relative c' {
  \global
r8 c8 f c d e f bes,
f'4 c a e4 f8 g a bes
c a g bes a4 c bes g
f'8 e f c f4 c d4. f8 e2
c8 d e f c4 e
f8 e f bes, c d e c
f e f c d e f g r8 a f a c,2
d'8 c bes c d c  bes g
a bes c a g a bes g a1
% Music follows here.
  
}

leftOne = \relative c {
  \global


  % Music follows here.
}

 
leftTwo = \relative c, {
  \global
r4 f4 bes d r8 f, a f a bes c c,
bes'4 d a c~c8 bes a g a g f e
f4 a f8 f' e c bes c d bes r8 c e c
f4 a f c bes d e c
f a d, bes f2 r8 f' a f
d4 bes8 a g4 c f8 g a4 bes8 a8 g4 f1
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