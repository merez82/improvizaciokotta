\header {
  title = "134 intro"
}
\version "2.18.2"

#(set-global-staff-size 24)

global = {
  \key bes \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
g'2 g a2 a2 bes2 a g1 a2 g2 f es d1

d2 c2 d e f1 g2 a4 bes a2 g f1
bes2 a4 g f2 g f es d1

  % Music follows here.
}

rightTwo = \relative c' {
  \global
r8 bes16 c d c bes8 r8 d bes d r8 d8 fis d
r8 fis16 g a cis, d8 r8 fis16 g a fis g8
r8 d fis d r8 bes16 c d c bes a bes8 g bes d
r8 c es c r8 d16 c bes c d8 r8 bes d f, r8 g c g
r8 a d, a' c8 bes16 a g a fis8
r8 g d g r8 a16 g f g a8 r8 d, a' f r8 c' e,16 f g8
r8 f a c es d c16 bes a8 r8 d16 c bes c d8
r8 f16 es d es d8 r8 f c f r8 es g, c
r8 a16 bes c d c bes a bes a g f8 a
r8 f' d f  r8 a, d bes
r8 a d a r8 d16 c bes c d8
r8 bes d bes r8 es,16 f g f es8
r8 fis16 g a bes a g fis2
% Music follows here.
  
}

leftOne = \relative c {
  \global
r8 g bes g r8 g16 a bes a g8
r8 fis16 g a g fis8 r8 d fis d
r8 g bes g r8 fis16 g a g fis8
r8 g a bes d16 c bes c d8 bes
r8 a16 bes c bes a8 r8 bes  d g,
r8 bes16 c d c bes8 r8 c,16 d es d c8
r8 fis16 g a g fis8 d a' fis d
r8 bes'16 a g a bes8 r8 f a f
r8 d16 e f e d8 r8 c16 d e d c8
r8 f16 g a g f8 a bes a16 g f8
r8 g bes g r8 a d bes
r8 c16 bes a g f8 r8 es16 f g f es8
r8 f a c d c a f r8 bes16 c d c bes8
r8 c16 a g a bes8 r8 d16 es f es d8
r8 g, bes g r8 bes16 c d c bes8
r8 c es c d1


% Music follows here.
}

 
leftTwo = \relative c, {
  \global

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