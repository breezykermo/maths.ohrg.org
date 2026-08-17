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

| path | role |
| --- | --- |
| `content/template.typ` | site chrome, and the single place rookery is configured — theme, bibliography, `idea-page-template`, and the `#session` helper |
| `content/index.typ` | the cover: the `prelude` idea, folded windows on `focus` and `history`, and the list of every session |
| `content/about.typ` | where the standing `focus` and `history` ideas are hatched; the one topbar entry |
| `content/YY-MM-DD.typ` | one session, one meeting — the vertebra whose id is its date |
| `content/references.bib` | one bibliography for the whole rookery |
| `content/author-title.csl` | the citation style, kept from before the port |
| `style.css` | site styling; the packages' own CSS is injected by rheo |
| `fonts/` | Berkeley Mono, four faces (self-hosted; see below) |

## Sessions

A session is an `#idea` tagged `session`. The tag is the whole mechanism: the
homepage lists sessions with `#window(tags: "session", sort: "date")`, and the
search corpus in `template.typ` is filtered to the same tag, so search answers
with meetings rather than with the site's standing prose. Adding a session is
therefore one new file under `content/` and nothing else — no list to edit.

`#session` is sugar over `#idea`, defined in `template.typ` exactly as rookery's
own `#note` and `#todo` are defined over it. It lives here rather than in the
package because "session" is this site's vocabulary, not rookery's.

A session's id is its date, `YY-MM-DD`, which sorts lexicographically into
chronological order — so rheo's spine (lexicographic by filename) reads oldest
first while the homepage's `sort: "date"` reads newest first. Sections within a
session, should one accumulate notes, take the session's id plus a suffix
(`26-08-03-notes`).

A session's title is its reading, and its date is the first heading inside its
body (`== 3 August 2026`). The title does not repeat the date because the
`[idea:26-08-03]` permalink beside it already carries it, in every listing the
session appears in.

The homepage is built from the same parts. Its `prelude` is a titleless idea —
`#title()` above it already carries the site's name — and `focus` and `history`
reach it as folded `#window`s rather than as copies, so their content lives on
`about.typ` alone.

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
rheo fetch `@rheo/rookery`, `@rheo/rookery-search` and `@rheo/justify` from the
rheo-packages releases, so there is nothing to install.

`template.typ` is a library, not a page, so `rheo.toml` excludes it from the
spine — otherwise every `.typ` under `content/` compiles to its own page.
