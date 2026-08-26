#import "template.typ": template
#import "@rookery/core:0.1.0": idea, tagged-idea, window

#set document(title: [Ideas])
#show: template.with(current-page: "ideas")

#let book = tagged-idea("book")
#let essay = tagged-idea("essay")

#book(
  <handelmanMathematicalImaginationOrigins2019>,
  title: [The Mathematical Imagination: On the Origins and Promise of Critical Theory],
)[

  - Author: @idea:handelman-matthew[Matthew Handelman].
  - Published: 2019.

  Introduces @idea:negative-mathematics[negative mathematics] as a riposte to dismissing mathematics as aligned with an uncritical, capitalist notion of progress.
]

#idea(<negative-mathematics>, title: [Negative Mathematics])[
  Coined in the introduction to  @idea:handelmanMathematicalImaginationOrigins2019[his book], 'negative mathematics' is Handelman's bid to name an approach to critical theory, mathematics, computer science, and the digital humanities which takes mathematics seriously as a part of an emancipatory project.

  Humanists ought not to treat mathematics solely as a discipline and syntax of thought inrecupreably allied with capital, a viewpoint that Handelman argues has washed over the humanities since the 1930 debate between @idea:horkheimer-max[Horkheimer]/@idea:adorno-theodor[Adorno] (the Frankfurt School / critical theory) and @idea:neurath-otto[Neurath]/@idea:carnap-rudolf[Carnap] (the Vienna Circle / logical positivism),
]

#essay(<horkheimerDialecticEnlightenment2002>, title: [Dialectic of Enlightenment])[
  - Author: @idea:horkheimer-max[Max Horkheimer] and @idea:adorno-theodor[Theodor Adorno]
  - Published: 1947.
]
