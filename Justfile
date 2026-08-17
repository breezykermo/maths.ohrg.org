default:
    @echo "maths.ohrg.org: 'just watch' to live-rebuild, 'just build' for a one-shot"

# Berkeley Mono, into the output next to the stylesheet that asks for it. rheo
# copies no static directories into the HTML root, and style.css's `@font-face`
# urls are relative to the stylesheet — so the TTFs have to land at
# `build/html/fonts/`, which is a plain copy, the same one scripts/build.sh
# makes in CI. The wordmark and the idea ids fall back to generic `monospace`
# until it has run.
#
# The TTFs are licensed and therefore gitignored: CI pulls them from the private
# breezykermo/fonts repo with FONTS_GITHUB_TOKEN, and a fresh clone needs them
# dropped into `fonts/` by hand before this recipe works.
fonts:
    mkdir -p build/html/fonts
    cp fonts/*.ttf build/html/fonts/

# `rheo watch` rebuilds into the same tree without clearing it, so copying the
# fonts once up front is enough for a whole session.
watch: fonts
    rheo watch . --open --html

build:
    rheo compile . --html
    just fonts
