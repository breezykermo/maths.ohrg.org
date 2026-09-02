#import "nest/template.typ": template
#import "@rookery/core:0.1.0": window

#set document(title: [People])
#show: template.with(current-page: "people")

Everyone the group has read, and everyone who has read with us.

// A TAG SELECTION, so this page cannot fall behind the register: the notes are
// declared on `authors.typ`, and naming them one by one here would be a second
// list to keep in step with the first.
#window(tags: "person")
