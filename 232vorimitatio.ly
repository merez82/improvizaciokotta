\header {
  title = "232vorimitatio"
}
\version "2.18.2"

#(set-global-staff-size 24)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
s1*8
g4 g g g g a8[ g] f[ e] f4
e4 f g f e d c2 d8[ b c d] e4 f e
a a f g f e f g gis g8[ f e d]
c8[ f e f] d[ e f d]
b[ e d e] c[ d e c]
d[ e fis g] a4. c8 b4 a g2 
%2.line
s1*8
d4 g fis g a b c b a b c8[ b] a4 b a g2
a4 g a b c d e8[ fis g d] c4 b a8[ g] fis4 g a g2
  %3. line
  s1*8
  g4 g g g g a8[ g] f[ e] f4
e4 f g f e d c2
d4 e8[ f8] e4 f8[ g]
g4 f8[ e] d[ c] d4
g a b d c b c2
}



rightTwo = \relative c' {
  \global
s1*4
d4 d d d d e8[ d] c[ b] c4
b4 c d c b a g2
%g'8 f e d b c d b
e'4 d c  b c2. a4
c2 b c4 gis4 a8 g f e
f2 c'4 b c1~c~c4 b c2
a2 f2 g2 a a d g4 fis4 b,2
%2.line
s1*4
a4 d c d e f g f e f g8[ f] e4
f e d2
b2 a4 d c d2. fis4 g a8[ g] fis4
d2 b2 fis'4  b, c d4 c4 g'2. fis4
g4 c,8[ g] c4 b8 d a c b2
%3.line
s1*4
d4 d d d d e8[ d] c[ b] c4
b4 c d c b a g2
b8 c d b c d e f e4 f8 e d c a4 
c b~b8 c a b c4 f, e2
b'4 c2. b4 c4 b8[ g] f4 c'2 g'4
d g1
  % Music follows here.
  
}

leftOne = \relative c {
  \global
g'4 g g g g a8[ g] f[ e] f4
e4 f g f e d c2

g'4 g,8 a b4 a8[ g]
d'4 g4 a8 g a4 g4 e
fis8 g fis d g b, c d g,4 a8 b8
c4 bes a g8 f  e4 f a d
c a g  gis a4 b c8 e d c
b2 c4 d e f f a g4 a4 g a
c,8 d e f8 e2
%2.row
f2 b, e a,
d2. c4 d2 g,8 a b c
d4 g fis g a b c b a b c8[ b] a4 b a g2
f2 e8[ d c b]  c4 d e8[ c] d4 c4 a b c
d c g8 a b a
g2 d'4 b a g4 fis g d'1 d8[ c d d,] g8 a b c
d2. g4 e g2. a4 g e8[ d]~d4 g4 fis g2
%3.row
g4 g g g g a8[ g] f[ e] f4
e4 f g f e d c8 d e fis
g8 a b4 fis4 g8 a b4 c8 b a g fis4
g e fis8 g e fis g8 g, a fis g8 a b a
g4 g'8 f e4 d c f, a d g,2. d'4 g,8 a b g c2
g'1~g4 c,2. c4 f d a' c f, e2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
  s1*12
g'4 g g g g a8[ g] f[ e] f4
e4 f g f e d c2
%2.row
s1*16
d4 g fis g a b c b a b c8[ b] a4 b a g2

%3.row
s1*12
g4 g g g g a8[ g] f[ e] f4
e4 f g f e d c2
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