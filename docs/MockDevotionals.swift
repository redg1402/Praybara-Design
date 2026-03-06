// MockDevotionals.swift
// Praybara — Mock Devotional Content

import Foundation

struct MockDevotionals {

    static let today = DailyDevotional(
        date: Date(),
        title: "Confianza en tiempos difíciles",
        scripture: BibleVerse(
            book: "Filipenses", chapter: 4, verse: 6,
            text: "Por nada estéis afanosos, sino sean conocidas vuestras peticiones delante de Dios en toda oración y ruego, con acción de gracias.",
            translation: .rvr60
        ),
        reflection: """
        Hay momentos en la vida donde el peso de las circunstancias parece aplastante. El trabajo, la familia, las deudas, la salud — todo al mismo tiempo. Y en medio de ese tornado, Dios nos dice algo radical: no se preocupen.

        No como quien dice "no importa", sino como quien dice "yo tengo esto".

        Pablo escribió estas palabras desde una cárcel romana. No desde un retiro espiritual en las montañas. Desde cadenas. Y aun así, la paz que describe no es la ausencia de problemas — es una presencia tan real que sobrepasa todo entendimiento humano.

        La invitación hoy es simple: llevar cada preocupación a Dios en oración específica. No en general. No "Señor ayúdame con todo". Sino nombrar cada cosa, confiarla, y luego soltarla.

        Esa es la fe práctica. No negación de la realidad, sino entrega activa al Dios que controla lo que nosotros no podemos.
        """,
        prayerPrompt: "Señor, hoy te entrego específicamente: ___. Confío en que Tú tienes el control. Que tu paz guarde mi corazón y mi mente en Cristo Jesús.",
        estimatedMinutes: 8,
        isCompleted: false,
        theme: .peace
    )

    static let all: [DailyDevotional] = [
        today,
        DailyDevotional(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            title: "El poder de la gratitud",
            scripture: BibleVerse(
                book: "1 Tesalonicenses", chapter: 5, verse: 18,
                text: "Dad gracias en todo, porque esta es la voluntad de Dios para con vosotros en Cristo Jesús.",
                translation: .rvr60
            ),
            reflection: """
            La gratitud no es un sentimiento que esperamos tener — es una práctica que decidimos cultivar.

            Cuando Pablo dice "en todo", no habla de "por todo". No hay que dar gracias por el dolor. Hay que dar gracias en medio de él. Es una diferencia que cambia todo.

            Cuando decidimos buscar activamente qué agradecer antes de ver el resultado, algo comienza a cambiar en nuestra perspectiva. Los ojos se entrenan para ver lo que Dios ya está haciendo.
            """,
            prayerPrompt: "Señor, hoy quiero agradecerte por tres cosas específicas en mi vida: ___",
            estimatedMinutes: 6,
            isCompleted: true,
            theme: .gratitude
        ),
        DailyDevotional(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            title: "Fe que mueve montañas",
            scripture: BibleVerse(
                book: "Marcos", chapter: 11, verse: 24,
                text: "Por tanto, os digo que todo lo que pidiereis orando, creed que lo recibiréis, y os vendrá.",
                translation: .rvr60
            ),
            reflection: """
            La fe bíblica no es optimismo. No es pensar positivo. Es una confianza fundamentada en el carácter de Dios.

            Jesús no les dijo a sus discípulos que creyeran en sus propias capacidades. Les dijo que creyeran en Dios. La oración eficaz no viene de la intensidad emocional sino de la confianza en Quien escucha.

            Hoy, ¿hay algo que has dejado de pedir porque ya no crees que es posible?
            """,
            prayerPrompt: "Señor, hoy creo que Tú puedes hacer ___ en mi vida. Aumenta mi fe donde flaquea.",
            estimatedMinutes: 10,
            isCompleted: true,
            theme: .faith
        ),
        DailyDevotional(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            title: "Intimidad con el Padre",
            scripture: BibleVerse(
                book: "Salmos", chapter: 27, verse: 4,
                text: "Una cosa he demandado al Señor, ésta buscaré; que esté yo en la casa del Señor todos los días de mi vida, para contemplar la hermosura del Señor, y para inquirir en su templo.",
                translation: .rvr60
            ),
            reflection: """
            David tenía una sola petición. No era prosperidad, no era victorias militares, no era larga vida. Era presencia. Estar con Dios.

            En un mundo que nos empuja hacia más producción, más rendimiento, más resultados — la vida espiritual nos llama a detenernos y simplemente estar.

            ¿Cuándo fue la última vez que pasaste tiempo con Dios sin pedir nada? Solo contemplando.
            """,
            prayerPrompt: "Señor, hoy no vengo con lista de peticiones. Solo vengo a estar contigo. Habla a mi corazón.",
            estimatedMinutes: 7,
            isCompleted: true,
            theme: .love
        )
    ]
}
