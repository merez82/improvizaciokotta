\header {
  title = "90 intro"
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
g4 c b c
g8[ a] g[ f] e[ d] c4
g'4 c b c
g8[ a] g[ f] e[ d] c4

g'4 a8[ g] d2 f4 g8[ f] e2
g4 a8[ g] d2 f4 g8[ f] e2
 c'4 g a g8[ f] e4 d c2
 c'4 g a g8[ f] e4 d c2


}



rightTwo = \relative c' {
  \global
s1*4 r2 r4 b4 c4
s2  c4 b4
s2 b4 c4
r4 b2
s1
c4 b4 a2
c4 d c b8[ a] c4 b g2

}

leftOne = \relative c {
  \global
s1 r4
e8[ d] c[ b] e4
s1 r4 e8[ d] c[ b] c4

r2 r4 f4 f4 s2 g4 g4
s2 g4 f4 r4 gis2
s1
a4 e4 c8[ d c d]
e4 g e f g2 e2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
s1 r4 c'4 g c
s1 r4 c g a
r2 r4 g4 a
s2 c4 g4
s2 g4 a4
r4 e'2
s1
a,4 gis4 a2
a4 b c d g4 g, c2
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