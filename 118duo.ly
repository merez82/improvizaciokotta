\header {
  title = "118 duo"
}
\version "2.18.2"

#(set-global-staff-size 30)

global = {
  \key e \minor
  \time 3/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
e,4 e e dis8[ e dis cis] b4 
fis'4 fis fis e8[ fis e dis] e4
e2 fis4 g2 b4 a2 g4\prall fis2.
\bar "|.|"
e4 e e dis8[ e fis g a g]
fis4 fis fis e8[ dis e fis g e]
e4. fis8 g4 b2.a2 g4 fis2.
\bar "|.|"
g4 a b a2. g4 a g fis2.
g4 fis e fis g a
b4. a8[ g fis] e2.
}



rightTwo = \relative c' {
  \global


}

leftOne = \relative c {
  \global


% Music follows her0e.
}



leftTwo = \relative c, {
  \global
e'4 g e b2. dis4 fis dis e2.
e4 g a b8 a g fis e4 fis8[ g] a4
e4 b2.

e8[ fis] g4 e b2. dis8[ e fis e] dis4 e2.
e4 b g g8[ a b c] d4 c d e d2. 
g,4 c d c4. b8 a4 b4 c8[ d] e4 d2.
e4 d c d8[ c] b4 a g8 a b4 dis e2.
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