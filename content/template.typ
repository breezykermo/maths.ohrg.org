// Site chrome, and the one place `@rheo/rookery` is configured.
//
// `#show: rookery` has to be applied in EVERY vertebra that uses the package —
// Typst imports are per-file, so no one file can install it for the others.
// Wrapping it in the site template is how that requirement is met once: a
// session writes `#show: template.with(...)` and gets the chrome, the prefix,
// the theme, the bibliography and the `ref` rule together.
#import "@rheo/rookery:0.2.0": idea, rookery, tags-of
// Both imports have to be written HERE, in the site's own file: rheo scans
// only a project's own `.typ` files for package imports, so a package reached
// transitively through another one contributes nothing — no stylesheet, no
// script, and (for rookery) no minted idea pages at all, which would leave the
// search index with nothing to link to.
#import "@rheo/rookery-search:0.2.0": search-ideas, search-modal

// Client-side Knuth-Plass justification for the HTML target. `justify-template`
// installs a `show par` rule that routes justified, text-only paragraphs through
// browser-side KP; on PDF/EPUB it is a no-op (Typst's native justifier runs).
// rheo auto-injects the package's JS/CSS via its typst.toml `[tool.rheo.html]`
// (see rheo.toml, where style.css and index.js are re-declared so the project
// bundle survives the package's bundle).
#import "@rheo/justify:0.1.0": template as justify-template

// ---- #session — sugar over tags, exactly as rookery's own #note/#todo -----
//
// A reading group's unit is a session: one meeting, one reading. Each is an
// ordinary `#idea` carrying the tag "session", and that tag is what the
// homepage's `#window` selects and what the search corpus below is restricted
// to. Sugar, not a kind: `#session("x")[...]` is exactly
// `#idea("x", tags: ("session",))[...]`.
//
// Defined HERE rather than in the package because "session" is this site's
// vocabulary, not rookery's — `note` and `todo` are general knowledge-keeping
// tags, a reading group meeting is not. The two lines below are a deliberate
// copy of the package's own (`_dedup-tag`, `note`, `todo` in its lib.typ), for
// the two reasons documented there:
//
//   - NOT `idea.with(tags: ("session",))`. An explicit `tags:` at the call site
//     OVERRIDES a value bound by `.with()`, so `#session("x", tags: ("cancelled",))`
//     would silently drop "session" — the tag the caller wrote `#session` for.
//   - Prepend unless already present, so `#session("x", tags: ("session",))`
//     yields one tag, not two, and the heading gets no duplicated CSS class.
//
// Forwards every other argument (level, title, minted, updated, show-date) and
// the positional sink untouched, so `#session[body]`, `#session("name")[body]`
// and `#session(<name>)[body]` all work exactly as the `#idea` forms do.
#let _dedup-tag(tag, tags) = if tag in tags { tags } else { (tag,) + tags }
#let session(tags: (), ..args) = idea(tags: _dedup-tag("session", tags), ..args)

// The theme: ONE document-wide value, which is why it lives in the one file
// every vertebra imports. A dark purple, deepened from the magenta `--link-color`
// this site used before it was a rookery — where rookery.ohrg.org is amber and
// weeknotes.ohrg.org is green, so the three read as the same system without
// reading as the same site.
//
// `border-color` is set EXPLICITLY rather than left to fall through to
// `link-color`, and that fallthrough is the reason it has to be: `link-color`
// is a hover FILL, so it is translucent by construction, and a 1px rule drawn
// in a 16%-alpha purple is a grey smudge. The two want the same hue at
// different strengths — the accent solid for every hairline the package draws
// (the left edge of an idea box and of a window, the rules down an outline's
// rows, the line above a Footnotes or References block), and the wash behind a
// link on hover.
//
// Keep these in step with `--accent` / `--hover-fill` in style.css: the header
// and the prose outside an idea have no `.idea-*` ancestor to inherit the
// package's injected custom properties from.
#let THEME = (
  link-color: "rgba(88, 28, 135, 0.16)",
  fold-color: "rgba(88, 28, 135, 0.07)",
  border-color: rgb("#581c87"),
  date-color: rgb("#6f6284"),
)

