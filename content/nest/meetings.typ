#import "@rookery/core:0.1.0": window
#import "template.typ": session, template

// THE REGISTER of every session the group has held, and the only place they are
// declared. A note renders where it is declared, so the page a reader browses is
// `sessions.typ`, which transcludes these by tag.
//
// Each session hatched below is also a feed entry — see `#session` in template.typ.
//
// THE READING IS A LIST, NOT PROSE. `reading:` takes the works read — a bare id,
// or `(id, pages)` where a session read a stretch of one — and `#session` draws
// them, the people who wrote them and the date as the note's header table. A
// body is therefore EMPTY for most sessions: what remains in one is whatever was
// said on the day, never the record of what was read.

#set document(title: [Meetings])
#show: template.with(current-page: "nest:meetings")

#session(
  <24-06-21>,
  title: [Pourciau on number and the digital ocean],
  reading: (<pourciauLogosAnomalousEpisode2019>, <pourciauDigitalOcean2022>),
  authors: (<sarah-pourciau>,),
  updated: datetime(year: 2024, month: 6, day: 21),
)[]

#session(
  <24-07-12>,
  title: [Aaronson on computational complexity],
  reading: (<aaronsonWhyPhilosophersShould2013>,),
  authors: (<aaron-scott>,),
  updated: datetime(year: 2024, month: 7, day: 12),
)[]

#session(
  <24-07-26>,
  title: [Thurston on proof and progress],
  reading: (<thurstonProofProgressMathematics2006>,),
  authors: (<thurston-william>,),
  updated: datetime(year: 2024, month: 7, day: 26),
)[]

#session(
  <24-08-09>,
  title: [Von Neumann on the mathematician],
  reading: (<vonneumannMathematician1947>,),
  authors: (<vonneumann-john>,),
  updated: datetime(year: 2024, month: 8, day: 9),
)[]

#session(
  <24-08-30>,
  title: [Gray on the modernist transformation of mathematics],
  reading: ((<grayPlatosGhostModernist2008>, "pp.18-38"),),
  authors: (<jeremy-gray>,),
  updated: datetime(year: 2024, month: 8, day: 30),
)[]

#session(
  <24-09-19>,
  title: [Turing on thinking machines],
  reading: (
    <turingIntelligentMachineryHeretical2004>,
    <turingCanDigitalComputers2004>,
  ),
  authors: (<turing-alan>,),
  updated: datetime(year: 2024, month: 9, day: 19),
)[]

#session(
  <24-10-04>,
  title: [Peirce on the elements of logic],
  reading: ((<peirceElementsLogic1974>, "pp.134-173"),),
  authors: (<peirce-charles>,),
  updated: datetime(year: 2024, month: 10, day: 4),
)[]

#session(
  <24-10-17>,
  title: [Babbage on the economy of machinery],
  reading: ((<babbageEconomyMachineryManufactures1832>, "pp.i-50"),),
  authors: (<babbage-charles>,),
  updated: datetime(year: 2024, month: 10, day: 17),
)[]

#session(
  <24-11-15>,
  title: [Joque on revolutionary mathematics (cancelled)],
  reading: (<joqueRevolutionaryMathematicsArtificial2022>,),
  authors: (<joque-justin>,),
  updated: datetime(year: 2024, month: 11, day: 15),
)[]

#session(
  <25-01-24>,
  title: [Serres on the history of scientific thought],
  reading: (<serresIntroduction1995>,),
  authors: (<serres-michel>,),
  updated: datetime(year: 2025, month: 1, day: 24),
)[]

#session(
  <25-02-06>,
  title: [Hörl on sacred channels],
  reading: ((<horlSacredChannelsArchaic2018>, "pp.89-108"),),
  authors: (<horl-erich>,),
  updated: datetime(year: 2025, month: 2, day: 6),
)[]

#session(
  <25-02-20>,
  title: [Krieger on convention in statistics],
  reading: (<kriegerConventionHowMeans2015>,),
  authors: (<krieger-martin>,),
  updated: datetime(year: 2025, month: 2, day: 20),
)[]

