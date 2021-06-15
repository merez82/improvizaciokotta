\header {
  title = "232intro"
}
\version "2.18.2"

#(set-global-staff-size 36)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g4 g g g g a8[ g] f[ e] f4
e4 f g f e d c2
e4 d c2
e'4 d c2
  % Music follows here.
}



rightTwo = \relative c' {
  \global
s1 s1 s1 s1 c4 f, a2
g'4 f e2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
s1 g'4 g g g g a8[ g] f[ e] f4
e4 f g8[ f e d]
c4 d a8 b c d e4 g2.
  % Music follows here.
}



leftTwo = \relative c, {
  \global
s1 s1 g'1  g g2 a2 g2 c2
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