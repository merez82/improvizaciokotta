\header {
  title = "223 intro"
}
\version "2.18.2"

#(set-global-staff-size 32)

global = {
  \key d \minor
  \time 4/4
}

rightOne = \relative c' {
  \global
    \autoBeamOff
f2 a g f e4 f e d c2 d4 e
f2 g a4 g4 f2 bes4 bes bes a g1
a2 bes c f, a4 a g g f1
  % Music follows here.
}

rightTwo = \relative c' {
  \global

% Music follows here.
  
}

leftOne = \relative c {
  \global
a'8 bes c a f' e f c
e f g e f c d a c bes c a g8 f g f'
e f g e f d c bes bes a g a g c bes c
a g f g a d c d
f e d f g f f a
bes^"be" c^"c" bes a a bes a g
f e f c d f e f 
a^"a" g a f f e f a^"a" c, d e f e f g bes^"be" a1


  % Music follows here.
}

 
leftTwo = \relative c, {
  \global
f1 c'2 d a c4 b c1
f,2 e d1 bes'2 g4 a c1
f,1~f2 d'2 c1 f1
}
 
decoratedrightOne = \relative c' {
  \global
    \autoBeamOff

  % Music follows here.
}


decoratedleftOne = \relative c {
  \global



  % Music follows here.
}

 
decoratedleftTwo = \relative c, {
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