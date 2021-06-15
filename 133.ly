\header {
  title = "133 B"
}
\version "2.18.2"

#(set-global-staff-size 33)

global = {
  \key g \major
  \time 3/4
}

rightOne = \relative c'' {
  \global
fis,4 fis g fis2 e4 g4 g a b2 b4
a2 a4 g2 g4 fis2 r4
\break
fis4 g a b2 b4 a4 a g fis2 e4
b'2 a4 g fis2 e2.
\break
fis4 g a b2 b4 a4 a g fis2 e4
b'2 a4 g fis2 e2.
}

rightTwo = \relative c' {
  \global
  d2._~d2 cis4 d2._~d2.
  d2 cis4 d2 e4 d2 s4
  d2._~d2._~d2._~d2 cis4
  d2._~d2. cis2.
  
  dis4 e2_~e2._~e2. dis2 b4 dis2. e4 dis2 b2.
}

leftOne = \relative c {
  \global
a'2 g4 a2 g4~g2 fis4 g2.
fis4 a4 g4~g2. d'2 s4
a4 b c g2 g4 a2 b4 a2 g4~g2 fis4
g4 a2~a2.

b2 a4 g2. c2 b4~b4 a4 g4 fis2.b2 a4 g2.
}

leftTwo = \relative c, {
  \global
d'2 b4 a2. b2 d4 g,2. d'4 fis,4 a4 b4 g4 cis4
d2 r4 d2. g,2. fis2 g4 d'2 a4 b2 d4~d2. a2.

b4 e4 c4 e2. a,8 b c d e4 b2 e4 b2. e4 b2 e2.
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