#import "template.typ": template
#import "@rookery/core:0.1.0": window

#set document(title: [Sessions])
#show: template.with(current-page: "sessions")

Every session the group has held, most recent first.

// A TAG SELECTION over the register on `meetings.typ`, so this page cannot fall
// behind it. `sort: "date"` is newest-first, which is the order a reader arriving
// here wants — `index.typ` shows what is coming, and this is the record of what
// has been.
#window(tags: "session", folded: true, show-date: true, sort: "date")
