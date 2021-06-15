\header {
  title = "123-tenor"
}
\version "2.18.2"

#(set-global-staff-size 33)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
c2 d8 e d b c4 a4 b8 c8 d4
d8 e f4 e4 d4~d4 b4 c2
c2 b4 a8 g8 a8 b c a b2
c4 b8 a8 gis4  b a1
e2 g2 e4 f8 g8 a4 f4
d4 e8[ f] g4 d'4
c4 d4 c2
g2 c4 e4 d8 c b a b2
d,8 e f g a4 b4 c4 d8 b8 c2 
}

rightTwo = \relative c' {
  \global

}

leftOne = \relative c {
  \global
c'2 g2 a4 a g2
a4 a b b c1
c2 g2 a4 a g2
a4 g8 f8 e4 d c1
g'2 e2 g4 g4 f2
f2 d2 g4 f4 e2
c'2 g2 a4 a4 g2
a4 g8 f8 e4 d4 c1
}

leftTwo = \relative c, {
  \global

}
 
emptyrightTwo = \relative c, {
  \global

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