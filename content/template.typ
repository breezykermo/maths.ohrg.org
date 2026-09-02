#import "@rookery/core:0.1.0": idea, rookery
#import "@rookery/search:0.1.0": search-modal
#import "@rookery/bibtex:0.1.0": bibtex
#import "@rheo/justify:0.1.1": template as justify-template
#import "@rheo/feeds:0.1.0": feeds-modal, item, mail-icon

// A session is an idea tagged `session`, plus the feed beacon `index.typ`
// sources from. Defined once here; `sessions.typ` imports it.
//
// `page` is the minted `ideas/` page: every session shares the one
// `sessions.typ` vertebra, so that is the only per-session URL there is.
//
// `authors:` names the people whose ideas were read, by id (`<sarah-pourciau>`
// from content/authors.typ) — appended as a closing line rather than forwarded
// blind through `..args`, since it has to land AFTER the given body. Each
// renders via `@id`'s own `ref`, so it takes that author's resolved title
// (the `show ref: hyperlink` rule `#show: rookery.with(...)` installs below)
// rather than a name typed twice.
#let session(tags: (), authors: (), ..args) = {
  let name = args.pos().at(0)
  let body = args.pos().at(1)
  let named = args.named()
  let slug = str(name)
  // A session's date rides on the `#session` call, not a per-file `#set
  // document(date:)` — there is no per-session file. It fills both Atom dates.
  let when = named.at("updated", default: none)
  item(
    id: "idea:" + slug,
    title: named.title,
    page: "ideas/" + slug + ".html",
    published: when,
    updated: when,
    categories: ("session",) + tags,
  )
  // `ref()` resolves against the REAL Typst label `#idea` attaches, which is
  // the full prefixed id (`<idea:sarah-pourciau>`), not the bare one an
  // author is named by here (`<sarah-pourciau>`) — `_norm`'s bare/full
  // equivalence is rookery's own registry lookup, not Typst's native label
  // matching, so the prefix has to be rebuilt by hand.
  let full-body = if authors.len() == 0 {
    body
  } else {
    body + par[Authors: #authors.map(a => ref(label("idea:" + str(a)))).join(", ")]
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
  ),
)
#let citation = BIBTEX.citation
#let citations-as-ideas = BIBTEX.all
#let bib-fields = BIBTEX.fields

// FOUR VERTEBRAE ARE OFF THE BAR, each for its own reason, and none by oversight.
//
// `bibliography` and `authors` are REGISTERS: the first runs the sweep that mints
// a note per `references.bib` entry, the second declares one per person. A note
// renders where it is declared, so a register cannot also be the page a reader
// browses — `texts` and `people` transclude them by tag instead.
//
// `ideas` is off the bar because its notes are reached through the search modal
// and through the backlinks on whatever cites them, not through a list of
// everything. `sessions` and `index` are the two the bar has never carried: the
// wordmark is the index, and every session is reached from it.
#let site-pages = (
  sys.inputs.at("rheo-context", default: (spine-flat: ())).spine-flat.filter(v => (
    v.handle not in ("index", "sessions", "bibliography", "authors", "ideas")
  ))
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
// labels. Three slots rather than two, because the middle one is what centres —
// "Our focus" is the entry point for a reader who landed on a single session
// with no idea what the group is.
//
// `link(label("idea:focus"))` rather than an href, so it resolves to the anchor
// the idea sits on and stays depth-correct from a minted session page.
#let site-footer() = html.elem("footer", attrs: (class: "site-footer"))[
  #html.elem("div", attrs: (class: "site-footer-inner"))[
    #html.elem(
      "span",
      attrs: (class: "footer-start"),
      link("https://freecomputinglab.ohrg.org")[Free Computing Lab],
    )
    #html.elem(
      "span",
      attrs: (class: "footer-center"),
      link(label("idea:focus"))[Our focus],
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
  )
  show: chrome.with(current-page: current-page)
  doc
}