// One bibliography for the whole rookery, alongside the theme and for the same
// reason: it is a document-wide value, so every vertebra has to ask for the
// same thing and this is the one file that asks. rookery emits a References
// block per idea, listing exactly the works that idea cites — which is what
// turns each session into a self-contained record of its reading.
//
// `bytes(read(...))` rather than a path, for BOTH the library and the style.
// Typst resolves a path against the file the call appears in, and rookery's own
// `#bibliography` call lives inside the package — a path would be looked for
// next to the package's `lib.typ`. Reading here resolves against THIS file,
// which is where both files sit.
//
// `author-title.csl` is the style this site used before rookery and is kept:
// author-title is non-numeric, which matters, because Typst's citation
// numbering is document-wide and cannot be reset — under a numeric style an
// idea's only reference can render as `[7]`.
#let BIBLIOGRAPHY = arguments(
  bytes(read("references.bib")),
  style: bytes(read("author-title.csl")),
)

// The two icons the subscribe control uses. `fill: currentColor` on the first
// and `stroke: currentColor` on the second is not a stylistic choice: the Atom
// mark is a solid shape and the envelope is a line drawing, so each takes the
// header's colour through whichever channel it is drawn in, and both then
// follow the button's hover together.
#let atom-icon = html.elem(
  "svg",
  attrs: (width: "16", height: "16", viewBox: "0 0 24 24", fill: "currentColor"),
  html.elem("path", attrs: (
    d: "M19.199 24C19.199 13.467 10.533 4.8 0 4.8V0c13.165 0 24 10.835 24 24h-4.801zM3.291 17.415c1.814 0 3.293 1.479 3.293 3.295 0 1.813-1.485 3.29-3.301 3.29C1.47 24 0 22.526 0 20.71s1.475-3.294 3.291-3.295zM15.909 24h-4.665c0-6.169-5.075-11.245-11.244-11.245V8.09c8.727 0 15.909 7.184 15.909 15.91z",
  )),
)

#let mail-icon = html.elem(
  "svg",
  attrs: (
    width: "16",
    height: "16",
    viewBox: "0 0 24 24",
    fill: "none",
    stroke: "currentColor",
    stroke-width: "2",
  ),
)[
  #html.elem("rect", attrs: (x: "2", y: "4", width: "20", height: "16", rx: "2"))
  #html.elem("path", attrs: (d: "m2 6 10 7 10-7"))
]

// The follow control, which is a BUTTON rather than a bare link to `/feed.xml`.
// There are two ways to keep up with the group and only one of them is a url —
// the other is an email to a human, and on this site that email is also how a
// reader JOINS, since the list is moderated. So the slot cannot be an anchor
// pointing at either one; it opens the dialog below, where the feed and the
// mailing list sit as two equal options.
//
// `aria-haspopup`/`aria-controls` say in markup what the click handler in
// index.js does, so the control announces itself as opening a dialog rather
// than as an unexplained button.
#let subscribe-button = html.elem(
  "button",
  attrs: (
    type: "button",
    class: "subscribe-btn",
    title: "Follow",
    aria-haspopup: "dialog",
    aria-controls: "subscribe-dialog",
  ),
)[
  #atom-icon
  #html.elem("span")[Follow]
]

