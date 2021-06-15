\header {
  title = "221 trio wannabe"
}
\version "2.18.2"

#(set-global-staff-size 28.5)

global = {
  \key g \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
b4 b g d e fis8[ g] g4 d
a' a g fis e d8[ cis] d2
e4 e  fis fis g fis8[ e] g4 fis 
fis g fis b b ais b2
b4 b g d e fis8[ g] g4 d
d d e a g fis g2
  % Music follows here.
}

decoratedrightOne = \relative c'' {
  \global
    \autoBeamOff

  % Music follows here.
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
d8 c d g e fis g d g e a b d c b g
e' fis e cis b cis d a cis g' fis e
d e fis d cis b a e'
d cis d a b a b e, d e fis a
d, e d b fis' g fis d
 b' cis d e d b cis d
 d c b d  b a g b
 a c a g d' c b d
 fis g fis d c e d c
 b g' fis c
 b2

  % Music follows here.
}

 quiveredleftOne = \relative c' {
}

leftTwo = \relative c, {
  \global
g'4 b c b  c d g,2 a4 cis4 e4 d a2 d
a4 c d2 e4 d8[ c] b4 d b2 d fis, b
g1 c4 d g,2 d'2 a2 d2 g,
}
 
emptyrightTwo = \relative c, {
  \global

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
      \clef bass <<{ \leftOne } 
                    \\ {\leftTwo  } >> }
    
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