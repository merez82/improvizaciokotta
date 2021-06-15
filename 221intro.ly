\header {
  title = "221 intro"
}
\version "2.18.2"

#(set-global-staff-size 35)

global = {
  \key g \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
s1*3 s2
r8 e,8 g a
b4 b g d e fis8 g g4 d4
d4 d e a g fis g2



}



rightTwo = \relative c' {
  \global
s1 s2. d8 e8
fis4 fis d a b4 cis8 d8 d2
d2 e4 a,4 c2 b2 a1 b4 c4 d2


}

leftOne = \relative c {
  \global
b'4 b g d e fis8 g g4 d8 cis
a'2 fis2 g2 g4 fis
g2. fis4  g4 e4 d4 g4 fis2 e4 fis4 g4 a4 b2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
g'4 a8 b8 c4 b c d b8 a b a
d1 g,2 b4 a4 g2 c4 d4 c2 g2 d'2 cis4 d4
d4 d,4 g2


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