// `<dialog>` rather than a div: `showModal()` puts it in the top layer, which
// is the one thing that clears the sticky header's stacking context for free,
// and brings the backdrop, the focus trap and Escape-to-close with it. The
// close button is a `<form method="dialog">` submit — the platform's own way to
// close a dialog, and the one that still works with no JS.
//
// `/feed.xml` is site-absolute, and can be: unlike the wordmark, this href is
// not depth-relative and so does not need rheo to rewrite a Typst `link` for
// it. It resolves from a minted idea page under `ideas/` exactly as it does
// from the homepage.
//
// The mailing list wording is the index's, verbatim: the subject header and the
// one-or-two sentences are what the moderator on the other end reads, so a
// paraphrase here would produce mail that does not say what is needed.
#let subscribe-dialog = html.elem("dialog", attrs: (id: "subscribe-dialog", class: "subscribe-dialog"))[
  #html.elem("form", attrs: (method: "dialog", class: "subscribe-dialog-close-form"))[
    #html.elem("button", attrs: (type: "submit", class: "dialog-close", aria-label: "Close"))[✕]
  ]
  #html.elem("ul", attrs: (class: "subscribe-options"))[
    #html.elem("li", attrs: (class: "subscribe-option"))[
      #html.elem("a", attrs: (href: "/feed.xml", class: "subscribe-option-link"))[
        #atom-icon
        #html.elem("span")[Atom feed]
      ]
      #html.elem("p", attrs: (class: "subscribe-option-desc"))[
        Pull each new session into an #html.elem("a", attrs: (
          href: "https://aboutfeeds.com",
          target: "_blank",
          rel: "noopener",
        ))[RSS/Atom reader].
      ]
    ]
    #html.elem("li", attrs: (class: "subscribe-option"))[
      #html.elem("a", attrs: (
        href: "mailto:maths@ohrg.org?subject=JOIN",
        class: "subscribe-option-link",
      ))[
        #mail-icon
        #html.elem("span")[Mailing list]
      ]
      #html.elem("p", attrs: (class: "subscribe-option-desc"))[
        To join, email #html.elem("strong")[maths\@ohrg.org] with #html.elem("strong")[JOIN] in the subject line, and a 1--2 sentence explanation of your interest in the group.
      ]
    ]
  ]
]

// The search corpus, SESSIONS ONLY.
//
// A hand-rolled stand-in for `#search-index`, which the package would otherwise
// emit for us from inside `#search-modal`. The package indexes every idea in the
// rookery, and here that is the site's standing prose — "Our focus", "Our
// history in brief" — as well as the sessions, so a search for a reading would
// answer with rows that are not meetings at all. Restricting the corpus to the
// `session`-tagged ideas makes every hit a session, which is the unit this site
// is read in. The same tag selects the homepage's `#window`, so the two lists
// cannot drift.
//
// Sessions carry their reading in their body, and `search-ideas` scores bodies
// as well as ids and titles — so an author or a title that appears only in a
// citation is findable, which is the point of indexing them at all.
//
// The shape has to match the package's byte for byte, because its script reads
// the island by id and expects exactly these five fields: `id`, `name`, `text`
// (the title as plain text), `body`, `href`. `search-ideas("")` is the empty
// query matching everything, which is where the package starts too; rows with
// no `href` are ideas rheo cannot mint a page for, and a result that cannot be
// opened is not a result.
//
// `body-chars` caps each body in CLUSTERS, as the package's does. The
// truncation only ever runs on a body LONGER than the cap, which is what keeps
// `.join()` off an empty array (it returns `none`, not `""`).
#let session-search-index(elem-id: "rookery-search-index", body-chars: 1200) = context {
  if target() != "html" { return }
  let rows = search-ideas("")
    .filter(e => e.href != none and "session" in tags-of(e.name))
    .map(e => (
      id: e.id,
      name: e.name,
      text: e.text,
      body: if body-chars == none or e.body.clusters().len() <= body-chars {
        e.body
      } else {
        e.body.clusters().slice(0, body-chars).join()
      },
      href: e.href,
    ))
  if rows.len() == 0 { return }
  html.elem(
    "script",
    attrs: (type: "application/json", id: elem-id),
    json.encode(rows, pretty: false),
  )
}

