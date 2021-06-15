\header {
  title = "86 color"
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
a'8[ f e f] bes[ f e f] c'[ f, e f] c4 c4
d f f e f1
a8[ g a f] a4 c bes4. a8 g2
a8[ g a f] a8[ bes] c4 bes4. a8 g2\prall

a8[ f e f] bes[ f e f] c'[ f, e f] d4 c4
d8[ e] f4 f e\prall f1

  % Music follows here.
}

rightTwo = \relative c' {
  \global

% Music follows here.
  
}

leftOne = \relative c {
  \global
a'2 bes c1 f,4 d4 g2 a1

a4 a a a bes4 c2.
a4 a a a f2 e2

a2 bes c2 f,4 e f2 a4 bes a1
  % Music follows here.
}

 
leftTwo = \relative c, {
  \global
f'2 g a1 bes,2 c f1

f4 f f f g4 f4 e8[ d e c]
f4 f f f bes,2 c2

f2 g a2 bes,4 c bes2 c2 f1
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