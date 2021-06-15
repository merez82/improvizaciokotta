\header {
  title = "95outtro"
}
\version "2.18.2"

#(set-global-staff-size 36)

global = {
  \key a \major
  \time 3/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
cis4 d cis  e b d
cis a b b2.
cis4 cis cis b2 b4
a2.^~a2.
% Music follows here.
}



rightTwo = \relative c' {
  \global
e4 fis e_~ e2._~e2 dis4 e2.
e2. e2. cis4 d b <cis e>2.
  % Music follows here.
  
}

leftOne = \relative c {
  \global
a'2. b2 gis4 a2 b4 gis2.
a2. gis2. a4 fis gis a2.
  % Music follows here.
}



leftTwo = \relative c, {
  \global
a'4 a a gis2 b4 a2 fis4 e2.
a4 a cis e2. a,2.~a2.
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