#session(
  <25-03-07>,
  title: [Vasiliev on imaginary logic],
  reading: (<vasilievImaginaryNonaristotelianLogic1925>,),
  authors: (<vasilie-na-a>,),
  updated: datetime(year: 2025, month: 3, day: 7),
)[]

#session(
  <25-04-03>,
  title: [Marx's mathematical manuscripts],
  reading: ((<marxMathematicalManuscriptsKarl1983>, "pp.109-119"),),
  authors: (<marx-karl>,),
  updated: datetime(year: 2025, month: 4, day: 3),
)[]

#session(
  <25-04-17>,
  title: [Warwick on Cambridge mathematical physics],
  reading: ((<warwickMastersTheoryCambridge2003>, "pp.ix-xi, 212-226"),),
  authors: (<warwick-andrew>,),
  updated: datetime(year: 2025, month: 4, day: 17),
)[]

#session(
  <25-05-01>,
  title: [Rodin on categorial logic and Hegelian dialectics],
  reading: (<rodinCategorialLogicHegelian2013>,),
  authors: (<rodin-andrei>,),
  updated: datetime(year: 2025, month: 5, day: 1),
)[]

#session(
  <25-05-15>,
  title: [Marx on the myth of the Martians],
  reading: (<marxMythMartiansGolden1996>,),
  authors: (<marx-george>,),
  updated: datetime(year: 2025, month: 5, day: 15),
)[]

#session(
  <25-06-12>,
  title: [Steingart on axiomatics and high modernism],
  reading: ((<steingartAxiomaticsMathematicalThought2023>, "pp.1-24"),),
  authors: (<steingart-alma>,),
  updated: datetime(year: 2025, month: 6, day: 12),
)[]

#session(
  <25-07-03>,
  title: [Mazzotti on reactionary mathematics],
  reading: ((<mazzottiReactionaryMathematicsGenealogy2023>, "pp.128-146"),),
  authors: (<mazzotti-massimo>,),
  updated: datetime(year: 2025, month: 7, day: 3),
)[]

#session(
  <25-07-18>,
  title: [Berkeley's Analyst],
  reading: (<berkeleyAnalystDiscourseAddressed1754>,),
  authors: (<berkeley-george>,),
  updated: datetime(year: 2025, month: 7, day: 18),
)[]

#session(
  <25-08-01>,
  title: [Mehrtens on nationalism and internationalism],
  reading: (<mehrtensNationalismInternationalism1996>,),
  authors: (<herbert-mehrtens>,),
  updated: datetime(year: 2025, month: 8, day: 1),
)[]

#session(
  <25-09-22>,
  title: [Weatherby on language machines],
  reading: ((<weatherbyLanguageMachinesCultural2025>, "pp.1-40"),),
  authors: (<weatherby-leif>,),
  updated: datetime(year: 2025, month: 9, day: 22),
)[
  We were lucky to have @maths:weatherby-leif present.

  Introduced by @maths:stewart-william.
]

#session(
  <25-10-06>,
  title: [Castelle on high-dimensional communication],
  reading: (<castelleContextualizingHighDimensionalCommunication2025>,),
  authors: (<castelle-michael>,),
  updated: datetime(year: 2025, month: 10, day: 6),
)[]

#session(
  <25-10-19>,
  title: [Schmid on diagonal method and dialectical logic],
  reading: (<schmidDiagonalMethodDialectical2025>,),
  authors: (<schmid-eric>,),
  updated: datetime(year: 2025, month: 10, day: 19),
)[]

#session(
  <25-11-24>,
  title: [Miller on suture],
  reading: (<millerSutureElementsLogic1977>,),
  authors: (<miller-jacques>,),
  updated: datetime(year: 2025, month: 11, day: 24),
)[]

#session(
  <25-12-08>,
  title: [Naderi on mark and lack],
  reading: (<naderiMarkLackFormalism2018>,),
  authors: (<naderi-reza>,),
  updated: datetime(year: 2025, month: 12, day: 8),
)[]

