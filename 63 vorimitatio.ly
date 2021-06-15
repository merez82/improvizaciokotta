\header {
  title = "63 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key b \minor
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1*6
d4 cis b fis' g e fis2
s1*6
fis4 cis d b a gis fis2
  % Music follows here.
s1*6
fis'4 eis fis gis a gis fis eis4
fis e d cis d1


s1*6
fis4 cis d b a gis fis2
}



rightTwo = \relative c' {
  \global
s1 s1 s1 s1 d4 cis b fis' g e fis2
fis2 g b ais
s1*4
b4 fis g e d cis b2
a'2 gis fis4 e ais,2
  % Music follows here.
s1*4
b'4 ais b cis d cis b ais4
b gis a cis cis2 a4 gis
a g fis e
fis e d cis 
s1*4
b'4 fis g e d cis b2
a'2 fis cis4 b ais2


}

leftOne = \relative c {
  \global
s1 s1 a'4 gis fis cis' d b cis2
fis,2 d2 b' ais b1 g2 fis

s1*2 fis'4 cis d b a gis fis2
d'2 b2 b4 a d,2 d2 b cis1
s1*2
fis'4 eis fis gis a gis fis eis4
d cis b ais b cis d fis
d cis2. cis2 a4 gis
a2 ais2 b1
s1*2
fis'4 cis d b a gis fis2
d'2 bes b4 a g2 fis1 fis2 cis2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
d'4 cis b fis' g e fis2
fis,2 a2 b fis
b4 ais b2 g2 fis b e
e fis,

b'4 fis g e d cis b2

a2 b2 cis4 b a2 fis2 e2 g1
d2 e cis fis'

b4 ais b cis d cis b ais4
b4 cis d b fis eis fis cis
b fis' d fis d e g fis
b, cis fis eis fis eis fis cis
fis1 b,1

b'4 fis g e d cis b2
fis2 g a ais b cis d e fis, b
fis1
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