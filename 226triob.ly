\header {
  title = "226 b"
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
c,8 c' b a g e' d16 c b a
g8 a16 g f8 b c d e4
%seq
e16 f g e a8 a, b c
d16 e f d g8 g, a b
c16 d e c f8 f, g a b a
g2~g1

e8 e' d c f a, b c
d e f c b2 \trill

  % Music follows here.
}

rightTwo = \relative c' {
  \global
s1*2

  % Music follows here.
  
}

leftOne = \relative c {
  \global
  %solo
g'4 g g f e d d c4
%back
g'4 a2 b4~b2 a2 b4 d4 e2
d2 e2

c,4 c a' f d d8 e d2
  % Music follows here.
}

leftTwo = \relative c, {
  \global
c4 d e f c d g c,
c' f2 b,4 e2 a,4 d4
g2 c,8 d e f g g, b d c2
c,2 f4 d4  g1
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