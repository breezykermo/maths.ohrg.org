# maths.ohrg.org

Website for *Math(s), Philosophy, and History*, an online reading group run by
the [Free Computing Lab](https://freecomputinglab.ohrg.org). Built with
[Rheo](https://rheo.ohrg.org) and [rookery](https://rookery.ohrg.org), following
[weeknotes.ohrg.org](https://weeknotes.ohrg.org).

```sh
just watch   # live-rebuild and open
just build   # one-shot HTML into build/html
```

## Layout

The top level of `content/` **is** the topbar: `template.typ` filters the spine
down to the root-level vertebrae, less `index` (the wordmark carries it), so
putting a page on the bar is a file move rather than an edit to a list.
Everything a reader does not browse directly lives one level down, in
`content/nest/`.

| path | role |
| --- | --- |
| `content/index.typ` | the cover: the `prelude` idea, folded windows on `focus` and `history`, and the next session |
| `content/sessions.typ` | the record: every session, transcluded by tag, newest first |
| `content/people.typ` | everyone read and everyone reading, transcluded by tag |
| `content/texts.typ` | every work read, transcluded by tag |
| `content/nest/template.typ` | site chrome, and the single place rookery is configured — theme, bibliography, `idea-page-template`, and the `#session` helper |
| `content/nest/meetings.typ` | the register of sessions, one `#session` call per meeting, oldest first |
| `content/nest/authors.typ` | the register of people, one `#person` call each |
| `content/nest/bibliography.typ` | the register of works: the sweep that mints a note per `references.bib` entry |
| `content/nest/ideas.typ` | standing notes on books and essays, reached through search and backlinks |
| `content/nest/about.typ` | where the standing `focus` and `history` ideas are hatched |
| `content/nest/references.bib` | one bibliography for the whole rookery |
| `content/nest/author-title.csl` | the citation style, kept from before the port |
| `style.css` | site styling; the packages' own CSS is injected by rheo |
| `fonts/` | Berkeley Mono, four faces (self-hosted; see below) |

A register declares notes and cannot also be the page a reader browses — a note
renders where it is declared — which is why each of the three bar pages
transcludes a nested register by tag instead of declaring anything itself. The
nested pages still compile, and stay reachable at `nest/<name>.html`; they are
simply unlisted.

## Sessions

A session is an `#idea` tagged `session`. The tag is the whole mechanism:
`sessions.typ` lists them with `#window(tags: "session", sort: "date")`, and
`index.typ` picks out the next one by comparing each note's date against the
build's own. Adding a session is therefore one new `#session(...)` call appended
to `content/nest/meetings.typ` — no separate file, no list to edit.

`#session` is sugar over `#idea`, defined in `template.typ`. It lives here
rather than in the package because "session" is this site's vocabulary, not
rookery's.

A session's id is its date, `YY-MM-DD`, passed as the label a `#session(<...>)`
call is pinned to. Because every session shares one vertebra, `#session` carries
its date explicitly via `updated:` rather than inheriting it from a per-file
`#set document(date:)`. Order in the file is chronological, oldest first — the
homepage's `sort: "date"` reads it newest first regardless. Sections within a
session, should one accumulate notes, take the session's id plus a suffix
(`26-08-03-notes`).

`#session` also emits the feed beacon that `index.typ` sources `feed.xml` from,
so the feed carries the sessions and nothing else — every other vertebra stays
out of it by hatching no session, `meetings.typ` being the only file that
declares one. Entries point at rookery's minted `ideas/<id>.html` pages, which
cannot be transcluded, so the feed is configured `content: none`: each entry is
a dated pointer rather than full text.

A session's title is its reading, and its date is the first heading inside its
body (`== 3 August 2026`). The title does not repeat the date because the
`[idea:26-08-03]` permalink beside it already carries it, in every listing the
session appears in.

The homepage is built from the same parts. Its `prelude` is a titleless idea —
`#title()` above it already carries the site's name — and `focus` and `history`
reach it as folded `#window`s rather than as copies, so their content lives on
`nest/about.typ` alone.

Citations belong to the session that writes them: rookery emits a References
block per idea, which is what makes each session a self-contained record of its
reading. `author-title.csl` is non-numeric deliberately — Typst's citation
numbering is document-wide and cannot be reset, so a numeric style would show an
idea's only reference as `[7]`.

## Fonts

Two families, split by what a thing is rather than where it sits. **Berkeley
Mono** is site furniture and identifiers — the wordmark, the search input, and a
session's `[idea:26-08-03]` id — marking the parts of the page that are
machinery rather than writing. **Inter** is everything that is writing: every
heading, and a session's own title.

Inter is fetched from Google Fonts, matching the other ohrg.org sites. Berkeley
Mono is self-hosted because it is licensed and on no CDN — and since rheo copies
no static directories, `just build` and `scripts/build.sh` copy `fonts/` into
`build/html/` after compiling. Until one has run, the wordmark, the search input
and the ids fall back to the generic `monospace`. The TTFs are gitignored; CI
pulls them from the private `breezykermo/fonts` repo with `FONTS_GITHUB_TOKEN`,
and a build without that token produces a site in the fallback rather than
failing.

## Deployment

Cloudflare Pages, `bash scripts/build.sh`, publishing `build/html` (see
`wrangler.toml` — the build command and the build cache are set in the Pages UI,
not here). The script downloads the rheo binary named in `rheo.toml` and lets
rheo fetch `@rookery/core`, `@rookery/search` and `@rheo/justify` from their own
repositories' releases, so there is nothing to install.

`nest/template.typ` is a library, not a page, so `rheo.toml` excludes it from
the spine — otherwise every `.typ` under `content/` compiles to its own page.
It is the one exclusion: nesting a file takes it off the bar, not out of the
build.
