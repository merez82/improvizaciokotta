\header {
  title = "O Maria"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key e \minor
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
b,4 g' fis e b' b fis g
fis4. e8 c4 b fis'4. g8 e2

b4 g' fis e b' b fis g
fis4. e8 c4 b fis'4. g8 e2

fis4. fis8 g4 e a8 a c4 b2
c4. b8 a4 g fis8 fis g4 fis2

b4 b e b d4. c8 b2
b4. c8 b4 a g4. fis8 e2
  % Music follows here.
}



rightTwo = \relative c' {
  \global
b1~b1_~b2 a4 g4 b1
b4 c2. b2. e4 c4 b4
a g dis'2 g,2 a2 d4 c4
a4 d2. e2 fis4 c d2 dis2
e1 b'4. a8 dis,2 e2. dis4 e4 dis4 b2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
g'1 fis2. e4  dis4 e2. b2 g'2
g2 a2 g2 fis4 b4 a4 e2. fis2 e2
fis2 g2 fis2 g g2 d'4 g, a4 b4 fis2
g1 g2 fis2  g4. a8 g4 fis b a4 g2

  % Music follows here.
}



leftTwo = \relative c, {
  \global
e'1 dis2. g,4 b4 g4 a e4
dis2 e2
e2 fis4 a4 e2 dis4 e
fis4 g4 a4 e4 b'2 c2
d2 b4 c4 d2 g, c2 d4 e
d4 g, b2 e1 g,2 b2 e,2. b'4~
b2 e,
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