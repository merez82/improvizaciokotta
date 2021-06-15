\header {
  title = "134 andante"
}
\version "2.18.2"

#(set-global-staff-size 38)

global = {
  \key g \minor
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4 g a2 bes4 a g2 bes8[ a] g4 f es4 d1
a'4 a4 bes2 c4 bes8[ g8] a2 d4 a4 bes8[ a] g4 a1 \bar "|."

f4 e f g a g a bes c d c bes a2 g2
bes4 a g f e f g e a g f e8[ cis] d1 \bar "|."

g4 g a2 bes4 a g2 bes8[ a8]  g4 fis g4 a4 bes c d
es4 d8[ c] bes4 c bes a g2 g1 g1

}



rightTwo = \relative c' {
  \global
bes2 d2~d1 d2. c4 a1
d1 es4 d4 cis2 d1 cis1
a2. e'4 d e c g' f4 a4 f g f2 d2
d4 cis2 d4 cis d2 cis4 d2. a4 a1
d4 es fis2 g4 fis4 d2 d4 es4 d2
fis4 g a bes c bes8[ a] g4 fis
g4 fis d2 es1 es2 bes2
}

leftOne = \relative c {
  \global
d1 g4 fis g2 g2 d4 g4 fis1
fis2 g2 g2  e2 a2 g2 e1
f4 g4 f4 bes4 a bes a d c f4 c d d2 bes2
g2. a4 g a bes e, f g a4 g4 fis1

bes4 c a2 d2 bes2 bes2 a4 bes4 c2. bes4
g2 c4 a4 bes c bes4 a4 g4 g4 a2 g4 f8 es8 d2

% Music follows her0e.
}



leftTwo = \relative c, {
  \global
g'2 fis2 g4 d' bes2 g2 bes4 c4 d1
d2 g,2 g2  a2 f2 g8[ a] bes4 a1
d4 cis4 d e f e f g a bes a g d2 g2
g,4 a4 bes2 bes4 d g, a d bes d4 a4 d1
g2 d2 d2 g2 g2 d4 g,4 d2. g4  c2. d4 d2 g,2
c1 c2 g2
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