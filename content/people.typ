#import "template.typ": template
#import "@rheo/rookery:0.4.0": idea, window

#set document(title: [People])
#show: template.with(current-page: "people")

#let person(tags: (), ..args) = idea(tags: ("person",) + tags, ..args)

#person(<herbert-mehrtens>, title: [Herbert Mehrtens])[]
#person(<jeremy-gray>, title: [Jeremy Gray])[]
#person(<sarah-pourciau>, title: [Sarah Pourciau])[]
#person(<aaron-scott>, title: [Scott Aaronson])[]
#person(<atiyah-michael>, title: [Michael Atiyah])[]
#person(<avigad-jeremy>, title: [Jeremy Avigad])[]
#person(<babbage-charles>, title: [Charles Babbage])[]
#person(<benacerraf-paul>, title: [Paul Benacerraf])[]
#person(<berkeley-george>, title: [George Berkeley])[]
#person(<castelle-michael>, title: [Michael Castelle])[]
#person(<deringer-william>, title: [William Deringer])[]
#person(<henkle-jonah>, title: [Jonah Henkle])[]
#person(<horl-erich>, title: [Erich Hörl])[]
#person(<husserl-edmund>, title: [Edmund Husserl])[]
#person(<jaque-justin>, title: [Justin Jaque])[]
#person(<krieger-martin>, title: [Martin Krieger])[]
#person(<longo-giuseppe>, title: [Giuseppe Longo])[]
#person(<marx-george>, title: [George Marx])[]
#person(<marx-karl>, title: [Karl Marx])[]
#person(<mazzotti-massimo>, title: [Massimo Mazzotti])[]
#person(<meli-domenico>, title: [Domenico Meli])[]
#person(<miller-jacques>, title: [Jacques Miller])[]
#person(<naderi-reza>, title: [Reza Naderi])[]
#person(<peirce-charles>, title: [Charles Peirce])[]
#person(<poincare-henri>, title: [Henri Poincaré])[]
#person(<rodin-andrei>, title: [Andrei Rodin])[]
#person(<ruda-frank>, title: [Frank Ruda])[]
#person(<schmid-eric>, title: [Eric Schmid])[]
#person(<serres-michel>, title: [Michel Serres])[]
#person(<siegert-bernhard>, title: [Bernhard Siegert])[]
#person(<weatherby-leif>, title: [Leif Weatherby])[]
#person(<vasilie-na-a>, title: [N. A. Vasiliev])[]
#person(<vonfoerster-heinz>, title: [Heinz Von Foerster])[]
#person(<vonneumann-john>, title: [John von Neumann])[]
#person(<warwick-andrew>, title: [Andrew Warwick])[]
