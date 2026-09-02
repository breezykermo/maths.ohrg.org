#import "@rookery/core:0.1.0": idea, rookery
#import "@rookery/search:0.1.0": search-modal
#import "@rookery/bibtex:0.1.0": bibtex
#import "@rheo/justify:0.1.1": template as justify-template
#import "@rheo/feeds:0.1.0": feeds-modal, item, mail-icon

// `page` is the minted `ideas/` page: every session shares the one
// `sessions.typ` vertebra, so that is the only per-session URL there is.
//
// `reading:` names the works read, and `authors:` the people who wrote them, by
// id (`<grayPlatosGhostModernist2008>`, `<sarah-pourciau>`) — declared as lists
// rather than written into the prose, so a session's record is data the note
// carries rather than a sentence someone remembered to type. Both are prepended
// as a header block rather than forwarded blind through `..args`, since they
// have to land BEFORE the given body. Each entry renders via `@id`'s own `ref`,
// so it takes that note's resolved title (the `show ref: hyperlink` rule
// `#show: rookery.with(...)` installs below) rather than a name typed twice.
//
// A READING ENTRY IS EITHER a bare id or `(id, pages)` — `(<grayPlatosGhost…>,
// "pp.18-38")` — the pages trailing the title as written. No ambiguity between
// the two forms, since one entry is always one work: an array is a work and its
// pages, never two works. The pages ride ALONGSIDE the ref rather than inside a
// Typst `cite` supplement (`@key[pp.18-38]`, which is what the prose used to
// carry) because a bare cite renders an anchor into a `#bibliography` this site
// never prints — a dead `#loc-1` link on every session that named page numbers.
//
// THE HEADER IS THE CITATION BLOCK'S TWIN. A citation note ends with
// `@rookery/bibtex`'s `bib-fields` — a muted label over a two-column table of
// the work's fields — and a session note opens with the same table of what was
// read, so the two take the SAME markup and therefore the same gutter,
// hairlines and label sizes for free: `.citation-fields-head` and
// `.citation-fields` are styled by bibtex.css, which every page links. As a
// `<p>` of body prose this read as a stray sentence rather than as the note's
// record. Only the spacing is the site's own — see `.session-fields` in
// style.css, since the package's gap is measured for a block that FOLLOWS prose.
//
// THE DATE IS A ROW HERE rather than the `== 3 August 2026` heading each body
// used to open with. It is the same kind of fact as the reading and the people,
// so it belongs in the same table, and a heading below that table would have
// stranded the session's date under its own metadata. It is formatted from
// `updated:`, which every session already carries, so no session states its
// date twice — and the two cannot now disagree.
#let session(tags: (), reading: (), authors: (), ..args) = {
  let name = args.pos().at(0)
  let body = args.pos().at(1)
  let named = args.named()
  let slug = str(name)
  let when = named.at("updated", default: none)
  // Mark session as an item for the Atom/RSS feed.
  item(
    id: "idea:" + slug,
    title: named.title,
    page: "ideas/" + slug + ".html",
    published: when,
    updated: when,
    categories: ("session",) + tags,
  )
  // `ref()` resolves against the REAL Typst label `#idea` attaches, which is
  // the full prefixed id (`<idea:sarah-pourciau>`), not the bare one a work or
  // an author is named by here (`<sarah-pourciau>`) — `_norm`'s bare/full
  // equivalence is rookery's own registry lookup, not Typst's native label
  // matching, so the prefix has to be rebuilt by hand.
  let as-ref = id => ref(label("idea:" + str(id)))
  let work = w => {
    if type(w) == array {
      as-ref(w.at(0))
      ", " + w.at(1)
    } else {
      as-ref(w)
    }
  }
  // `[day padding:none]` because the default pads to two digits, and no session
  // was ever written up as "09 August 2024".
  let rows = ()
  if when != none {
    rows.push(("Date", when.display("[day padding:none] [month repr:long] [year]")))
  }
  // ONE WORK PER LINE, not a comma list: a resolved citation title carries its
  // own commas ("Meli, Equivalence and Priority (1993)"), so two of them joined
  // by another comma read as one long work rather than two.
  if reading.len() > 0 {
    rows.push(("Reading", reading.map(work).join(html.elem("br"))))
  }
  if authors.len() > 0 {
    rows.push(("Authors", authors.map(as-ref).join(", ")))
  }
  let full-body = if rows.len() == 0 {
    body
  } else {
    html.elem("div", attrs: (class: "citation-fields-head session-fields-head"), "Session")
    html.elem(
      "dl",
      attrs: (class: "citation-fields session-fields"),
      rows
        .map(((term, value)) => {
          html.elem("dt", term)
          html.elem("dd", value)
        })
        .join(),
    )
    body
  }
  // `created:` is the ONE date rookery stores per note as of 0.1.0. The old
  // `minted:`/`updated:` pair went with the reset: a hand-maintained second
  // date can contradict the note's actual history, so lifecycle moved to
  // `@rookery/timeline`. A session has a single authored date anyway — when it
  // happens — so it lands in the one slot and `index.typ` splits on it.
  idea(
    name,
    title: named.title,
    tags: ("session",) + tags,
    created: when,
    full-body,
  )
}

