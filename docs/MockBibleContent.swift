// MockBibleContent.swift
// Praybara — Mock Bible Verses, Chapters & Reading Plans

import Foundation

struct MockBibleContent {

    // MARK: - Verse of the Day
    static let verseOfTheDay = BibleVerse(
        book: "Filipenses", chapter: 4, verse: 13,
        text: "Todo lo puedo en Cristo que me fortalece.",
        translation: .rvr60
    )

    static let recentVerses: [BibleVerse] = [
        BibleVerse(book: "Salmos", chapter: 23, verse: 1,
                   text: "El Señor es mi pastor; nada me faltará.",
                   translation: .rvr60),
        BibleVerse(book: "Jeremías", chapter: 29, verse: 11,
                   text: "Porque yo sé los pensamientos que tengo acerca de vosotros, dice el Señor, pensamientos de paz y no de mal, para daros el fin que esperáis.",
                   translation: .rvr60),
        BibleVerse(book: "Isaías", chapter: 40, verse: 31,
                   text: "Pero los que esperan en el Señor renovarán sus fuerzas; levantarán las alas como las águilas; correrán y no se cansarán; caminarán y no se fatigarán.",
                   translation: .rvr60),
        BibleVerse(book: "Proverbios", chapter: 3, verse: 5,
                   text: "Confía en el Señor con todo tu corazón, y no te apoyes en tu propio entendimiento.",
                   translation: .rvr60),
        BibleVerse(book: "Romanos", chapter: 8, verse: 28,
                   text: "Y sabemos que a los que aman a Dios, todas las cosas les ayudan a bien.",
                   translation: .rvr60),
        BibleVerse(book: "Juan", chapter: 3, verse: 16,
                   text: "Porque de tal manera amó Dios al mundo, que ha dado a su Hijo unigénito, para que todo aquel que en él cree, no se pierda, mas tenga vida eterna.",
                   translation: .rvr60),
        BibleVerse(book: "Mateo", chapter: 6, verse: 33,
                   text: "Mas buscad primeramente el reino de Dios y su justicia, y todas estas cosas os serán añadidas.",
                   translation: .rvr60)
    ]

    // MARK: - Active Reading Plan
    static let activePlan = ReadingPlan(
        title: "NT en 90 Días",
        description: "Recorre el Nuevo Testamento completo con lecturas diarias guiadas. Desde Mateo hasta Apocalipsis en 90 días de encuentro profundo con la palabra.",
        totalDays: 90, currentDay: 38,
        coverGradientColors: ["#1B3A6B", "#4A90D9"],
        category: .newTestament
    )

    // MARK: - All Reading Plans
    static let allPlans: [ReadingPlan] = [
        ReadingPlan(
            title: "NT en 90 Días",
            description: "Recorre el Nuevo Testamento completo con lecturas diarias guiadas.",
            totalDays: 90, currentDay: 38,
            coverGradientColors: ["#1B3A6B", "#4A90D9"],
            category: .newTestament
        ),
        ReadingPlan(
            title: "Salmos y Proverbios",
            description: "Sabiduría y adoración para cada día del mes.",
            totalDays: 60, currentDay: 12,
            coverGradientColors: ["#E8B86D", "#C8923A"],
            category: .psalms
        ),
        ReadingPlan(
            title: "Los 4 Evangelios",
            description: "La vida y enseñanzas de Jesús en profundidad.",
            totalDays: 45, currentDay: 0,
            coverGradientColors: ["#5A9E7C", "#2D6B50"],
            category: .gospels
        ),
        ReadingPlan(
            title: "Estudio Profundo: Romanos",
            description: "Teología fundamental para crecer en la fe reformada.",
            totalDays: 30, currentDay: 0,
            coverGradientColors: ["#6B4B8A", "#9B6BBE"],
            isSubscriberOnly: true,
            category: .deepStudy
        ),
        ReadingPlan(
            title: "21 Días con los Salmos",
            description: "Adoración y oración guiada a través de los Salmos más amados.",
            totalDays: 21, currentDay: 0,
            coverGradientColors: ["#C97B8A", "#A84A60"],
            category: .psalms
        ),
        ReadingPlan(
            title: "Fundamentos de la Fe",
            description: "Para nuevos creyentes — las bases del evangelio explicadas con claridad.",
            totalDays: 14, currentDay: 0,
            coverGradientColors: ["#4A90D9", "#1B3A6B"],
            category: .foundations
        ),
        ReadingPlan(
            title: "El Sermón del Monte",
            description: "30 días profundizando en las enseñanzas centrales de Jesús en Mateo 5–7.",
            totalDays: 30, currentDay: 0,
            coverGradientColors: ["#F0A030", "#C8923A"],
            isSubscriberOnly: true,
            category: .deepStudy
        )
    ]

    // MARK: - Today's Chapter
    static let todayChapter = BibleChapter(
        book: "Juan",
        chapter: 14,
        translation: .rvr60,
        verses: [
            BibleVerse(book: "Juan", chapter: 14, verse: 1,
                       text: "No se turbe vuestro corazón; creéis en Dios, creed también en mí.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 2,
                       text: "En la casa de mi Padre muchas moradas hay; si así no fuera, yo os lo hubiera dicho; voy, pues, a preparar lugar para vosotros.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 3,
                       text: "Y si me fuere y os preparare lugar, vendré otra vez, y os tomaré a mí mismo, para que donde yo estoy, vosotros también estéis.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 4,
                       text: "Y sabéis a dónde voy, y sabéis el camino.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 5,
                       text: "Le dijo Tomás: Señor, no sabemos a dónde vas; ¿cómo, pues, podemos saber el camino?",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 6,
                       text: "Jesús le dijo: Yo soy el camino, y la verdad, y la vida; nadie viene al Padre, sino por mí.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 15,
                       text: "Si me amáis, guardad mis mandamientos.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 16,
                       text: "Y yo rogaré al Padre, y os dará otro Consolador, para que esté con vosotros para siempre.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 26,
                       text: "Mas el Consolador, el Espíritu Santo, a quien el Padre enviará en mi nombre, él os enseñará todas las cosas, y os recordará todo lo que yo os he dicho.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 27,
                       text: "La paz os dejo, mi paz os doy; yo no os la doy como el mundo la da. No se turbe vuestro corazón, ni tenga miedo.",
                       translation: .rvr60)
        ]
    )
}

// MARK: - BibleChapter Model (add to Models.swift if not present)
struct BibleChapter: Identifiable {
    var id: UUID = UUID()
    var book: String
    var chapter: Int
    var translation: BibleTranslation
    var verses: [BibleVerse]
    var title: String { "\(book) \(chapter)" }
    var subtitle: String { "\(verses.count) versículos · \(translation.rawValue)" }
}
