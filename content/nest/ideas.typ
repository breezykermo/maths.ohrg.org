#import "template.typ": citation, template
#import "@rookery/core:0.1.0": idea, tagged-idea, window

#set document(title: [Ideas])
#show: template.with(current-page: "nest:ideas")

#let book = tagged-idea("book")
#let essay = tagged-idea("essay")
#let meeting = tagged-idea("meeting")


#essay(<jamesVectorsLeibnizEinstein2023>, title: [Vectors from Leibniz to Einstein])[
  - Author: @maths:propp-james[James Propp].
  - Published: 2023.
]

#book(
  <handelmanMathematicalImaginationOrigins2019>,
  title: [The Mathematical Imagination: On the Origins and Promise of Critical Theory],
)[

  - Author: @maths:handelman-matthew[Matthew Handelman].
  - Published: 2019.

  Introduces @maths:negative-mathematics[negative mathematics] as a riposte to dismissing mathematics as aligned with an uncritical, capitalist notion of progress.
]

#idea(<negative-mathematics>, title: [Negative Mathematics])[
  Coined in the introduction to  @maths:handelmanMathematicalImaginationOrigins2019[his book], 'negative mathematics' is Handelman's bid to name an approach to critical theory, mathematics, computer science, and the digital humanities which takes mathematics seriously as a part of an emancipatory project.

  Humanists ought not to treat mathematics solely as a discipline and syntax of thought inrecupreably allied with capital, a viewpoint that Handelman argues has washed over the humanities since the 1930 debate between @maths:horkheimer-max[Horkheimer]/@maths:adorno-theodor[Adorno] (the Frankfurt School / critical theory) and @maths:neurath-otto[Neurath]/@maths:carnap-rudolf[Carnap] (the Vienna Circle / logical positivism),
]

#essay(<horkheimerDialecticEnlightenment2002>, title: [Dialectic of Enlightenment])[
  - Author: @maths:horkheimer-max[Max Horkheimer] and @maths:adorno-theodor[Theodor Adorno]
  - Published: 1947.
]

#citation(<jingAlgorithm2026>, tags: "essay")[
  - Author: @maths:jing-felicia.
  - Published: 2026.
]

#idea(<algorithmic-materiality>, title: [Algorithmic Materiality])[
  I'm delighted to kick off the Autumn/Fall with @maths:jing-felicia's essay here in the _Math(s), Philosophy, History_ reading group.

  [as we have her here as a guest at my invitation, I'll get us started with some remarks.]

  - just completed a PhD in Political Theory at Johns Hopkins University
  - is a visiting fellow at NYU's Remarque Institute this Fall
  - will be joining Brown University in the Spring 2027 for a postdoc in the Program of Science, Technology, and Society.
  - The essay we read today is a condensed version of her dissertation's first chapter that is forthcoming in _Political Concepts: A Critical Lexicon_.

  This essay offers us a new, I think, and more materialist angle on the history and politics of computer science.
  The materiality of the algorithm is, following Marx, not only the economy of the hardware on which it runs, but also the socio-political logic that _structures_ developments in hardware, software, and programming.
  The substitution of software for hardware when it comes to questions of its economy---a substition spirited in no small part in media studies by Friedrich Kittler's infamous claim that "there is no software"---displaces rather than addressses the question of the politics and historicity of computing.

  Jing shows that there is something about the _logic_ of algorithms---and therefore of software, given code is treated as the materialization of algorithmic logic---that walks hand-in-hand with capital.
  Indeed, Jing's gesture to this intimate contact between capital and computation builds on Alfred Sohn-Rethel's chief insight, namely that one of the most conseqential results of capital's perceptual physics [Best] on the division of labour is to conceptually separate the head from the hand, and therefore to valorize the labor that issues from the 'intellect' in a way that undermines the conscious and egalitarian contract of capital and the wage, that is, that all labour is exchangeable under the aegis of fair compensation.

  Jing narrates the courting of these two concepts first by touching on the algorithm as an Althusserian 'absent concept', and then by firming it up as a Robinsonnade with reference to the Marxian critique of prehistory:

  #quote(
    block: true,
  )[In a vanishing act of 'hiding the machine', algorithms are sanitized not only from the material development of hardware, its dirty industrial history, its dependency on the labor of earlier 'human computers' but also---importantly--from the _state_ machine. That is, the centralized bureaucratic state, class antogonisms, and the legal forms of coercion were, at every moment, a site of struggle over and against the *political form* of an alorithm. @jingAlgorithm2026[pp.8-9]]

  Jing goes on to show how the conceptual constitution of the 'algorithm' as prehistorical flattens the history of computer science into a crude, teleological account, geared towards a narrative of ever-advancing progress.
  This flattened conception squeezes the possibility of criticality, politicality, and thus an emancipatory politics from the entire enterprise of computing, readying it to be cast, like a ketchup wrapper, into the dustbins of history as a bone that could never stick in the throat of capital's voracious appetite.

  What I love about this essay is how Jing takes on Donald Knuth just as Marx did Adam Smith, i.e. as the originator of a mythology with real consequences.
  I think Knuth is the right figure to take on for a number of reasons, not least because it is also Knuth who establishes the idea of 'literate programming' as its idea, which is to say that Knuth argues that a program should be conceptualized as a work of art such a a novel, an artefact by analogy of literature chiefly, and not of industry.
  Jing's argument shows how the Knuth's analogical insistence in literate programming might hide another absent concept in the computer program.
  In its prehistorical guise as architected by a single and singular genius, the computer program becomes---like the novel---a form of expression distinctly _fathered_ by modernity, and therefore by capital.

  To mark the genealogical relation between computing and capital in this way is not the same, critically, as consigning computing and computer science to the collection of practices with which we must not dare to engage should we seek an emancipated future.
  On the contrary, following Marx's engagement with the political economy of his day, it is to insist that we _must_ read figures such as Donald Knuth again, symptomatically, to articulate more concretely how capital and computing are entangled as logical structures, what power one does and does not have over the other.

  It is Jing's keen engagement with _this_ materiality of computing, a materiality truer than that which results from holding one's eye up to the end of a fiber optic cable---as friend-of-the-pod Tung-Hui Hu once reported himself doing---that makes her essay an opportune way out of our group's summer focus on the 19#super[th] century, our 19#super[th] century summer.

  One of our group's recurring themes is how we should think the materiality of mathematics in general, and the materiality of _pure_ mathematics in particular, the algebraic turn that authors we have read such as Jeremy Gray and Erich Hörl have referred to variably as mathematics' modernism or modernization.
  Algorithmic materiality, it seems to me, skips hand-in-hand with the materiality of _calculus_, at least when the song of capital is playing over the speakers.
  The conceptual divisions we have tracked in previous sessions, between applied and pure mathematics, between pure mathematics and mathematic physics, and between algebra and geometry: all these divisions should be thought in the light of capital's surreptitously enforced division between head and hand, between intellectual-qua-immaterial and manual-qua-material labour.
  This is what Jing's essay illuminates for us, and I'll now turn over to her to say a few words about it before we open up for any and all questions and comments as usual.
]