#let THEME = (
  link-color: "rgba(88, 28, 135, 0.16)",
  fold-color: "rgba(88, 28, 135, 0.07)",
  border-color: rgb("#581c87"),
  date-color: rgb("#6f6284"),
)

#let BIBLIOGRAPHY = arguments(
  bytes(read("references.bib")),
  style: bytes(read("author-title.csl")),
)

// No `tagged-idea:` — this site is plain `@rookery/core` with no timeline or
// todo skin, so the factory's own default (core's `tagged-idea`) is already
// the right one.
//
// `show-fields` keys are BIBTEX FIELD NAMES, not the terms the block prints, and
// the two differ for exactly the field wanted here: the `Accessed` row is
// `urldate`. A key naming no field hides nothing and says nothing about it.
//
// Both rows are Zotero's bookkeeping rather than anything about the work.
// `file` also carries an absolute path out of whoever exported the library,
// which has no business on a published page.
#let BIBTEX = bibtex(
  read("references.bib"),
  show-fields: (
    "file": false,
    "urldate": false,
    "type": false,
  ),
)
#let citation = BIBTEX.citation
#let citations-as-ideas = BIBTEX.all
#let bib-fields = BIBTEX.fields

// THE BAR IS THE TOP LEVEL OF `content/`, less the wordmark. Nothing here
// names a page: the filter drops `index` (which the wordmark already carries)
// and everything under `content/nest/`, so where a vertebra sits on disk is
// the only thing that decides whether it appears, and adding a bar entry is a
// file move rather than an edit to this list.
//
// WHAT IS IN THE NEST, and why none of it belongs on the bar. THREE ARE
// REGISTERS: `bibliography` runs the sweep that mints a note per
// `references.bib` entry, `authors` declares one per person, and `meetings`
// declares one per session held. A note renders where it is declared, so a
// register cannot also be the page a reader browses — the three bar pages
// (`sessions`, `people`, `texts`) transclude these by tag instead, and each
// register stays reachable but unlisted. `ideas` is nested because its notes
// are reached through the search modal and through the backlinks on whatever
// cites them, not through a list of everything. `about` is nested because the
// index page already carries that prose — a reader landing on the site reads
// it there.
#let site-pages = (
  sys
    .inputs
    .at("rheo-context", default: (spine-flat: ()))
    .spine-flat
    .filter(v => v.handle != "index" and not v.handle.starts-with("nest:"))
)

