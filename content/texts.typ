#import "template.typ": template
#import "@rookery/core:0.1.0": window

#set document(title: [Texts])
#show: template.with(current-page: "texts")

Every text the group has read. Each opens onto its own note, and a work someone
has written about at length carries that writing with it.

// A TAG SELECTION rather than a name per work: the notes are minted from
// `references.bib` by the sweep on `bibliography.typ`, so nothing here can name
// them one by one without restating the bibliography a second time.
//
// Folded, because forty-odd unfurled cards is a page nobody scrolls to the end of.
#window(tags: "citation", folded: true)
