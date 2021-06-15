\header {
  title = "CZ816 Bach-form"
}
\version "2.18.2"

#(set-global-staff-size 28)

global = {
  \key d \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
fis,4 a d cis b b a s4
b a g fis e e d s4
e4 e4 a a b b a s4
d a g fis e e d2

}



rightTwo = \relative c' {
  \global
d4 e fis16 g a fis e d cis e d16 cis e d 
e16 d e b cis4 r4

d8 e cis16 d cis a d2 cis2 a4 r4
cis16 a b d cis8 a~a4 d16 cis d e
d4 e2 r4
fis16 g a g fis e fis e d16 cis d cis d4 
b16 cis d b cis d cis a a2



}

leftOne = \relative c {
  \global
a'16 g b a cis d cis a~a4~a4 g4 gis8 e~e4 r4
g16 fis g fis e4 b'16 cis d g, a16 g fis g 
a16 fis g b a b a g fis4 s4 e4 
a16 e fis g
fis16 g a fis a8 fis g16 a fis g
gis16 a b d cis4 s4
d2 b16 a b g a b a d g,8 fis8 g4 fis2

% Music follows her0e.
}



leftTwo = \relative c, {
  \global
d'8 b a cis d d, a' cis
g b e, gis a4 r4
g8 e a cis g b d d,
a' b cis a d4 r4
a8 gis a cis d d, fis d
g8 b e, gis a4 r4
d8 b d fis g8 g,
d fis g gis a cis
d2

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