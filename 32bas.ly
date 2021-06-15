\header {
  title = "41"
}
\version "2.18.2"

#(set-global-staff-size 38)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
  %  \autoBeamOff
c2 g a8 g a b c2
g2 d2 e8 d e fis g2
a4 g8 fis g4  a8 b
c8 b c4 g8 a b d,
e4 c4 g'8 f8 e4 a b c2



  % Music follows here.
}

rightTwo = \relative c' {
  \global


  % Music follows here.
  
}

leftOne = \relative c {
  \global
  %solo

  % Music follows here.
}

leftTwo = \relative c, {
  \global
c4 e8 g c,4 e8 g f8 e d4 c2
g'4 b8 d8 g,4 b8 d8 c8 b8 a4 g2
c4 b8 a g4 f8 e g f e4 d2
c4 e8 g c,4 e8 g f8 e d4 c2
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