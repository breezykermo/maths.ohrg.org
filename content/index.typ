#import "template.typ": template
#import "@rheo/rookery:0.2.0": idea, window

#let doc-title = "Math(s), Philosophy, History"
#set document(title: doc-title, date: datetime(year: 2026, month: 8, day: 17))
#show: template.with(current-page: "index")

// The homepage is a cover, not an entry: it has no session of its own to
// syndicate, and an Atom reader that received it would get the index of every
// session already in its list.
#let rheo-feed-exclude = true

#title()

#emph(doc-title) is an online reading group run by the #link("https://freecomputinglab.ohrg.org")[Free Computing Lab].
We read texts at the interface of mathematics, philosophy, and history.
See @idea:focus[our focus] for more info.

We meet on an approximately bi-weekly basis during the academic semester.
This summer (2026) we are meeting on *Mondays* at *12pm-1.15pm EST*.

To join our mailing list, please email #link("mailto:maths@ohrg.org?subject=JOIN")[maths\@ohrg.org] with the subject header 'JOIN', and a 1-2 sentence explanation of your interest in the group.

// Subscribe to our #link("https://calendar.proton.me/api/calendar/v1/url/U1OSzBiOq3bjKvwRiTQ3kI6Z2cWlLYI5YYrOPeIE8pS4QUgX1kSBWOw-v5u1MuFD_kx3FvOu-n4r8YnhrPlzWA==/calendar.ics?CacheKey=BFrX9JrD_1q0xjzlJdo6Vw%3D%3D&PassphraseKey=CukTREmh1ezElZSJscWzB009huxZ55eUWh3rcrxs0po%3D")[public calendar] for upcoming meetings.

= Sessions

// Every session in the rookery, newest first — selected by TAG rather than
// named, so a new session is a new file under `content/` and nothing here has
// to be edited to list it. `folded: true` renders each as a closed
// `<details>`: one row per session carrying its title and its `[idea:...]`
// permalink, opening in place to show the reading. `sort: "date"` orders by the
// session's own date, which each session file sets as its document date.
#window(tags: "session", folded: true, sort: "date")

// `history` and `focus` are ordinary ideas, NOT `#session`s — they are the
// site's standing prose, not meetings, and the tag is what keeps them out of
// both the list above and the search corpus (see `session-search-index` in
// template.typ). Hatching them as ideas rather than leaving them as bare
// headings is what gives their citations somewhere to resolve: rookery emits a
// References block per idea, and a citation written outside any idea has no
// bibliography to be claimed by.
#idea(<history>, title: [Our history in brief])[
  - _June 2024._ First meeting.
  - _November 2024._ First on-site paper presentation and feedback session with our group's core members in Conneticut.
]

#idea(<focus>, title: [Our focus])[
  As computer science has grown in stature as a discipline in the university, as Moore's law is pushing computing into all the corners of our life and thought, there is no better time to ask why a more robust rapport between mathematics and critical theory has not emerged.
  Is it as simple as the fact that, as Sarah Pourciau seems to suggest, humanistic thought is aligned with the _apeiron_, whereas the sciences by definition rely on 'carving' it up into _peras_ @pourciauDigitalOcean2022?
  Or is there an interdisciplinary space where one can test the waters of a common language?
  We are not imagining an transdisciplinary metalanguage which is so general that noone understands anything at all, but rather a space where thought can actually happen.
  Can mathematics serve as the ferryman to an epistemological place where disciplinary distinctions become water under the bridge?

  More specifically, our readings are designed to help us wrap our heads around the history of _modern_ mathematics.
  We take modern mathematics to mean the kind that influenced the amorphous era we currently call modernity, an era which bears a relation to capitalism, but is not (we don't think) reducible to it.
  (In this characterization we follow the work of @mehrtensModerneSpracheMathematik1990 @siegertPassageDigitalen2003 @grayPlatosGhostModernist2008 @horlSacredChannelsArchaic2018 @steingartAxiomaticsMathematicalThought2023.)
  Modernity has been understood as the attempt to be sure of ourselves without any external guarantee, such as God or a feudal order, and as such is broadly related to secular humanism @rudaIndifferenceRepetitionModern2023.
  Our group is interested in charting and hypothesizing whether the insights of modern mathematics have anything to do with this modernity, whether set theory represents anything significant in the history of philosophy.

  This brand of secular humanism is significant and resonant in contemporary discussions about 'ethical computer science', or computing for the social good---as these debates (typically) do not hinge upon explicitly religious notions of morality or social determination, but rather point themselves towards an ambiguously modern notion of freedom and the construction of a society that optimizes for this notion.
]
