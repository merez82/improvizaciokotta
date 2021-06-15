\header {
  title = "226 trio"
}
\version "2.18.2"

#(set-global-staff-size 38)

global = {
  \key c \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
g8[ f] g[ a] g4 f4 e8[ f d e] d4\prall
c4 c4 c4 a'8[ g f e] d4 d8[ e8] d2\trill

g4 g4 d'4 c4 b8[ c16 b] a4 a\prall g4
gis8[ a b gis] a8[ c f, e] e4\prall d8[ b] c2
  % Music follows here.
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  
}

leftOne = \relative c {
  \global
e4 d e c' g2 f4 e4 g2
c2 f,8[ g] a4 b8[ c a b]
e,8[ f d e] g4 e'4 d4 c2.
b8[ c d e] e4 a,4 c8 b a g8 e2
  % Music follows here.
}



leftTwo = \relative c, {
  \global
c'4 b c a c g2 c4
c8[ d e c] f,8[ g] a8[ g] d'4 d,4 g2
c2 b4 c4 g'4 a4 f4 e8[ d8]
e2 c4 f4 g4 g,4 c2
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