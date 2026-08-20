// Auto-injected into every HTML page by rheo (default entrypoint: ./index.js).

// On narrow screens, opt out of client-side Knuth-Plass justification entirely.
// The KP client (rheo/justify/lib.js) skips any `p.rheo-kp` that sits inside a
// `.rheo-kp-skip` ancestor. Both scripts are deferred and execute in document
// order, so this runs before lib.js's justifier — tagging the container here
// makes every paragraph skip: text keeps natural browser line-wrapping, with no
// inserted no-break spaces, forced breaks, or hyphenation. Runs at top level (not
// on DOMContentLoaded) so it lands before lib.js processes the page.
if (window.matchMedia('(max-width: 600px)').matches) {
  document.querySelectorAll('.rheo-feed-content').forEach(function (el) {
    el.classList.add('rheo-kp-skip');
  });
}
    });
  }
});
