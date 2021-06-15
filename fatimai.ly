\header {
  title = "Ave Maria Fatima"
}
\version "2.18.2"

#(set-global-staff-size 35)

global = {
  \key f \major
  \time 3/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
\partial 4 c,4
f f a
c c a c c a
g g a bes bes g
a a f g g c, f f c
\bar ".|:"
a'2 g4 f2 f4 g a bes g2 c,4 c'2 bes4 a2 f4
g c, a'8[ g] f2 c4 
\bar ":|." f2 s4
  % Music follows here.
}



rightTwo = \relative c' {
  \global
\partial 4 c4 c2.~c2. c c2 c4 d2 c4 c2
 a4 c2 g4 c2 c4 
 
 c2. d2.~d4 f2 e2 g,4
 a'2 e4 f2 a,4 bes2 c4 a2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
\partial 4 c4 a'2 f4 f2. g2 f4 e2 f4~f2
e4 f2 f4 e2 e4 a2.

f2 g4 a2 bes4~bes4 c d c2 e,4
f2 c'4 a2 d,4~d4 e2 c2

  % Music follows here.
}



leftTwo = \relative c, {
  \global
\partial 4 c'4 f,2. a2 f4 e2 f4 c'2 f,4
bes2 c4 f,2  d'4 c2 c4 f,2 c'4

f,4 f'e4 d c bes g f bes c4 c, c'
f,4 a c,4 d4 d' d, g4 c c, f2


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