#import "template.typ": template
#import "@rheo/rookery:0.4.0": idea

// A listing vertebra, not a single post — excluded from the feed exactly as
// about.typ and index.typ are. Each session still gets its own feed-worthy
// unit of meaning, it is just no longer a discrete Atom entry (see the
// session-consolidation discussion: rheo has no mechanism to date a
// marrow-minted idea page in the feed, so per-session feed entries are gone).
#let rheo-feed-exclude = true
#let session(tags: (), ..args) = idea(tags: ("session",) + tags, ..args)

#set document(title: [Sessions])
#show: template.with(current-page: "sessions")

#session(<24-06-21>, title: [Pourciau on number and the digital ocean], updated: datetime(
  year: 2024,
  month: 6,
  day: 21,
))[
  == 21 June 2024

  @pourciauLogosAnomalousEpisode2019 and @pourciauDigitalOcean2022
]

#session(<24-07-12>, title: [Aaronson on computational complexity], updated: datetime(year: 2024, month: 7, day: 12))[
  == 12 July 2024

  @aaronsonWhyPhilosophersShould2013
]

#session(<24-07-26>, title: [Thurston on proof and progress], updated: datetime(year: 2024, month: 7, day: 26))[
  == 26 July 2024

  @thurstonProofProgressMathematics2006
]

#session(<24-08-09>, title: [Von Neumann on the mathematician], updated: datetime(year: 2024, month: 8, day: 9))[
  == 9 August 2024

  @vonneumannMathematician1947
]

#session(<24-08-30>, title: [Gray on the modernist transformation of mathematics], updated: datetime(
  year: 2024,
  month: 8,
  day: 30,
))[
  == 30 August 2024

  @grayPlatosGhostModernist2008[pp.18-38]
]

#session(<24-09-19>, title: [Turing on thinking machines], updated: datetime(year: 2024, month: 9, day: 19))[
  == 19 September 2024

  @turingIntelligentMachineryHeretical2004 and @turingCanDigitalComputers2004
]

#session(<24-10-04>, title: [Peirce on the elements of logic], updated: datetime(year: 2024, month: 10, day: 4))[
  == 4 October 2024

  @peirceElementsLogic1974[pp.134-173]
]

#session(<24-10-17>, title: [Babbage on the economy of machinery], updated: datetime(year: 2024, month: 10, day: 17))[
  == 17 October 2024

  @babbageEconomyMachineryManufactures1832[pp.i-50]
]

#session(<24-11-15>, title: [Joque on revolutionary mathematics (cancelled)], updated: datetime(
  year: 2024,
  month: 11,
  day: 15,
))[
  == 15 November 2024

  @joqueRevolutionaryMathematicsArtificial2022
]

#session(<25-01-24>, title: [Serres on the history of scientific thought], updated: datetime(
  year: 2025,
  month: 1,
  day: 24,
))[
  == 24 January 2025

  @serresIntroduction1995
]

#session(<25-02-06>, title: [Hörl on sacred channels], updated: datetime(year: 2025, month: 2, day: 6))[
  == 6 February 2025

  @horlSacredChannelsArchaic2018[pp.89-108]
]

#session(<25-02-20>, title: [Krieger on convention in statistics], updated: datetime(year: 2025, month: 2, day: 20))[
  == 20 February 2025

  @kriegerConventionHowMeans2015
]

#session(<25-03-07>, title: [Vasiliev on imaginary logic], updated: datetime(year: 2025, month: 3, day: 7))[
  == 7 March 2025

  @vasilievImaginaryNonaristotelianLogic1925
]

#session(<25-04-03>, title: [Marx's mathematical manuscripts], updated: datetime(year: 2025, month: 4, day: 3))[
  == 3 April 2025

  @marxMathematicalManuscriptsKarl1983[pp.109-119]
]

#session(<25-04-17>, title: [Warwick on Cambridge mathematical physics], updated: datetime(
  year: 2025,
  month: 4,
  day: 17,
))[
  == 17 April 2025

  @warwickMastersTheoryCambridge2003[pp.ix-xi, 212-226]
]

#session(<25-05-01>, title: [Rodin on categorial logic and Hegelian dialectics], updated: datetime(
  year: 2025,
  month: 5,
  day: 1,
))[
  == 1 May 2025

  @rodinCategorialLogicHegelian2013
]

#session(<25-05-15>, title: [Marx on the myth of the Martians], updated: datetime(year: 2025, month: 5, day: 15))[
  == 15 May 2025

  @marxMythMartiansGolden1996
]

