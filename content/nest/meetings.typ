#import "template.typ": session, template

// THE REGISTER of every session the group has held, and the only place they are
// declared. A note renders where it is declared, so the page a reader browses is
// `sessions.typ`, which transcludes these by tag.
//
// Each session hatched below is also a feed entry — see `#session` in template.typ.

#set document(title: [Meetings])
#show: template.with(current-page: "nest:meetings")

#session(<24-06-21>, title: [Pourciau on number and the digital ocean], authors: (<sarah-pourciau>,), updated: datetime(
  year: 2024,
  month: 6,
  day: 21,
))[
  == 21 June 2024

  @idea:pourciauLogosAnomalousEpisode2019 and @idea:pourciauDigitalOcean2022
]

#session(<24-07-12>, title: [Aaronson on computational complexity], authors: (<aaron-scott>,), updated: datetime(year: 2024, month: 7, day: 12))[
  == 12 July 2024

  @idea:aaronsonWhyPhilosophersShould2013
]

#session(<24-07-26>, title: [Thurston on proof and progress], authors: (<thurston-william>,), updated: datetime(year: 2024, month: 7, day: 26))[
  == 26 July 2024

  @idea:thurstonProofProgressMathematics2006
]

#session(<24-08-09>, title: [Von Neumann on the mathematician], authors: (<vonneumann-john>,), updated: datetime(year: 2024, month: 8, day: 9))[
  == 9 August 2024

  @idea:vonneumannMathematician1947
]

#session(<24-08-30>, title: [Gray on the modernist transformation of mathematics], authors: (<jeremy-gray>,), updated: datetime(
  year: 2024,
  month: 8,
  day: 30,
))[
  == 30 August 2024

  @grayPlatosGhostModernist2008[pp.18-38]
]

#session(<24-09-19>, title: [Turing on thinking machines], authors: (<turing-alan>,), updated: datetime(year: 2024, month: 9, day: 19))[
  == 19 September 2024

  @idea:turingIntelligentMachineryHeretical2004 and @idea:turingCanDigitalComputers2004
]

#session(<24-10-04>, title: [Peirce on the elements of logic], authors: (<peirce-charles>,), updated: datetime(year: 2024, month: 10, day: 4))[
  == 4 October 2024

  @peirceElementsLogic1974[pp.134-173]
]

#session(<24-10-17>, title: [Babbage on the economy of machinery], authors: (<babbage-charles>,), updated: datetime(year: 2024, month: 10, day: 17))[
  == 17 October 2024

  @babbageEconomyMachineryManufactures1832[pp.i-50]
]

#session(<24-11-15>, title: [Joque on revolutionary mathematics (cancelled)], authors: (<joque-justin>,), updated: datetime(
  year: 2024,
  month: 11,
  day: 15,
))[
  == 15 November 2024

  @idea:joqueRevolutionaryMathematicsArtificial2022
]

#session(<25-01-24>, title: [Serres on the history of scientific thought], authors: (<serres-michel>,), updated: datetime(
  year: 2025,
  month: 1,
  day: 24,
))[
  == 24 January 2025

  @idea:serresIntroduction1995
]

#session(<25-02-06>, title: [Hörl on sacred channels], authors: (<horl-erich>,), updated: datetime(year: 2025, month: 2, day: 6))[
  == 6 February 2025

  @horlSacredChannelsArchaic2018[pp.89-108]
]

#session(<25-02-20>, title: [Krieger on convention in statistics], authors: (<krieger-martin>,), updated: datetime(year: 2025, month: 2, day: 20))[
  == 20 February 2025

  @idea:kriegerConventionHowMeans2015
]

#session(<25-03-07>, title: [Vasiliev on imaginary logic], authors: (<vasilie-na-a>,), updated: datetime(year: 2025, month: 3, day: 7))[
  == 7 March 2025

  @idea:vasilievImaginaryNonaristotelianLogic1925
]

#session(<25-04-03>, title: [Marx's mathematical manuscripts], authors: (<marx-karl>,), updated: datetime(year: 2025, month: 4, day: 3))[
  == 3 April 2025

  @marxMathematicalManuscriptsKarl1983[pp.109-119]
]

#session(<25-04-17>, title: [Warwick on Cambridge mathematical physics], authors: (<warwick-andrew>,), updated: datetime(
  year: 2025,
  month: 4,
  day: 17,
))[
  == 17 April 2025

  @warwickMastersTheoryCambridge2003[pp.ix-xi, 212-226]
]

#session(<25-05-01>, title: [Rodin on categorial logic and Hegelian dialectics], authors: (<rodin-andrei>,), updated: datetime(
  year: 2025,
  month: 5,
  day: 1,
))[
  == 1 May 2025

  @idea:rodinCategorialLogicHegelian2013
]

#session(<25-05-15>, title: [Marx on the myth of the Martians], authors: (<marx-george>,), updated: datetime(year: 2025, month: 5, day: 15))[
  == 15 May 2025

  @idea:marxMythMartiansGolden1996
]

#session(<25-06-12>, title: [Steingart on axiomatics and high modernism], authors: (<steingart-alma>,), updated: datetime(
  year: 2025,
  month: 6,
  day: 12,
))[
  == 12 June 2025

  @steingartAxiomaticsMathematicalThought2023[pp.1-24]
]

