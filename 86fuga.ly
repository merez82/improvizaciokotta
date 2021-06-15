\header {
  title = "86fuga"
}
\version "2.18.2"

#(set-global-staff-size 33)

global = {
  \key f \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
a2 bes2 c2. c,4 d4 f f e f1 \bar ".."
a2 bes2 c2. c,4 d4 f f e f1

r4 c'8 b8 a4 d4 r4 b8 a8 g4 e'4 f4 e4 d2 
e8 f e d e2 

c4 f4 g8 f e d e4 g c,8 d8 e4
d8 e f d bes4 c4 c8 d c bes c2

c4 g' f8 e d c b4 d8 c8
d4 g4 f4 g4 g d' c8 d c b c2



}

rightTwo = \relative c' {
  \global
s1*8
e2 f2 g2. g,4 a c c b c1

r4 f8 e8 d4 g4
r4 e8 d8 c4 a'4 bes4 a g2
a8 bes a g a2

g2 a2 g4. a8 b4  c4_~c2 d2 g1
}

leftOne = \relative c {
  \global
r4 f8 e8 d4 g4
r4 e8 d8 c4 a'4 bes4 a g2
a8 bes a g a2
s1*8
a2 bes2 c2. c,4 d4 f f e f1
r4 c'8 b8 a4 d4 r4 b8 a8 g4 e'4 f4 e4 d2 
e8 f e d e2 
}

leftTwo = \relative c, {
  \global
s1*16
e'2 f2 g2. g,4 a c c b c1
}
 


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