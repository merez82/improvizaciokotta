\header {
  title = "220 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 24)

global = {
  \key bes \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1 s1 s1 s1 f,4 f g f bes a8[ g] g4 f
s1*4 c'4 bes a bes8[ g] f4 e4 f2
s1*4
a4 a bes f es d f8[ d] c4
s1*4
f4 f g a bes c bes a
s1*4
a4 a bes g8[ es] d4 c bes2
  % Music follows here.
}



rightTwo = \relative c' {
  \global
s1 s1 c4 c d c f e8[ d] d4 c a2
bes4 a d2 es4 d
s1 s1 g4 f e f8[ d] c4 b4 c2 d2 c2 a4 c2.
s1 s1
e4 e f c bes a c8[ a] g4
c2 d2 c4 bes2 g4 s1*2
c4 c d e f g f e
a,2 bes4 c4 d f d c
s1*2
e4 e f d8[ bes] a4 g f2~f4
f'2 bes,4~bes a f2
  % Music follows here.
  
}

leftOne = \relative c {
  \global
f4 f g f bes a8[ g] g4 f
es2 g4 a4~a g8[ f]~f4 e f2
d4 f~f2 g4 bes
c4 bes a bes8[ g] f4 e4 f2
e4 f g f4~f2 e4 f~f2. e4 f4 g a2
a4 a bes f es d f8[ d] c4 g'2 f
d4 c f e f1~f2. e4
f4 f g a bes c bes a
e2 bes'2 a4 bes a g d2. f4~f1
a4 a  bes g8[ es] d4 c bes2
c4 g' a f~f e es d c2 d4 es4 f4 es d2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
bes'1 g'4 f8[ es] es4 d
c2 bes4 f~f g2 c4 f,4 a g a bes2
es4 bes
f2 c'2 d4 c f,4 a
c d c d g,2 c4 a bes2 c2~c f,2~f bes2
c4 bes2 e,4 c4 c' a2
bes4 f2 c'4
f,1~f2 bes4 c
f,2 es4 f g2 es4 f c2 g' f2. c4
d2 g4 f bes a bes f
d4 f g es bes' a g4 f c2 f4 bes
f c' f,2~f bes4 es,8[ g] f2 bes2



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