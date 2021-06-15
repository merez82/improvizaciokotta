\header {
  title = "116 ritornello start with e4"
}
\version "2.18.2"
#(set-global-staff-size 30)
global = {
  \key e \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    %\autoBeamOff
b'16 a16 g4. r4
e4 a16 g16 fis4. r4
b4 e16 fis16 g4. r4
e4 c16 b16 a4. r4
fis4 b16 a16 g4. r4
fis4 g16 fis16 e4. r4
b'4 e16 d16 e4. r4
g,4 c16 b16 c4. r4
fis,4 e16 fis16 g4. r4
b4 a16 g16 a4. r4
b,4 e16 dis16 e4. r4
b'8 a8 gis1


    
  % Music follows here.
  
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
e4 e e8[ fis] g4
fis4 e dis2
e4 fis g8[ a] b4 a g fis2
g4 e4 dis2 e2. r4
g4 a b b c b a2
b4 a g g a g fis2
g4 e dis2 e1

  % Music follows here.

}

leftTwo = \relative c, {
  \global
e4 g e2 dis4 e b'2
e,4 dis e g c,4 e dis2 e2 b' e2. r4
b c g e a4 g fis d g fis e2
fis4 e dis b' e,2 b'2 e,1
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
        \transpose f f {\rightOne}
      }
      
     
      \new Voice = "rightTwo" {
        \override Stem  #'direction = #DOWN
        \transpose f f {\rightTwo}
      }
     
    >>

    
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { 
      \override Staff.TimeSignature.stencil = ##f
      \clef bass << \transpose f f {\leftOne} \\ \transpose f f {\leftTwo} >> }
    
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