#meeting(<jing-31-8-26>)[
  - working on the 'history of the history of algoritms'; or, the 'improper history of algorithms'.

  Mikey: key term = "repression of the state".
  Fred Turner - machines associated with the military industrial complex become rebranded as liberatory devices.
  - the period in which software engineering was being legitimized = a very interesting period in history of the 'state'.

  The 'generalization' problem: how do you separate an algorithm from its context?
  Felicia: how did it become possible to allude to images/metaphors so far away.
  Mirowski's claim: computer scientists had a physics envy.

  prehistoric orientalizing = distinct but related to the popularizing metaphors.

  Lindsay: algorithms seen very much as a threat to bourgeios individuality, rather than a buttress.

  Felicia: rest of the dissertation is about the tautology of 'plans' and 'planning' with computer science.

  Holly: what is really at stake in the _democratization_ of programming, of making it better.
  How does the democratization of an academic field relate to the politics of democratization.
  The definition of an algorithm actually emerges with Ada Lovelace (100 years before, in the Babbage context) `potentially a really strong connection to capital / Marx`.
  *an elegant kick* - any metaphor throws us into material history.
  - Holly: "should we always get our kick from the concept?"

  Felicia's broader argument = state planning is a positive conception of the history of algorithms.

  == building on this notion of state planning, Holly and the democratization of programming
  - aside: `in the archaeological register, regarding Mesopotamian history: should be compared to Israel/Palestine and the coloniality of archaeology.`
  - resonant with Marx's comment in the _Grundrisse_, the man is the key to the ape.

  - Shriram, Will, and the way that CS is _taught_.
  ACM defines computing as the definition of a procedure.
  - `one interesting aspect here is the _computer_ itself as a logical entity.`
  - the metaphors for algorithms, always seen as 'innocent'.
  - what I wonder is whether you are calling for a *rehistoricization of computing*, as Marx would call for with bourgieous society: refusing to allow this prehistorical goo to serve as the narrative.
    `this is particularly interesting as a site of intervention for CS education, i.e. building a distribution system rather than a bank.`
  - birds, _rewilding_ the metaphors of systems and software.
  - is this a *more materialst intervention* on the politics of the algorithm as a concept?
]
