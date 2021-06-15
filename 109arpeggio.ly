\header {
  title = "109 arpeggio"
}
\version "2.18.2"

#(set-global-staff-size 30)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
\partial 2 es,2
es4 f g g g as bes2 g2. r4

}



rightTwo = \relative c' {
  \global
g4 bes r8 bes8 r8 d8 es4 es8 c8
r16 bes c d r16 c d es
f8 d bes as 
r16 d es c bes8 g g4
}

leftOne = \relative c {
  \global

r16 es16 bes c g'4
r16 g16 es f r16 as g f g4
r16 c g as g8 bes, es c
r16 d16 es f g f es d
r4 r16 es d c  bes4
% Music follows her0e.
}



leftTwo = \relative c, {
  \global
s4 r16 es es' f, es8 g8 bes4
es,16 es' es, d' c8 es
es,2 r4 bes'4 es,2.
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