// The header. The wordmark goes through `link(label("index"))` rather than a
// hand-written href, because rheo rewrites exactly that form into a
// DEPTH-RELATIVE url — and it has to, since rookery mints each idea its own
// page one directory down under `ideas/`, where a hand-written `./index.html`
// would 404. The class-carrying element wraps Typst's `link`, so the CSS hook
// is `.wordmark a` rather than the anchor itself.
//
// No nav: this site is a homepage and a run of sessions, and the homepage IS
// the index of every session in the rookery.
//
// `#search-modal()` emits its trigger button AND its `<dialog>` together, one
// call — unlike `subscribe-dialog` below, there is no clean way to keep ITS
// dialog out of the flex row without reimplementing part of the package. No
// harm done: a closed `<dialog>` is `display: none`, so it lays out as nothing
// inside `.site-header-inner` either way.
#let site-header(current-page) = html.elem("header", attrs: (class: "site-header"))[
  #html.elem("div", attrs: (class: "site-header-inner"))[
    #let wordmark-class = if current-page == "index" { "wordmark active" } else { "wordmark" }
    #html.elem("span", attrs: (class: wordmark-class), link(label("index"))[maths])
    // `index: false` — the island is `session-search-index` above, filtered to
    // the sessions, and two islands under one id would leave the script reading
    // whichever the DOM handed it first.
    #session-search-index()
    #search-modal(placeholder: "Search sessions", trigger-label: "Search sessions", index: false)
    #subscribe-button
  ]
  #subscribe-dialog
]

// The footer, built as the header's mirror image: the same flex row inside the
// same inner wrapper, the same hairline (there on top rather than underneath),
// and the same small mono labels. A real `<footer>` to the header's `<header>`.
//
// Three slots rather than the header's two, because the middle one is what
// centres. "Our focus" is the entry point for a reader who has arrived at a
// single session with no idea what the group is, so it takes the centre line;
// the convenor link sits where the wordmark does, and the colophon takes the
// far end, the slot the feed icon holds above.
//
// `link(label("idea:focus"))`, not an href: only Typst can resolve an idea's
// label to the anchor it lands on, and rheo rewrites that form depth-relatively
// — so this reaches `index.html#loc-N` from the homepage and
// `../index.html#loc-N` from a minted session page. The label is the `<focus>`
// idea hatched in index.typ; the `idea:` prefix is rookery's default.
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

// The chrome alone, with no `#show: rookery` in it. Split out from `template`
// below because BOTH a vertebra and a minted idea page need it, and only a
// vertebra needs the package configured: a minted page is spliced in after
// every vertebra has already set the prefix, the theme and the bibliography, so
// re-applying `rookery` there would append a second round of identical state
// updates for no gain.
//
// The body font and size are set here, not in `template`, for the same reason:
// a minted page's prose has to measure the same as the prose it was lifted
// from. They must also match `--body-font` / `--font-size` in style.css — the
// KP justifier emits these values as the `data-font`/`data-size` its runtime
// reads, and measures line lengths against them, so a mismatch breaks the
// spacing.
#let chrome(current-page: none, doc) = {
  set text(font: "Inter", size: 16pt)
  set par(justify: true)
  set cite(form: "normal")

  context if target() == "html" {
    site-header(current-page)
  }

  // rheo takes each feed entry's body from the first `<main>`, else the first
  // element carrying `rheo-feed-content`, else the whole `<body>`. The class
  // rather than `<main>`, so the header and footer stay out of the Atom
  // entries.
  html.elem("div", attrs: (class: "rheo-feed-content"), justify-template(doc))

  context if target() == "html" {
    site-footer()
  }
}

// The template for the standalone page rookery mints per idea, handed to the
// package by `template` below and called by its `.marrow.typ` once per idea.
//
// A NAMED top-level binding, deliberately: the package stores this on a
// document-wide state, and an inline closure written inside `template` would
// be a different value in every vertebra that applies it. `note` (the idea's
// registry record: title, dates, origin, outbound links) goes unused here.
//
// Defined before `template` and applying `chrome` rather than `template` — the
// two would otherwise have to reference each other.
#let idea-page(id: none, note: (:), doc) = {
  show: chrome.with(current-page: id)
  doc
}

#let template(current-page: none, doc) = {
  show: rookery.with(
    theme: THEME,
    idea-page-template: idea-page,
    window-depth: 0,
    bibliography: BIBLIOGRAPHY,
  )
  show: chrome.with(current-page: current-page)
  doc
}
