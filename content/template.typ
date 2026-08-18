#import "@rheo/rookery:0.3.0": idea, rookery
#import "@rheo/rookery-search:0.3.0": search-modal
#import "@rheo/justify:0.1.1": template as justify-template

// ---- #session — sugar over tags, exactly as rookery's own #note/#todo -----
//
// A reading group's unit is a session: one meeting, one reading. Each is an
// ordinary `#idea` carrying the tag "session", and that tag is what the
// homepage's `#window` selects and what the search corpus below is restricted
// to.
#let _dedup-tag(tag, tags) = if tag in tags { tags } else { (tag,) + tags }
#let session(tags: (), ..args) = idea(tags: _dedup-tag("session", tags), ..args)

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

// ============================================================
// The topbar's pages, read from rheo's own spine rather than hand-maintained.
// ============================================================
// `handle` is rheo's own name for a vertebra — the same string a page passes as
// `current-page`, and the label `#link` resolves against.
//
// `sys.inputs.rheo-context`, not a local `rheo-context()` call: rheo prepends
// that binding only into the real vertebra source files it compiles, and this
// file is excluded from the spine (see rheo.toml) precisely so it never becomes
// one. `sys.inputs.rheo-context` is the same format-global dict that per-file
// binding is spread from, so reading it directly here reaches the same
// `spine-flat` every vertebra sees, whether or not this file is one itself.
//
// Two handles are filtered out, both deliberately: `index`, because the
// wordmark IS the homepage's nav entry and takes the active state in its
// place, and `sessions`, the growing run listed on the homepage and reachable
// through search, where a topbar entry would be a second, worse copy of that
// list. Anything else — any other standing page `content/` grows — joins the
// topbar the moment it exists, with no list here to remember to edit.
#let site-pages = (
  sys
    .inputs
    .at("rheo-context", default: (spine-flat: ()))
    .spine-flat
    .filter(v => v.handle not in ("index", "sessions"))
)

// The header. Every page link goes through `link(label(<handle>))` rather than a
// hand-written `href`, because rheo rewrites exactly that form into a
// DEPTH-RELATIVE url — and it has to, since rookery mints each idea its own
// page one directory down under `ideas/`, where a hand-written `./index.html`
// would 404. The wordmark and each nav entry are wrapped in an element carrying
// the class, with Typst's `link` inside it, since only Typst can compute those
// hrefs — so the CSS hooks are `.wordmark a` and `.site-nav a`, not the anchors
// themselves.
//
// The nav sits beside the wordmark rather than at the far end: `margin-left:
// auto` lives on `.rookery-search-trigger` in style.css, so the search and
// follow controls claim the right of the bar and the nav stays on the left with
// the name it belongs to.
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
    // `tags: "session"` scopes the package's own island to the session-tagged
    // ideas, so a search never answers with the standing prose ("Our focus",
    // "Our history in brief"). The same tag selects the homepage's `#window`,
    // so the two lists cannot drift.
    #search-modal(
      // placeholder: "Search sessions",
      // trigger-label: "Search sessions",
      // tags: "session",
    )
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
// — so this reaches `about.html#loc-N` from a vertebra and
// `../about.html#loc-N` from a minted session page. The label is the `<focus>`
// idea hatched in about.typ; the `idea:` prefix is rookery's default. It points
// straight at the idea rather than at the page the topbar's About entry opens,
// which is the difference worth keeping the two slots for.
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
    bibliography: BIBLIOGRAPHY,
  )
  show: chrome.with(current-page: current-page)
  doc
}
