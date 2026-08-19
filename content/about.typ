#import "template.typ": template
#import "@rheo/rookery:0.4.0": idea

#set document(title: [About], date: datetime(year: 2026, month: 8, day: 17))
#show: template.with(current-page: "about")

// Standing prose, not a session: there is nothing here for an Atom reader to be
// told about, and an entry for it would arrive dated whenever this page was last
// touched.
#let rheo-feed-exclude = true

#idea(<history>, title: [Our history in brief])[
  - _June 2024._ First meeting.
  - _November 2024._ First on-site paper presentation and feedback session with our group's core members in Conneticut.
]

#idea(<focus>, title: [Our focus])[
  As computer science has grown in stature as a discipline in the university, as Moore's law is pushing computing into all the corners of our life and thought, there is no better time to ask why a more robust rapport between mathematics and critical theory has not emerged.
  Is it as simple as the fact that, as Sarah Pourciau seems to suggest, humanistic thought is aligned with the _apeiron_, whereas the sciences by definition rely on 'carving' it up into _peras_ @pourciauDigitalOcean2022?
  Or is there an interdisciplinary space where one can test the waters of a common language?
  We are not imagining an transdisciplinary metalanguage which is so general that noone understands anything at all, but rather a space where thought can actually happen.
  Can mathematics serve as the ferryman to an epistemological place where disciplinary distinctions become water under the bridge?

  More specifically, our readings are designed to help us wrap our heads around the history of _modern_ mathematics.
  We take modern mathematics to mean the kind that influenced the amorphous era we currently call modernity, an era which bears a relation to capitalism, but is not (we don't think) reducible to it.
  (In this characterization we follow the work of @mehrtensModerneSpracheMathematik1990 @siegertPassageDigitalen2003 @grayPlatosGhostModernist2008 @horlSacredChannelsArchaic2018 @steingartAxiomaticsMathematicalThought2023.)
  Modernity has been understood as the attempt to be sure of ourselves without any external guarantee, such as God or a feudal order, and as such is broadly related to secular humanism @rudaIndifferenceRepetitionModern2023.
  Our group is interested in charting and hypothesizing whether the insights of modern mathematics have anything to do with this modernity, whether set theory represents anything significant in the history of philosophy.

  This brand of secular humanism is significant and resonant in contemporary discussions about 'ethical computer science', or computing for the social good---as these debates (typically) do not hinge upon explicitly religious notions of morality or social determination, but rather point themselves towards an ambiguously modern notion of freedom and the construction of a society that optimizes for this notion.
]


