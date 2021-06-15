\header {
  title = "109 color"
}
\version "2.18.2"

#(set-global-staff-size 30)

global = {
  \key es \major
  \time 4/4
}

rightOne = \relative c'' {
  \global
    \autoBeamOff
es,8[ d16 es] f8[ es16 f16] g4 g
g8[ f16 g] as8[ g16 as] bes4. as8 g2. r4
es16[ c d es] f[ d es f] g4 g\prall
g16[ es f g] as4 bes16[ es d c ] bes8 as8\prall g2. r4

bes8[ g16 as16] bes4 c bes as8[ bes16 as] g8[ as16 g16]
f8[ es16 f16] g4
bes4 as4 g16[ as16 g16 f] es4 f2. r4

bes8 c as bes c4 bes as16[ d, es f] g[ es d es] f4 g4
as4 g8[ as16 g16] f16[ es' d c bes as g f ]
es1\trill

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