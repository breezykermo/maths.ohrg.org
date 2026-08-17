#import "template.typ": template
#import "@rheo/rookery:0.3.0": idea, window

#let doc-title = "Math(s), Philosophy, History"
#set document(title: doc-title, date: datetime(year: 2026, month: 8, day: 17))
#show: template.with(current-page: "index")

// The homepage is a cover, not an entry: it has no session of its own to
// syndicate, and an Atom reader that received it would get the index of every
// session already in its list.
#let rheo-feed-exclude = true

#title()

// The prelude is an idea like everything else on the site, rather than loose
// prose under the title — so it has an id, a permalink and backlinks, and can be
// windowed anywhere the group needs introducing.
//
// TITLELESS, deliberately: `#title()` above already carries the site's name, and
// a heading over these three paragraphs would either repeat it or invent a label
// for the one thing on the page that needs none. rookery supports the case —
// with no title the box opens on its `[idea:prelude]` permalink, which is what
// `.idea-label:first-child` in style.css is written for.
#idea(<prelude>)[
  #emph(doc-title) is an online reading group run by the #link("https://freecomputinglab.ohrg.org")[Free Computing Lab].
  We read texts at the interface of mathematics, philosophy, and history.
  See @idea:focus[our focus] for more info.

  We meet on an approximately bi-weekly basis during the academic semester.
  This summer (2026) we are meeting on *Mondays* at *12pm-1.15pm EST*.

  To join our mailing list, please email #link("mailto:maths@ohrg.org?subject=JOIN")[maths\@ohrg.org] with the subject header 'JOIN', and a 1-2 sentence explanation of your interest in the group.

  // Subscribe to our #link("https://calendar.proton.me/api/calendar/v1/url/U1OSzBiOq3bjKvwRiTQ3kI6Z2cWlLYI5YYrOPeIE8pS4QUgX1kSBWOw-v5u1MuFD_kx3FvOu-n4r8YnhrPlzWA==/calendar.ics?CacheKey=BFrX9JrD_1q0xjzlJdo6Vw%3D%3D&PassphraseKey=CukTREmh1ezElZSJscWzB009huxZ55eUWh3rcrxs0po%3D")[public calendar] for upcoming meetings.
]

// Windows, not the ideas themselves: both are hatched on `about.typ`, which is
// where the topbar points and where their content lives. A window is an echo,
// so the homepage can carry the whole of what the group is without holding a
// second copy of the prose that would then have to be kept in step.
//
// Named rather than selected by tag, and in this order: two entries do not need
// a tag to find them, and "what we are looking for" reads before "how long we
// have been looking".
#window((<focus>, <history>), folded: true)

= Sessions

// Every session in the rookery, newest first — selected by TAG rather than
// named, so a new session is a new file under `content/` and nothing here has
// to be edited to list it. `folded: true` renders each as a closed
// `<details>`: one row per session carrying its title and its `[idea:...]`
// permalink, opening in place to show the date and the reading. `sort: "date"`
// orders by the session's own date, which each session file sets as its
// document date.
#window(tags: "session", folded: true, sort: "date")