#session(<25-07-03>, title: [Mazzotti on reactionary mathematics], authors: (<mazzotti-massimo>,), updated: datetime(year: 2025, month: 7, day: 3))[
  == 3 July 2025

  @mazzottiReactionaryMathematicsGenealogy2023[pp.128-146]
]

#session(<25-07-18>, title: [Berkeley's Analyst], authors: (<berkeley-george>,), updated: datetime(year: 2025, month: 7, day: 18))[
  == 18 July 2025

  @idea:berkeleyAnalystDiscourseAddressed1754
]

#session(<25-08-01>, title: [Mehrtens on nationalism and internationalism], authors: (<herbert-mehrtens>,), updated: datetime(
  year: 2025,
  month: 8,
  day: 1,
))[
  == 1 August 2025

  @idea:mehrtensNationalismInternationalism1996
]

#session(<25-09-22>, title: [Weatherby on language machines], authors: (<weatherby-leif>,), updated: datetime(year: 2025, month: 9, day: 22))[
  == 22 September 2025

  @weatherbyLanguageMachinesCultural2025[pp.1-40]
]

#session(<25-10-06>, title: [Castelle on high-dimensional communication], authors: (<castelle-michael>,), updated: datetime(
  year: 2025,
  month: 10,
  day: 6,
))[
  == 6 October 2025

  @idea:castelleContextualizingHighDimensionalCommunication2025
]

#session(<25-10-19>, title: [Schmid on diagonal method and dialectical logic], authors: (<schmid-eric>,), updated: datetime(
  year: 2025,
  month: 10,
  day: 19,
))[
  == 19 October 2025

  @idea:schmidDiagonalMethodDialectical2025
]

#session(<25-11-24>, title: [Miller on suture], authors: (<miller-jacques>,), updated: datetime(year: 2025, month: 11, day: 24))[
  == 24 November 2025

  @idea:millerSutureElementsLogic1977
]

#session(<25-12-08>, title: [Naderi on mark and lack], authors: (<naderi-reza>,), updated: datetime(year: 2025, month: 12, day: 8))[
  == 8 December 2025

  @idea:naderiMarkLackFormalism2018
]

#session(<26-01-23>, title: [Von Foerster on understanding understanding], authors: (<vonfoerster-heinz>,), updated: datetime(
  year: 2026,
  month: 1,
  day: 23,
))[
  == 23 January 2026

  @vonfoersterUnderstandingUnderstandingEssays2003[pp.1-20, 247-261]
]

#session(<26-02-10>, title: [Longo on the constructed objectivity of mathematics], authors: (<longo-giuseppe>,), updated: datetime(
  year: 2026,
  month: 2,
  day: 10,
))[
  == 10 February 2026

  @idea:longoConstructedObjectivityMathematics2003
]

#session(<26-03-06>, title: [Husserl on the origin of geometry], authors: (<husserl-edmund>,), updated: datetime(year: 2026, month: 3, day: 6))[
  == 6 March 2026

  @idea:husserlOriginGeometry1970
]

#session(<26-03-27>, title: [Benacerraf on what numbers could not be], authors: (<benacerraf-paul>,), updated: datetime(
  year: 2026,
  month: 3,
  day: 27,
))[
  == 27 March 2026

  @idea:benacerrafWhatNumbersCould1965
]

#session(<26-04-10>, title: [Avigad on mathematicians in the age of AI], authors: (<avigad-jeremy>,), updated: datetime(
  year: 2026,
  month: 4,
  day: 10,
))[
  == 10 April 2026

  @idea:avigadMathematiciansAgeAI2026
]

#session(<26-05-01>, title: [Henkle on the ontology of number], authors: (<henkle-jonah>,), updated: datetime(year: 2026, month: 5, day: 1))[
  == 1 May 2026

  @idea:henkleOntologyNumberLimits2026
]

#session(<26-06-08>, title: [Atiyah on mathematics in the 20th century], authors: (<atiyah-michael>,), updated: datetime(
  year: 2026,
  month: 6,
  day: 8,
))[
  == 8 June 2026

  @idea:atiyahMathematics20thCentury2002
]

#session(<26-06-22>, title: [Meli on Newton versus Leibniz], authors: (<meli-domenico>,), updated: datetime(year: 2026, month: 6, day: 22))[
  == 22 June 2026

  @idea:meliEquivalencePriorityNewton1993
]

#session(<26-07-06>, title: [Bernoulli on hydrodynamics], authors: (<bernoulli-daniel>, <bernoulli-johann>), updated: datetime(year: 2026, month: 7, day: 6))[
  == 6 July 2026

  @idea:bernoulliHydrodynamics1968
]

#session(<26-07-20>, title: [Deringer on political calculations], authors: (<deringer-william>,), updated: datetime(year: 2026, month: 7, day: 20))[
  == 20 July 2026

  @idea:deringerIntroductionPoliticalCalculations2018
]

#session(<26-08-03>, title: [Gray and Poincaré on counter-modernism], authors: (<jeremy-gray>, <poincare-henri>), updated: datetime(year: 2026, month: 8, day: 3))[
  == 3 August 2026

  @idea:grayPoincareCountermodernism2022 and @idea:poincareFoundationsScienceScience2022
]

#session(<26-08-31>, title: [Jing on algorithm], authors: (<jing-felicia>,), updated: datetime(year: 2026, month: 8, day: 31))[
  == 31 August 2026

  @idea:jingAlgorithm2026
]
