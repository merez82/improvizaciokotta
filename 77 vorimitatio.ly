\header {
  title = "77 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 34)

global = {
  \key d \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1*8
a2 b4 a g2 b a g fis1
a2 a4 g fis2 e d1
s1*8
e2 e a1 g2 fis e1 e2 a g fis e1
s1*8
a2 b4 a g2 b a g fis1
a2 a4 g fis2 e d1
}



rightTwo = \relative c' {
  \global
s1*4
e4 fis8 e d4 fis e d cis2
e4 e8 d cis4 b a1

a2 g2 g2. b4 d2 b2 a1
a2. b4 a2. g4 fis1
%2.
s1*4
b4 b e2 d4 cis b2 
b4 e d cis b1
b4 cis b2 cis1 b2 a2
a1 b2 a2 b a a1
%3.
s1*4
e'4 fis8 e d4 fis e d cis2
e4 e8 d cis4 b a1
d2. cis4 d1 cis1
d1 e2. d4 d2 b4 cis4 d1
}

leftOne = \relative c {
  \global
a'4 b8 a g4 b a g fis2
a4 a8 g fis4 e d1
a'2 b4 d, a' fis e2 b'2
a4 gis  cis, d e cis

fis4 d2 cis4 d b e2 fis2 g4 d d1
cis4 e fis d d2 cis4 a a1
%2.
 e'4 e4 a2 g4 fis e2
 e4 a g fis e1 e2 cis4 cis'
 b4 a gis2 gis2 b4 a gis1
 gis2. e4 e1
 d2 cis2 a2. cis4 e2 fis2 e fis4 d
 cis1
 
 %3.
 a'4 b8 a g4 b a g fis2
 a4 a8 g fis4 e d1
 cis'4 d8 cis b4 d, g4 fis e2
 e4 b' a gis fis1
 fis2. a4 b g b g a1 a2. b4
 cis2 a4 b fis2 g2 fis1
 
 
}



leftTwo = \relative c, {
  \global

d'4 g, b8 a g4 fis e d d'
cis2 d4 cis4 d e fis d
cis d b2 cis4 d a2 gis2
a4 e4 a1
d4 fis,4 g4 a b d e g  fis4 d4
g g, d' cis e d a cis d g, d' b a cis
d1
%2.
cis2 d4 fis e d cis a gis a
b d cis d e a, gis2  a e1
e2 b' e4 b cis d
e4 d e gis, a b cis a
b g a b cis d cis a
g a fis g e fis d fis a b cis a
%3.
d4 b cis2 d4 e d4 a4 g2 a2
d,4 e fis d
a'2 b cis4 d a2 gis4 e2 f4 fis4
gis a fis

d' cis d a g b fis d'
a b cis e d cis d b a b cis
d a b g a d,1
}
 

 
%ketto = \lyricmode {
%\repeat "unfold" 12 { \skip 8 } 
%\set stanza = #"23.7. "
%\once \override LyricText.self-alignment-X = #LEFT "Áldalak téged, Atyám, mennynek és föld" -- nek Is -- te -- ne,,
%\once \override LyricText.self-alignment-X = #LEFT "mert feltártad a kicsinyeknek" or -- szá -- god tit -- ka -- it.
%}

\score {
  <<
    \new PianoStaff \with {
      instrumentName = "Organ"
    } <<
      \new Staff = "right" \with {
        midiInstrument = "church organ"
      } \rightOne
      
      \new Staff = "left" \with {
        midiInstrument = "church organ"
      } { \clef bass << \transpose f f {\rightTwo   } 
                    \\ \transpose f f {\leftOne  } >> }
    >>
    \new Staff = "pedal" \with {
      midiInstrument = "church organ"
    } { \clef bass \leftTwo }
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