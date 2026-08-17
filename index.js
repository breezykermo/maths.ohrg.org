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

// The header's subscribe button opens the Atom/email dialog (`subscribe-button`
// and `subscribe-dialog` in content/template.typ). Everything else the dialog
// does — Escape, the focus trap, the close button's `<form method="dialog">` —
// is the platform's, so this is the whole of the JS it needs.
//
// Clicking the backdrop closes it: a modal `<dialog>`'s click target is the
// dialog ELEMENT itself when the click lands on its UA-drawn `::backdrop`
// rather than inside the content box, which is what the equality test reads.
document.addEventListener('DOMContentLoaded', function () {
  const subscribeBtn = document.querySelector('.subscribe-btn');
  const subscribeDialog = document.querySelector('#subscribe-dialog');
  if (subscribeBtn && subscribeDialog) {
    subscribeBtn.addEventListener('click', function () {
      subscribeDialog.showModal();
    });
    subscribeDialog.addEventListener('click', function (e) {
      if (e.target === subscribeDialog) {
        subscribeDialog.close();
      }
    });
  }
});
