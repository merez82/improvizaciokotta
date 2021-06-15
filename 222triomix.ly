\header {
  title = "222 trio mix"
}
\version "2.18.2"

#(set-global-staff-size 28.5)

global = {
  \key f \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
a4 a4 a a g g f2 
a8[ f] bes[ f] c'[ f,] a[ f]
bes2\prall a
a4 bes c8[ bes] a4 g4 g d2 f4 g4  e2 d1
c4 d d8[ e f d] f4 d c2 f8[ g] a4 g2 a1
f4 g a g f8[ e8] e8[ d8] d4 c f2 e4 cis d1
  % Music follows here.
}

decoratedrightOne = \relative c'' {
  \global
    \autoBeamOff

  % Music follows here.
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
f8 g a f cis d e a
d, e f g a bes c a
c4 d a c d8 c d bes
c bes a c
c4  d8 bes a bes c4 
bes8 c d bes a g f4
d8 c d bes e d cis e f1
g8 c bes g bes4 d a8 g f4
e8 f g e d e f c' bes a g e 
f e f c a' g a f c' d c bes
a bes c g a4 bes2 a4  f8 g a f
g2 f1

  % Music follows here.
}

 quiveredleftOne = \relative c' {
}

leftTwo = \relative c, {
  \global
d'2 a2 bes2 f2 f1 bes2 f f'4 d c f g2 d2
g,2 a d1
e4 d g, bes f bes c2 f, c' f,1
f'4 e f c f2 f,d2 a' d1
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