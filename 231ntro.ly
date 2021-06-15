\header {
  title = "231 intro"
}
\version "2.18.2"

#(set-global-staff-size 34)

global = {
  \key bes \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
f16 d es f g es f g a f g a bes4
r8 d8 d8 c8  bes8 a4.
bes16 c bes a g16 a16 g f f8 g16 f16 es4
r8 d'8 d8 c4 bes4.

  % Music follows here.
}

rightTwo = \relative c' {
  \global
s1 s8 f8 g es8 d8 c4.
s1 s8 f4. es8 d4.
% Music follows here.
  
}

leftOne = \relative c {
  \global
s1 r8 bes'4 g8 f8 f4.
s1 r8 bes8 bes8 a4 bes4.


% Music follows here.
}

 
leftTwo = \relative c, {
  \global
s1 r8 bes'8 g c d f,4.
s1 r8 bes8 f4. bes4.



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