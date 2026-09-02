#import "nest/template.typ": template
#import "@rookery/core:0.1.0": idea, ideas, window
#import "@rheo/feeds:0.1.0": configure, feed, items

#let doc-title = "Math(s), Philosophy, History"
#set document(title: doc-title, date: datetime(year: 2026, month: 8, day: 17))
#show: template.with(current-page: "index")

// Sessions and nothing else: `items()` reads the beacons `#session` emits, which
// is `meetings.typ` alone — every listing vertebra transcludes those notes rather
// than declaring them, so none of them emits a beacon to pick up.
// `content: none` is required — a minted page cannot be transcluded.
#configure(feeds: (
  feed(
    title: "Math(s), Philosophy, History",
    base-url: "https://maths.ohrg.org",
    author: "Free Computing Lab",
    content: none,
    sources: (items(),),
  ),
))

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

// WHAT IS COMING, AND NOTHING BEHIND IT. The record of past sessions is the
// `sessions` page; this one is the front door, so it carries the prelude above
// and the next meeting here.
//
// Split on build-time "now" rather than a tag: a session leaves this list of its
// own accord once its date is behind us, with no per-session edit here.
#context {
  let today = datetime.today()
  let upcoming = ideas(tags: "session")
    .filter(e => e.created != none and e.created >= today)
    .sorted(key: e => e.created)

  if upcoming.len() > 0 [
    = Upcoming session

    #window(upcoming.map(e => e.name), folded: true, show-date: true)
  ]
}