#session(
  <26-01-23>,
  title: [Von Foerster on understanding understanding],
  reading: (
    (<vonfoersterUnderstandingUnderstandingEssays2003>, "pp.1-20, 247-261"),
  ),
  authors: (<vonfoerster-heinz>,),
  updated: datetime(year: 2026, month: 1, day: 23),
)[]

#session(
  <26-02-10>,
  title: [Longo on the constructed objectivity of mathematics],
  reading: (<longoConstructedObjectivityMathematics2003>,),
  authors: (<longo-giuseppe>,),
  updated: datetime(year: 2026, month: 2, day: 10),
)[]

#session(
  <26-03-06>,
  title: [Husserl on the origin of geometry],
  reading: (<husserlOriginGeometry1970>,),
  authors: (<husserl-edmund>,),
  updated: datetime(year: 2026, month: 3, day: 6),
)[]

#session(
  <26-03-27>,
  title: [Benacerraf on what numbers could not be],
  reading: (<benacerrafWhatNumbersCould1965>,),
  authors: (<benacerraf-paul>,),
  updated: datetime(year: 2026, month: 3, day: 27),
)[]

#session(
  <26-04-10>,
  title: [Avigad on mathematicians in the age of AI],
  reading: (<avigadMathematiciansAgeAI2026>,),
  authors: (<avigad-jeremy>,),
  updated: datetime(year: 2026, month: 4, day: 10),
)[]

#session(
  <26-05-01>,
  title: [Henkle on the ontology of number],
  reading: (<henkleOntologyNumberLimits2026>,),
  authors: (<henkle-jonah>,),
  updated: datetime(year: 2026, month: 5, day: 1),
)[]

#session(
  <26-06-08>,
  title: [Atiyah on mathematics in the 20th century],
  reading: (<atiyahMathematics20thCentury2002>,),
  authors: (<atiyah-michael>,),
  updated: datetime(year: 2026, month: 6, day: 8),
)[]

#session(
  <26-06-22>,
  title: [Meli on Newton versus Leibniz],
  reading: (<meliEquivalencePriorityNewton1993>,),
  authors: (<meli-domenico>,),
  updated: datetime(year: 2026, month: 6, day: 22),
)[]

#session(
  <26-07-06>,
  title: [Bernoulli on hydrodynamics],
  reading: (<bernoulliHydrodynamics1968>,),
  authors: (<bernoulli-daniel>, <bernoulli-johann>),
  updated: datetime(year: 2026, month: 7, day: 6),
)[]

#session(
  <26-07-20>,
  title: [Deringer on political calculations],
  reading: (<deringerIntroductionPoliticalCalculations2018>,),
  authors: (<deringer-william>,),
  updated: datetime(year: 2026, month: 7, day: 20),
)[]

#session(
  <26-08-03>,
  title: [Gray and Poincaré on counter-modernism],
  reading: (
    <grayPoincareCountermodernism2022>,
    <poincareFoundationsScienceScience2022>,
  ),
  authors: (<jeremy-gray>, <poincare-henri>),
  updated: datetime(year: 2026, month: 8, day: 3),
)[]

#session(
  <26-08-31>,
  title: [Jing on algorithm],
  reading: (<jingAlgorithm2026>,),
  authors: (<jing-felicia>,),
  updated: datetime(year: 2026, month: 8, day: 31),
)[
  We were lucky to have @maths:jing-felicia as a participant.

  Introduced by @maths:kermode-lachlan.

  #window(<algorithmic-materiality>, folded: false)
]

#session(
  <26-09-30>,
  title: [Handelman on the mathematical imagination],
  reading: (<handelmanMathematicalImaginationOrigins2019>,),
  authors: (<handelman-matthew>,),
  updated: datetime(year: 2026, month: 9, day: 30),
)[]

#session(
  <26-09-16>,
  title: [James on vectors from Leibniz to Einstein],
  reading: (<jamesVectorsLeibnizEinstein2023>,),
  authors: (<propp-james>,),
  updated: datetime(year: 2026, month: 9, day: 16),
)[]
