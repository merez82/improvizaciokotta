\version "2.18.2"

global = {
  \key c \major
  \time 4/4
}

#(set-global-staff-size 32)

rightOne = \relative c'' {
  \global
  % Music follows here.
d,8 cis16 d e8 d16 e16 f8 e16 f16 f4\mordent
e8. f32 g32 e4\prall d2

f4 f16 g a f bes a g f f4
g16 a bes g g4 f16 g a f16 f4\mordent
e1
a8. gis32 a32 b8. a32 b32 c8. b32 c32
c4 b8. c32 d32 b4\trill a2

a8. gis32 a32 b16 c16 d16 b16 c4 c4\mordent
b8 c16 d16 c8 b8 a8 b16 c16 b8 a8 g1

g4 g4\mordent c4 c\mordent
b4. c16 d16 a2
g4 a16 g a b c8 g8 f4
e4. d16 c16 d2\mordent

c8 b16 c16 d8 c16 d16
e8 d16 e16 f8 e16 f16
g8 f16 g16 a bes a g f4~f4\trill e1
}

rightTwo = \relative c'' {
  \global
  % Music follows here.
a,2. bes4~bes4 a8 g8~g8 f16 e16 f4
a4 bes2 c4~c4 bes a2~a1 a4 gis4 a2 b4 e8 d8
~d8 c16 b16 c4 d2 e4 c4 f4 e8 d8~d2~d4 c8 a8 b2
c2. d4~d1
d4 e16 d e f e4 d4 c b~b8 a g f
g4 b4 c2 bes4 a2.~a1
}

leftOne = \relative c' {
  \global
  % Music follows here.
f,4 e4 d2 e4 cis4 d2
d2. f4 e4 d4 cis4 d4~
d16 e f g f8 e16 d16 cis2

c4 b e4 f4 gis2 a2 f2 g4 a4
g2 fis4 d4 g1
e2. fis4 g8 fis8 e4 fis8 a8 g16 fis16 g a
b4 c16 b c d c4 a4 g2~g8 f e d
e4 f4 g4 a4 e2 f8 e d f cis1

}

leftTwo = \relative c {
  \global
  % Music follows here.
d4 cis4 d8 c8 bes8 a8 g4 a4 d,2
d'8 c8 bes a g4 a4 c4 g4 a4 d,4 a'1
a4 e4 a8 g8 f4 e2 a2
d2 c4 f,4 g4 c4 d,4 fis4 g1
c2 a4 d,4 g2 d2
g1~g1
c2. f4 e4 cis4 d8 e f d a1
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
