\header {
  title = "134 intro"
}
\version "2.18.2"

#(set-global-staff-size 20)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
bes'2 bes bes as g as bes1
as2 g f1 es
bes'2 bes bes as g as bes1
as2 g f1 es
f1 d2 es f1 d2 es f2 g as g f1
f1 d2 es f1 d2 es as2 g f1 es1
  % Music follows here.
}

rightTwo = \relative c' {
  \global
r8 f8 g es g f g bes,
d es f d es d es c r8 bes c d es4 c
d8 es d bes f'4 d r8 d es c bes c d es
f8 es d c bes c bes as g4 bes as c
r8 d es c f4 bes, r8 d es c es d es c
r4 es c es d8 es f g as g f es r4 c4 es8 d es bes
r8 d es c bes c bes as r4 g4 bes8 as bes g
r4 as4 c8 bes c as r4 f4 g bes
r8 a bes c a4 es' d8 c bes as g as bes g
f'8 es d c bes c d bes as' g f es bes4 es
bes8 as bes f d' es d bes r4 c as es'
r8 f, g as g4 bes  r8 as bes c bes4 d
r4 f, g bes r4 c4 es bes
f'8 es d c bes4 as r8 g as f g2

% Music follows here.
  
}

leftOne = \relative c {
  \global



% Music follows here.
}

 
leftTwo = \relative c, {
  \global
r4 es'4 g es r bes c f,
r4 g f8 g as f r4 bes d8 c d bes
r4 f4 g es r4 bes' d bes
es,8 f g as f g as f
r4 es4 d8 es f d
r4 es4 f as r8 f g es as g as f
r4 bes d es r8 f8 f, as es'4 es,
r4 bes' d bes r8 c8 es c g'4 c,
r8 f,8 as f c'4 f,4 bes8 c d bes es d es g,
r4 f4 a8 g a f r4 bes c c,
r4 d' es es, r4 f'4 g8 f g es r4 bes d bes
r8 f as f c' bes c as r4 bes es, g
r4 c f, bes r8 c d bes  es d es es,
r8 d' es c g' f g g, r4 bes d bes es,1


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