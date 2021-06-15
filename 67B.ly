\header {
  title = "67 B"
}
\version "2.18.2"

#(set-global-staff-size 33)

global = {
  \key c \minor
  \time 3/4
}

rightOne = \relative c'' {
  \global

es,8 d8 c8 g'4. \time 2/4 bes8 bes as g \time 3/4 f[ as] g2 \break
es8 d8 c8 g'4. \time 2/4 bes8 bes as g \time 3/4 f[ as] g2  \break
c8 d c g4. \time 2/4 f8 es d f \time 3/4 bes[ as] g2  \break
c8 d c g4. \time 2/4 as8 g f8 es \time 3/4 d4 c2

  % Music follows here.
}

rightTwo = \relative c' {
  \global

  % Music follows here.
  c2. d2_~d2.
  c8 bes8 as8 bes4. d2 c4 b2
  es4. d4. c2 d4 es2
  es4. d4. c2 b4 g2
}

leftOne = \relative c {
  \global
g'8 f8 es2 g2 as8[ f8] g2
g4 as8 g4. f2~f4 d2
g2. as8 g f as g4 bes2
as4. d,4. f8 g as f g8[ f8] es2

  % Music follows here.
}

 quiveredleftOne = \relative c' {
}

leftTwo = \relative c, {
  \global
c'2. g4. bes8 d4 b2
c4 as8 es'4. bes2 as8[ f8] g2
c4. b4. c2 g4 es'2
c4. b4. c2 g4 c2
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