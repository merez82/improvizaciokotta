\header {
  title = "229 vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 33)

global = {
  \key c \minor
  \time 4/4
}

rightOne = \relative c'' {
  \global
  s1*14
es,4 d es f g2 g2
es4 f g bes as2 g2
g2 es4 f d c es d c2. s4

c2 g'4 a4 b4 c d b
es2 d4  bes4
c2 bes4 g  
es4 f g as
f4 es c b c1^~c1
s1*18
g'4 bes4 c2 bes4 c4 bes4 as4 g2. r4
g4 bes4 c2 bes4 c4 bes4 as4 g2. r4
g2 es4 f4 d4 c4 es4 d4 c1

es4 d es2 g4 as bes c bes1 
g4 f es2 g4 as bes f g1
es4 d4 c2 f4 es g b c4
as g2 g1


  % Music follows here.
}

rightTwo = \relative c' {
  \global
s1*7
bes4 a bes c d2 d2
bes4 c d f es2 d2
d2 bes4 c a g bes a g2. r4

g2. f4 es' d es c4
c2 bes4  g c2 b8 c8 d4
es2 c4 d4 b4 g2 f4 es2. r4

g2 c2 d2 g2 g2 g4 d4 f8 g as f
d2 bes2 c2 as4 c4 g4 f4 g4
f es d es1
s1*9
d'4 f4 g2 f4 g4 f4 es4 d2. r4
d4 f4 g2 f4 g4 f4 es4 d2. r4
d2 bes4 c4 a4 g bes4 a g1
bes4 g'4 es2 g4 as4 g d es2. s4
d2 fis2 g4 fis g fis bes,2. s4
es4 d4 g,4 as4 g es g b es,4 f g as

c4 bes4 g2 bes4 es4 d4 f4 d4 es d c
bes2 g2 bes4 as4 d4 c4 b4 c d b
c4 b4 g4 as4~as4 c2 d4 es4 f b,2 c1
  % Music follows here.
  
}

leftOne = \relative c {
  \global
es4 d es f g2 g2
es4 f g bes as2 g2
g2 es4 f d c es d c2. r4

g4 fis g es d fis g a
g2 bes2 c4 a fis g8 a8 d,4 fis g4 fis4
fis4 g2 d4 es4 es' d4 b4

c4 b c d c2 es2
as,2 es4 es'4 f4 d g2
c,4 b c as4 g es2 g4 c2. r4

c1 g'2 b2 c2 bes4 g4 f4 d4
g4 bes4 g2 c,2 f4 g c,4 d es4
d c b c1

g'4 bes4 c2 bes4 c4 bes4 as4 g2. r4
g4 bes4 c2 bes4 c4 bes4 as4 g2. r4
g2 es4 f4 d4 c4 es4 d4 c1

bes4 a g8 a8 bes c d4 es f c bes2. r4
bes'4 a g4 f8 es8 d4 es a, c bes2. r4
g4 g'4. f8 es4 f4 es2 c4 g4 bes c d

es2 as2 es2. f4 es2. r4
bes2 d2 g,2 d'2 es2. r4
c4 b4 c f4 b,4 c2 g4 c4 d es f

g2 es2 d4 es4 g4 f4 g1
d2 es2 d4 es4 f2 d1
c4 d4 es4 c4 d g2 f4
as4 d, g f e1
  % Music follows here.
}



leftTwo = \relative c, {
  \global
  s1*21
es4 d es f g2 g2
es4 f g bes as2 g2
g2 es4 f d c es d c1 ~c1
s1*27
g'4 bes4 c2 bes4 c4 bes4 as4 g1
g4 bes4 c2 bes4 c4 bes4 as4 g1
g2 es4 f4 d4 c4 es4 d4 c1~c1
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