#import "template.typ": template
#import "@rheo/rookery:0.4.0": idea, window

#let doc-title = "Math(s), Philosophy, History"
#set document(title: doc-title, date: datetime(year: 2026, month: 8, day: 17))
#show: template.with(current-page: "index")

#let rheo-feed-exclude = true

#title()

#idea(<prelude>)[
  #emph(doc-title) is an online reading group run by the #link("https://freecomputinglab.ohrg.org")[Free Computing Lab].
  We read texts at the interface of mathematics, philosophy, and history.
  See @idea:focus[our focus] for more info.

  We meet on an approximately bi-weekly basis during the academic semester.
  This summer (2026) we are meeting on *Mondays* at *12pm-1.15pm EST*.

  To join our mailing list, please email #link("mailto:maths@ohrg.org?subject=JOIN")[maths\@ohrg.org] with the subject header 'JOIN', and a 1-2 sentence explanation of your interest in the group.
]

#window((<focus>, <history>), folded: true)

= Sessions

#window(
  tags: "session",
  folded: true,
  sort: "date",
)