#session(<25-06-12>, title: [Steingart on axiomatics and high modernism], updated: datetime(
  year: 2025,
  month: 6,
  day: 12,
))[
  == 12 June 2025

  @steingartAxiomaticsMathematicalThought2023[pp.1-24]
]

#session(<25-07-03>, title: [Mazzotti on reactionary mathematics], updated: datetime(year: 2025, month: 7, day: 3))[
  == 3 July 2025

  @mazzottiReactionaryMathematicsGenealogy2023[pp.128-146]
]

#session(<25-07-18>, title: [Berkeley's Analyst], updated: datetime(year: 2025, month: 7, day: 18))[
  == 18 July 2025

  @berkeleyAnalystDiscourseAddressed1754
]

#session(<25-08-01>, title: [Mehrtens on nationalism and internationalism], updated: datetime(
  year: 2025,
  month: 8,
  day: 1,
))[
  == 1 August 2025

  @mehrtensNationalismInternationalism1996
]

#session(<25-09-22>, title: [Weatherby on language machines], updated: datetime(year: 2025, month: 9, day: 22))[
  == 22 September 2025

  @weatherbyLanguageMachinesCultural2025[pp.1-40]
]

#session(<25-10-06>, title: [Castelle on high-dimensional communication], updated: datetime(
  year: 2025,
  month: 10,
  day: 6,
))[
  == 6 October 2025

  @castelleContextualizingHighDimensionalCommunication2025
]

#session(<25-10-19>, title: [Schmid on diagonal method and dialectical logic], updated: datetime(
  year: 2025,
  month: 10,
  day: 19,
))[
  == 19 October 2025

  @schmidDiagonalMethodDialectical2025
]

#session(<25-11-24>, title: [Miller on suture], updated: datetime(year: 2025, month: 11, day: 24))[
  == 24 November 2025

  @millerSutureElementsLogic1977
]

#session(<25-12-08>, title: [Naderi on mark and lack], updated: datetime(year: 2025, month: 12, day: 8))[
  == 8 December 2025

  @naderiMarkLackFormalism2018
]

#session(<26-01-23>, title: [Von Foerster on understanding understanding], updated: datetime(
  year: 2026,
  month: 1,
  day: 23,
))[
  == 23 January 2026

  @vonfoersterUnderstandingUnderstandingEssays2003[pp.1-20, 247-261]
]

#session(<26-02-10>, title: [Longo on the constructed objectivity of mathematics], updated: datetime(
  year: 2026,
  month: 2,
  day: 10,
))[
  == 10 February 2026

  @longoConstructedObjectivityMathematics2003
]

#session(<26-03-06>, title: [Husserl on the origin of geometry], updated: datetime(year: 2026, month: 3, day: 6))[
  == 6 March 2026

  @husserlOriginGeometry1970
]

#session(<26-03-27>, title: [Benacerraf on what numbers could not be], updated: datetime(
  year: 2026,
  month: 3,
  day: 27,
))[
  == 27 March 2026

  @benacerrafWhatNumbersCould1965
]

#session(<26-04-10>, title: [Avigad on mathematicians in the age of AI], updated: datetime(
  year: 2026,
  month: 4,
  day: 10,
))[
  == 10 April 2026

  @avigadMathematiciansAgeAI2026
]

#session(<26-05-01>, title: [Henkle on the ontology of number], updated: datetime(year: 2026, month: 5, day: 1))[
  == 1 May 2026

  @henkleOntologyNumberLimits2026
]

#session(<26-06-08>, title: [Atiyah on mathematics in the 20th century], updated: datetime(
  year: 2026,
  month: 6,
  day: 8,
))[
  == 8 June 2026

  @atiyahMathematics20thCentury2002
]

#session(<26-06-22>, title: [Meli on Newton versus Leibniz], updated: datetime(year: 2026, month: 6, day: 22))[
  == 22 June 2026

  @meliEquivalencePriorityNewton1993
]

#session(<26-07-06>, title: [Bernoulli on hydrodynamics], updated: datetime(year: 2026, month: 7, day: 6))[
  == 6 July 2026

  @bernoulliHydrodynamics1968
]

#session(<26-07-20>, title: [Deringer on political calculations], updated: datetime(year: 2026, month: 7, day: 20))[
  == 20 July 2026

  @deringerIntroductionPoliticalCalculations2018
]

#session(<26-08-03>, title: [Gray and Poincaré on counter-modernism], updated: datetime(year: 2026, month: 8, day: 3))[
  == 3 August 2026

  @grayPoincareCountermodernism2022 and @poincareFoundationsScienceScience2022
]