// Every page link goes through `link(label(<handle>))`, never a written
// `href`: rheo rewrites that form depth-relatively, which it must, since minted
// idea pages sit a directory down under `ideas/` where `./index.html` would
// 404. Only Typst can compute those hrefs, so the class goes on a wrapper and
// the CSS hooks are `.wordmark a` / `.site-nav a`, not the anchors.
#let site-header(current-page) = html.elem("header", attrs: (class: "site-header"))[
  #html.elem("div", attrs: (class: "site-header-inner"))[
    #let wordmark-class = if current-page == "index" { "wordmark active" } else { "wordmark" }
    #html.elem("span", attrs: (class: wordmark-class), link(label("index"))[maths])
    #html.elem("nav", attrs: (class: "site-nav", aria-label: "Site sections"))[
      #html.elem(
        "ul",
        attrs: (:),
        site-pages
          .map(p => {
            let cls = if p.handle == current-page { "active" } else { "" }
            html.elem("li", attrs: (class: cls), link(label(p.handle), p.title))
          })
          .join(),
      )
    ]
    // `tags: "session"` would scope search to sessions, so it never answers
    // with the standing prose. Same tag as the homepage `#window`.
    #search-modal(
      // placeholder: "Search sessions",
      // trigger-label: "Search sessions",
      // tags: "session",
    )
    #feeds-modal(
      icon-size: 16,
      feed-desc: [Pull each new session into an #html.elem("a", attrs: (
          href: "https://aboutfeeds.com",
          target: "_blank",
          rel: "noopener",
        ))[RSS/Atom reader].],
      options: (
        (
          icon: mail-icon(),
          label: "Mailing list",
          href: "mailto:maths@ohrg.org?subject=JOIN",
          desc: [To join, email #html.elem("strong")[maths\@ohrg.org] with #html.elem("strong")[JOIN] in the subject line, and a 1--2 sentence explanation of your interest in the group.],
        ),
      ),
    )
  ]
]

// The header's mirror image: same flex row, same hairline (on top), same mono
// labels. Two slots, one at each end and nothing between them.
#let site-footer() = html.elem("footer", attrs: (class: "site-footer"))[
  #html.elem("div", attrs: (class: "site-footer-inner"))[
    #html.elem(
      "span",
      attrs: (class: "footer-start"),
      link("https://freecomputinglab.ohrg.org")[Free Computing Lab],
    )
    #html.elem(
      "span",
      attrs: (class: "colophon"),
      [Built with #link("https://rookery.ohrg.org")[rookery]],
    )
  ]
]

// The chrome alone, no `#show: rookery` — a vertebra and a minted idea page
// both need it, but only a vertebra needs the package configured.
//
// Font and size live here so a minted page's prose measures the same as the
// prose it was lifted from. They must match `--body-font` / `--font-size` in
// style.css, which the KP justifier measures against.
#let chrome(current-page: none, doc) = {
  set text(font: "Inter", size: 16pt)
  set par(justify: true)
  set cite(form: "normal")

  context if target() == "html" {
    site-header(current-page)
  }

  // Styling hook only (see `style.css`). This site's feed entries are
  // summary-less pointers at minted pages, so nothing selects on it.
  html.elem("div", attrs: (class: "rheo-feed-content"), justify-template(doc))

  context if target() == "html" {
    site-footer()
  }
}

// Template for each minted idea page. A NAMED top-level binding deliberately:
// it is stored on a document-wide state, and an inline closure would be a
// different value in every vertebra. Applies `chrome`, not `template`, or the
// two would reference each other.
#let idea-page(id: none, note: (:), doc) = {
  show: chrome.with(current-page: id)
  doc
  if id != none and "citation" in note.at("tags", default: (:)) {
    bib-fields(id.split(":").last())
  }
}

#let template(current-page: none, doc) = {
  show: rookery.with(
    theme: THEME,
    idea-page-template: idea-page,
    bibliography: BIBLIOGRAPHY,
    show-context: false,
  )
  show: chrome.with(current-page: current-page)
  doc
}
