\header {
  title = "210 intro"
}
\version "2.18.2"

#(set-global-staff-size 28.5)

global = {
  \key fis \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
fis4 gis a e fis e d cis cis dis eis fis b a gis2 fis1 \bar ":|."
cis'4 bis cis fis, b a gis2
cis4 bis cis fis, b a gis2
gis4 gis gis a gis fis eis2 fis1
  % Music follows here.
}

rightTwo = \relative c' {
  \global

% Music follows here.
  
}

leftOne = \relative c {
  \global

a'4 cis a b cis b a gis a fis cis'2 d4 cis 2 b4 a1 

eis4 fis gis  a b cis2 b4 a gis fis d eis fis eis2
b'4 cis a2 d2 cis a1


  % Music follows here.
}

 
leftTwo = \relative c, {
  \global
fis4 eis fis gis a gis fis eis fis b cis a b fis cis eis fis4 gis a fis
cis4 dis eis fis dis fis cis eis fis gis a b cis1
gis4 eis fis2 b cis fis1
}
 
decoratedrightOne = \relative c' {
  \global
    \autoBeamOff
fis8[ eis16 fis16] gis8[ fis16 gis16]  a4
e fis e8[ fis16 e16] d4 cis cis8[ fis16 e16] dis4 eis fis b16[ gis a b]
a8[ b16 a16] gis2 fis1 \bar ":|."

cis'4 dis8[ bis8] cis16[ b a gis] fis4 b16[ a gis a]
a8[ b16 a16] gis2
cis8[ d16 cis16] bis4 cis16[ b a gis]
fis4 b a16[ fis eis fis] gis2
gis16[ a b a]
gis8[ cis8] gis4 a4 gis4 fis eis2 fis1
  % Music follows here.
}


decoratedleftOne = \relative c {
  \global

a'4 cis a8[ d16 cis16]  b4
cis8.[ d16] b4 a8[ b16 a16] gis8[ a16 b16] a4 fis8[ b16 a]
gis8 cis8 a fis d4 cis4~cis16 cis' b a gis8 b 
a16 fis' e d cis8[ e] fis[ gis,] b16[ a gis fis] 

eis4 fis4 eis4  fis~fis a4 cis8[ d16 cis] b8[ gis] a4~a16[ gis fis8]~
fis4 d eis8[ fis16 gis] fis8[ gis16 fis] eis8 fis gis a
b4 cis a16 b a gis cis8 a8 d16 e fis gis a8[ b] gis4^"gis" cis8^"cis" b ais1


  % Music follows here.
}

 
decoratedleftTwo = \relative c, {
  \global
fis4 eis fis gis a gis fis eis fis b cis d b fis cis eis fis4 a b gis
cis4 gis2 a4 dis fis cis4 eis fis d4 a b cis1
gis4 eis fis2 b cis fis1
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
        \transpose f f {\rightOne  \bar "|.|" \break \decoratedrightOne } 
      }
      
     
      \new Voice = "rightTwo" {
        \override Stem  #'direction = #DOWN
        \transpose f f {\rightTwo \rightTwo}
      }
     
    >>

    
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { 
      \override Staff.TimeSignature.stencil = ##f
      \clef bass << \transpose f f {\leftOne  \decoratedleftOne } 
                    \\ \transpose f f {\leftTwo \decoratedleftTwo } >> }
    
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