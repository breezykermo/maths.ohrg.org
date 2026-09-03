#import "nest/template.typ": template
#import "@rookery/core:0.1.0": window

#set document(title: [Sessions])
#show: template.with(current-page: "sessions")

#window(
  tags: "session",
  folded: true,
  show-date: true,
  sort: "date",
)
