\header {
  title = "221 intro 8ths"
}
\version "2.18.2"

#(set-global-staff-size 30)

global = {
  \key g \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
b'2 b g d e fis g d a' a g fis e cis d1
e2 e fis fis g e g fis fis g fis b b ais b1
b2 b g d e fis g d d d e a g fis g1~g1
  % Music follows here.
}

rightTwo = \relative c' {
  \global
b'8 a g fis g4 d e8 d e c fis,4 a
c8 b c g a b c d b c d b fis4 a
r4 cis  g'8 fis g e b cis d b a4 d
g,8 a b g e fis g a fis g a fis d4 fis
g8 a b g c4 g a8 b c a d4 a r4 b c g
d'8 c d b a4 d b8 c d b e4 b ais8 b cis e
d4 fis e g fis8 cis d e  
d e fis e d cis d b
r4 d4 g8 fis g d r4 c fis,8 g a fis
c'8 b c g d' c b a b d c d g, a b g
r4 a fis a g8 a b g a b c e
d c d b a4 c b8 c d b a b c a b1

% Music follows here.
  
}

leftOne = \relative c {
  \global
r4 g4 b8 c d g, r4 c4 d8 e fis d
r4 c d d, r4 g d'8 e fis d a8 b cis a cis4 a
r4 e fis8 g a d, r4 e a
e r4 d fis8 g a d, r4 e c8 d e c r4 fis
d8 e fis d g a b c e d e c r4 g d' d,
r4 b' e8 fis g e  r4 fis4 d8 cis d b
e d e e, fis4 cis' r4 b d b
r8 g8 b g b4 g c8 d e c d4 d, c e
d d' r4 g, b g d8 e fis g a g a d,
r4 c c' a r4 d, d'8 e fis d
r4 b c a g1
  % Music follows here.
}

 
leftTwo = \relative c, {
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