\header {
  title = "222 intro"
}
\version "2.18.2"

#(set-global-staff-size 35)

global = {
  \key f \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
a4 a4 a a g g f2 
a4 bes c a bes2 a2
a4 bes c a
d e f d
f4 g4 e2\trill f1
  % Music follows here.
}


rightTwo = \relative c' {
  \global
s1 c2 a2 c1 c1 
c1 f2 bes2_~bes1 a1
  % Music follows here.
  
}

leftOne = \relative c {
  \global
f4 g a f e8 f g e f2
f4 g a f e8 f g e
f2 
f4 g a f  bes2 d8 c d bes d2 c~c1


  % Music follows here.
}

leftTwo = \relative c, {
  \global
s1 s1 f1 c'2 f,2 
f1 d2 bes' g c f1
}
 
emptyrightTwo = \relative c, {
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