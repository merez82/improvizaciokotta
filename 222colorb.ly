\version "2.18.2"

global = {
  \key f \major
  \time 4/4
}

#(set-global-staff-size 32)

rightOne = \relative c'' {
  \global
  % Music follows here.
  a4 d,16 e f g a4 e16 f g a 
g16 a16 bes16 a g4\trill f4 e4

a16 bes c a bes c d bes c8 d16 e16 f8 a,8
bes4 ~bes4\trill a2
a4 bes\mordent c16 d c bes a4
g16 a bes a g8 f16 e16 d4 d16 cis d e f4. g8 e2\trill
d1

c16 d e f g8 d8 d4 e32 d32 c32 d32~d8
f8. g16 d4 c4 d16 c16 d e
f4. e16 f16 g4. f16 g16
a16 f' e d c d c bes a bes a g  f g f e
f4 g8 f16 g16 a4\mordent g4
f4 e8. f32 g32 d4\trill c4
f8. g32 a32 bes4 e,8. f32 g32 a16 g16 f16 e16 d1
}

rightTwo = \relative c'' {
  \global
  % Music follows here.
  d,2 cis c1 c4 d c4  a8 c8
  d2 cis2 d2 a4 c4~c4 bes4
  a2 bes2 a4 g4~g4 f8 e8 f2 
  a4 g4 f2 d2 e2
  a2 c2~
  c16 d c bes a bes a g f g f e d e d c
  d4 e f e f g2 e4 f4 d4 g4 f8 g8 fis1
}

leftOne = \relative c' {
  \global
  % Music follows here.
  f,2 e~e f4 g4 a4 f e f~f
  g e2 f1 e4 d4 f2 d2 cis2
  d1 e4 d4 a2 
  bes4 a8 bes8 g2
  c1 f2 a,2 bes4 bes4 c2
  ~c2 b4 c4 a4 d4 cis2 d1
  
  
}

leftTwo = \relative c {
  \global
  % Music follows here.
  d2 a2 c2 a4 c4 f,1
  bes4 g a2 d4 bes4
  f'4 f,4 c'4 g4 d'2
  bes8 a8 g4 a2 d,1
  a'4 bes4 d,4 d'4
  bes8 g8 fis g c,2 f8 g a f e8 f g e
  f1 bes4 g4 f c'
  a c g c, f g a2 d1
}

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
  \layout { }
  \midi {
    \tempo 4=100
  }
}
