\header {
  title = "171 intro"
}
\version "2.18.2"

#(set-global-staff-size 37)

global = {
  \key a \major
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
a'2 gis fis e a e d cis
e e fis b a gis a1
cis2 a a4 b cis2 b a gis4 a b2
a gis fis gis4 a gis2 fis e1

  % Music follows here.
}

rightTwo = \relative c' {
  \global
r8 d e cis e d e b r8 cis d b cis b cis a
e'4 cis a8 b cis a d cis b a e4 a
gis8 a b gis a b cis a fis' e d cis d e fis d
cis4 e b e cis8 d e cis a4 cis fis4 cis e8 d e cis
b8 cis d b e a gis a fis4 d cis8 d e cis b4 cis
e4 gis cis,8 d e cis  b4 e b dis e cis b e dis b gis1
% Music follows here.
  
}

leftOne = \relative c {
  \global


  % Music follows here.
}

 
leftTwo = \relative c, {
  \global
r4 a'4 e'4 b4 r4 d cis a
cis8 b cis a e'4 a, fis4 d' cis8 b cis a
e4 b' cis a fis cis' b4 d a8 b cis d e d e e,
a4 cis e8 d e a, fis8 gis a b cis4 a d b a cis
d8 cis b d a4 cis e8 b cis a gis a b e, cis'4 a b8 cis d e
dis e fis b, e dis e a, e' fis gis a b a b, dis e1
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