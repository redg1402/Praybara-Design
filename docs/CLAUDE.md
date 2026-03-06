# CLAUDE.md — Praybara iOS App
# Read this file completely before writing any code, designing any screen, or making any decision.
# This is the single source of truth for the entire project.

---

## 0. TEAM ROLES & SCOPE — READ THIS FIRST

### Who you are working with
The person directing this project is a **product designer**, not a developer. Their responsibilities are:
- Visual design and UX decisions
- Defining what screens look like and how they feel
- Choosing design tokens, layouts, and interaction patterns
- Reviewing and approving built screens

### What Claude Code is responsible for
Claude Code is the **frontend engineer** on this project. Responsibilities are:
- Translating design decisions into working SwiftUI code
- Building all screens, components, and animations
- Maintaining the design system in code
- Keeping the mock data layer populated so every screen is visually complete
- Never building backend, APIs, authentication, or database logic

### What is explicitly OUT OF SCOPE
- No backend code (Supabase, Firebase, REST APIs, GraphQL)
- No authentication flows (login/signup server calls)
- No real API integration (Bible APIs, push notification servers, payment processing)
- No database migrations or server-side logic
- No DevOps, CI/CD, or deployment configuration

A separate backend developer will handle all of the above. When a screen requires data that would normally come from an API, **always use the MockDataService** (see Section 3). Never leave screens empty or show placeholder text like "TODO" — the prototype must always look and feel complete with realistic data.

### The golden rule
**Every screen must be visually complete at all times.** The designer needs to see exactly what the final product will look like. Use mock data to make every feature appear fully functional. A screen with empty states or lorem ipsum is not acceptable for prototype review.

---

## 1. WHAT IS PRAYBARA

Praybara is a **native iOS Christian spiritual companion app** built entirely in SwiftUI for the Apple ecosystem (iOS 17+, iPhone-first). It helps believers build consistent spiritual disciplines through daily devotionals, guided Bible reading plans, prayer journaling, habit tracking, and church community.

**Name origin:** "Pray" + "bara" (Hebrew: בָּרָא — "to create / bring into being")
**Market:** Latin America, Spanish-speaking Christians, ages 21–55
**Tone:** Intimate, sacred, personal — never corporate, never preachy, never generic

---

## 2. SURVEY INSIGHTS — 30 RESPONDENTS (The Foundation of Every Decision)

This app was designed based on a real user survey. Every UI decision, feature priority, and tone comes from these responses. Always refer back to this data when making design or content choices.

### 2.1 Who These Users Are

**Spiritual maturity:**
- 40% Líderes / servidores activos
- 30% Creyentes maduros
- 23% Creyentes en crecimiento
- 7% Nuevos creyentes

**Age:**
- 30% aged 21–30
- 30% aged 31–40
- 27% aged 41–55
- 13% aged 56+

**Tradition:**
- 67% Evangelical / Protestant
- 27% Catholic
- 6% Charismatic / other

**Church participation:**
- 57% attend weekly
- 23% attend occasionally
- 20% not currently attending

**Primary persona:** Active Christian leader, 25–40 years old, evangelical, seeks depth not surface, frustrated by their own inconsistency more than anything external.

---

### 2.2 The Real Pain (Verbatim Responses)

> "La disciplina espiritual diaria con mi devocional y oración, quitar las distracciones como celular y afanes de la vida y la guerra en mi mente"
> "Siento que el trabajo me ha robado el tiempo, lo he identificado y estoy trabajando en mejorar mi relación con el señor"
> "El enfoque, es un reto diario y para ello hacer mi devocional en más madrugadas es clave entre 4:30am a 5am"
> "Lucho por orar todos los días"
> "Me cuesta retener las escrituras, se me olvidan"
> "Escuchar la voz de Dios"
> "Tiempo de calidad"
> "La constancia"
> "no organizar el tiempo"
> "Pruebas muy fuertes sin percibir la voz de Dios"

**Key insight:** The #1 enemy is not lack of faith — it is **lack of structure and daily discipline**. Praybara must be a scaffold for discipline, not a replacement for faith.

**Blockers:**
- Falta de disciplina: 70%+
- Distracciones: 37%+
- No tengo un plan claro: significant minority
- Falta de motivación: notable

---

### 2.3 The ONE Problem To Solve (Verbatim)

> "Un plan claro para leer la biblia de manera cronológica"
> "Ayudarme a ser más disciplinada y organizada en mi tiempo devocional"
> "Planes de oración diaria"
> "Llevar un registro de mis devocionales diarios"
> "Profundidad, comentarios bíblicos, ir más allá de la simple lectura"
> "Motivar e inspirar con ayuda a situaciones del día a día"
> "Mayor accesibilidad y que tenga acceso a varias versiones y al origen"
> "Escuchar enseñanzas espirituales filtradas por pastores o tema"

**Design implication:** Home screen = daily mission briefing. Tell the user exactly what to do today, make it achievable in 5–10 min, celebrate when done.

---

### 2.4 Ideal Spiritual Life (Verbatim)

> "Iniciar el día con tiempo de oración, devocional, durante el día tiempos de pausa que podría transformar en oración, alabanza y adoración constante"
> "Un espacio de 1 hora o más, en ambiente tranquilo, sin interrupciones, música, lectura, oración, conexión"
> "Llena de mucha intimidad con Dios"
> "Tiempo de calidad, enfoque y profundidad"
> "Conectar con Dios a diario como mi mejor amigo"
> "Experimentar la plenitud de Dios en todas las áreas"

**Design implication:** UI must evoke a quiet, focused, intimate space. Dark mode = pre-dawn prayer time. Light mode = morning calm. Zero social media energy.

---

### 2.5 Competitor Analysis

- **YouVersion** — 13/19 users. Loved: plans, translations, audio. Hated: ads, aggressive paywall, shallow study
- **Glorify** — 2 users. Loved: thematic focus. Hated: paywall crept aggressively
- **Santa Biblia** — basic reader only, no discipline system

**Praybara's gaps to fill:**
1. Deep biblical study (commentary, context) — YouVersion is shallow
2. Personal discipline system tied to spiritual content
3. Price in local currency — "las actuales son demasiado costosas"
4. Zero ads — competitors break sacred atmosphere
5. Adaptive personalization by spiritual level

---

### 2.6 What Would Make Them Pay

> "Todas las herramientas: lectura bíblica, notas, música, planes, estudios y comentarios"
> "Estudios profundos certificados, journals que ayuden con disciplina espiritual e integral"
> "Niveles avanzados de aprendizaje y herramientas con IA"
> "Un valor alcanzable mensual porque las actuales son demasiado costosas"

**What Would Cancel Them:**
> "Que sea un producto para vender, se pierde el propósito"
> "Tanta publicidad barata y sin conexión espiritual"
> "Que no cumpla en agregar valor a mi vida devocional"
> "El precio, si es mala y se vive congelando la app"

---

### 2.7 Quantitative Data

| Metric | Result |
|--------|--------|
| Pray daily or multiple times/day | 77% |
| Read Bible via app | 60%+ |
| Follow a structured reading plan | 53% |
| Organize time spontaneously (no routine) | 47% |
| Want app connected to their church | 63% Yes |
| Want private prayer tracking | 77% Yes |
| Would pay something | 57% |
| Prefer short content 5–10 min | 50% + 30% both = 80% |
| Want AI-adaptive content | 73% Yes |

---

### 2.8 Feature Priority (Build Order)

1. Deep Bible study with commentary — 16 votes
2. Smart reminders — 15 votes
3. Guided reading plans — 13 votes
4. Daily structured prayers — 10 votes
5. Short audio reflections — 10 votes
6. AI Bible chat (Premium) — 10 votes
7. Spiritual challenges — 10 votes
8. Habit tracking — 9 votes
9. Notes / journal — 8 votes

### 2.9 The App's Core Promise

**Disciplina** (7) · **Profundidad** (6) · **Intimidad con Dios** (6) · **Motivación** (5)

*"Disciplina para la profundidad. Profundidad para la intimidad."*

---

## 3. MOCK DATA SYSTEM — PROTOTYPE LAYER

> This section is critical. Since there is no backend yet, ALL data shown in the app comes from MockDataService.
> Every screen must consume MockDataService. No screen should ever be empty, show "TODO", or have placeholder content.

### 3.1 Architecture

```
Core/
└── MockData/
    ├── MockDataService.swift      ← Single source of all mock data, injected via environment
    ├── MockBibleContent.swift     ← Bible verses, chapters, reading plans
    ├── MockDevotionals.swift      ← Devotional content with full text
    ├── MockPrayers.swift          ← Prayer requests (personal + community)
    ├── MockHabits.swift           ← Habits with realistic streak history
    ├── MockChallenges.swift       ← Spiritual challenges + participants
    └── MockUser.swift             ← User profile, stats, onboarding state
```

### 3.2 MockDataService — Main Entry Point

```swift
// Core/MockData/MockDataService.swift

import Foundation

@MainActor
class MockDataService: ObservableObject {

    static let shared = MockDataService()

    // MARK: - User
    @Published var currentUser: UserProfile = MockUser.rafael

    // MARK: - Today
    @Published var todayVerse: BibleVerse = MockBibleContent.verseOfTheDay
    @Published var todayDevotional: DailyDevotional = MockDevotionals.today
    @Published var streakDays: Int = 7
    @Published var todayCompletedItems: Set<String> = []

    // MARK: - Prayer
    @Published var myPrayers: [PrayerRequest] = MockPrayers.personal
    @Published var communityPrayers: [PrayerRequest] = MockPrayers.community

    // MARK: - Bible
    @Published var activeReadingPlan: ReadingPlan = MockBibleContent.activeplan
    @Published var allReadingPlans: [ReadingPlan] = MockBibleContent.allPlans
    @Published var recentVerses: [BibleVerse] = MockBibleContent.recentVerses
    @Published var currentChapter: BibleChapter = MockBibleContent.todayChapter

    // MARK: - Habits
    @Published var habits: [HabitTracker] = MockHabits.all
    @Published var habitHistory: [Date: Set<UUID>] = MockHabits.history

    // MARK: - Challenges
    @Published var featuredChallenge: SpiritualChallenge = MockChallenges.featured
    @Published var allChallenges: [SpiritualChallenge] = MockChallenges.all

    // MARK: - Actions (simulate interactivity)

    func toggleHabit(_ id: UUID) {
        if let i = habits.firstIndex(where: { $0.id == id }) {
            var h = habits[i]
            if todayCompletedItems.contains(id.uuidString) {
                todayCompletedItems.remove(id.uuidString)
                h.streak = max(0, h.streak - 1)
            } else {
                todayCompletedItems.insert(id.uuidString)
                h.streak += 1
            }
            habits[i] = h
        }
    }

    func addPrayer(_ prayer: PrayerRequest) {
        myPrayers.insert(prayer, at: 0)
    }

    func markPrayerAnswered(_ id: UUID) {
        if let i = myPrayers.firstIndex(where: { $0.id == id }) {
            myPrayers[i].isAnswered = true
            myPrayers[i].answeredAt = Date()
        }
    }

    func prayForRequest(_ id: UUID) {
        if let i = communityPrayers.firstIndex(where: { $0.id == id }) {
            communityPrayers[i].prayedByCount += 1
        }
    }

    func completeDevotional() {
        todayCompletedItems.insert("devotional")
        streakDays += 1
    }

    func advanceReadingPlan() {
        if activeReadingPlan.currentDay < activeReadingPlan.totalDays {
            activeReadingPlan.currentDay += 1
        }
    }
}
```

### 3.3 MockUser.swift

```swift
// Core/MockData/MockUser.swift

import Foundation

struct MockUser {
    static let rafael = UserProfile(
        name: "Rafael",
        spiritualLevel: .leader,
        tradition: .evangelical,
        joinedDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
        streakDays: 7,
        totalPrayerMinutes: 340,
        completedPlans: 2
    )
}
```

### 3.4 MockBibleContent.swift

```swift
// Core/MockData/MockBibleContent.swift

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
                   translation: .rvr60)
    ]

    // MARK: - Reading Plans
    static let activePlan = ReadingPlan(
        title: "NT en 90 Días",
        description: "Recorre el Nuevo Testamento completo con lecturas diarias guiadas. Desde Mateo hasta Apocalipsis en 90 días de encuentro profundo con la palabra.",
        totalDays: 90, currentDay: 38,
        coverGradientColors: ["#1B3A6B", "#4A90D9"],
        category: .newTestament
    )

    static let allPlans: [ReadingPlan] = [
        ReadingPlan(title: "NT en 90 Días",
                    description: "Recorre el Nuevo Testamento completo con lecturas diarias guiadas.",
                    totalDays: 90, currentDay: 38,
                    coverGradientColors: ["#1B3A6B", "#4A90D9"],
                    category: .newTestament),
        ReadingPlan(title: "Salmos y Proverbios",
                    description: "Sabiduría y adoración para cada día del mes.",
                    totalDays: 60, currentDay: 12,
                    coverGradientColors: ["#E8B86D", "#C8923A"],
                    category: .psalms),
        ReadingPlan(title: "Los 4 Evangelios",
                    description: "La vida y enseñanzas de Jesús en profundidad.",
                    totalDays: 45, currentDay: 0,
                    coverGradientColors: ["#5A9E7C", "#2D6B50"],
                    category: .gospels),
        ReadingPlan(title: "Estudio Profundo: Romanos",
                    description: "Teología fundamental para crecer en la fe reformada.",
                    totalDays: 30, currentDay: 0,
                    coverGradientColors: ["#6B4B8A", "#9B6BBE"],
                    isSubscriberOnly: true,
                    category: .deepStudy),
        ReadingPlan(title: "21 Días con los Salmos",
                    description: "Adoración y oración guiada a través de los Salmos más amados.",
                    totalDays: 21, currentDay: 0,
                    coverGradientColors: ["#C97B8A", "#A84A60"],
                    category: .psalms),
        ReadingPlan(title: "Fundamentos de la Fe",
                    description: "Para nuevos creyentes — las bases del evangelio explicadas con claridad.",
                    totalDays: 14, currentDay: 0,
                    coverGradientColors: ["#4A90D9", "#1B3A6B"],
                    category: .foundations)
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
            BibleVerse(book: "Juan", chapter: 14, verse: 6,
                       text: "Jesús le dijo: Yo soy el camino, y la verdad, y la vida; nadie viene al Padre, sino por mí.",
                       translation: .rvr60),
            BibleVerse(book: "Juan", chapter: 14, verse: 27,
                       text: "La paz os dejo, mi paz os doy; yo no os la doy como el mundo la da. No se turbe vuestro corazón, ni tenga miedo.",
                       translation: .rvr60)
        ]
    )
}

// MARK: - BibleChapter model (add to Models.swift)
struct BibleChapter: Identifiable {
    var id: UUID = UUID()
    var book: String
    var chapter: Int
    var translation: BibleTranslation
    var verses: [BibleVerse]
    var title: String { "\(book) \(chapter)" }
}
```

### 3.5 MockDevotionals.swift

```swift
// Core/MockData/MockDevotionals.swift

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
        """,
        prayerPrompt: "Señor, hoy te entrego específicamente: ___. Confío en que Tú tienes el control de esta situación. Que tu paz guarde mi corazón y mi mente.",
        estimatedMinutes: 8,
        isCompleted: false,
        theme: .peace
    )

    static let all: [DailyDevotional] = [
        today,
        DailyDevotional(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            title: "El poder de la gratitud",
            scripture: BibleVerse(book: "1 Tesalonicenses", chapter: 5, verse: 18,
                                  text: "Dad gracias en todo, porque esta es la voluntad de Dios para con vosotros en Cristo Jesús.",
                                  translation: .rvr60),
            reflection: "La gratitud no es un sentimiento que esperamos tener — es una práctica que cultivamos. Cuando decidimos dar gracias antes de ver el resultado, algo cambia en nuestro corazón...",
            prayerPrompt: "Señor, hoy quiero agradecerte por tres cosas específicas en mi vida: ___",
            estimatedMinutes: 6,
            isCompleted: true,
            theme: .gratitude
        ),
        DailyDevotional(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            title: "Fe que mueve montañas",
            scripture: BibleVerse(book: "Marcos", chapter: 11, verse: 24,
                                  text: "Por tanto, os digo que todo lo que pidiereis orando, creed que lo recibiréis, y os vendrá.",
                                  translation: .rvr60),
            reflection: "La fe bíblica no es optimismo. No es pensar positivo. Es una confianza fundamentada en el carácter de Dios...",
            prayerPrompt: "Señor, hoy creo que Tú puedes hacer ___ en mi vida.",
            estimatedMinutes: 10,
            isCompleted: true,
            theme: .faith
        )
    ]
}
```

### 3.6 MockPrayers.swift

```swift
// Core/MockData/MockPrayers.swift

import Foundation

struct MockPrayers {

    static let personal: [PrayerRequest] = [
        PrayerRequest(
            title: "Sanidad para mi mamá",
            content: "Señor, toca el cuerpo de mi mamá y restaura su salud completamente. Que los médicos tengan sabiduría y que Tu mano sea evidente en su recuperación.",
            createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .health
        ),
        PrayerRequest(
            title: "Dirección para mi trabajo",
            content: "Padre, necesito claridad sobre esta oportunidad laboral. No quiero tomar una decisión basada en el miedo sino en Tu guía. Dame paz y discernimiento.",
            createdAt: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .work
        ),
        PrayerRequest(
            title: "Restauración en mi matrimonio",
            content: "Señor, restaura la comunicación y el amor en mi hogar. Que podamos ser un reflejo de Tu amor el uno para el otro.",
            createdAt: Calendar.current.date(byAdding: .day, value: -14, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .family
        ),
        PrayerRequest(
            title: "Trabajo respondido ✨",
            content: "Oré por una oportunidad de trabajo y Dios abrió una puerta increíble. ¡Gloria a Dios!",
            createdAt: Calendar.current.date(byAdding: .day, value: -45, to: Date())!,
            isAnswered: true,
            answeredAt: Calendar.current.date(byAdding: .day, value: -10, to: Date()),
            isPrivate: true,
            prayedByCount: 0,
            category: .work
        )
    ]

    static let community: [PrayerRequest] = [
        PrayerRequest(
            title: "Por las misiones en Colombia",
            content: "Oremos por los misioneros en zonas rurales de Colombia que no tienen acceso al evangelio. Que Dios proteja su vida y multiplique su impacto.",
            createdAt: Calendar.current.date(byAdding: .hour, value: -2, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 47,
            category: .community
        ),
        PrayerRequest(
            title: "Familia González en duelo",
            content: "La familia González perdió a su padre esta semana. Oremos por consuelo sobrenatural y por la fe de los hijos que aún no conocen a Cristo.",
            createdAt: Calendar.current.date(byAdding: .hour, value: -5, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 89,
            category: .family
        ),
        PrayerRequest(
            title: "Unidad en nuestra iglesia",
            content: "Que Dios sane las divisiones y traiga un espíritu de unidad verdadera a nuestra congregación.",
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 134,
            category: .spiritual
        ),
        PrayerRequest(
            title: "Jóvenes en la universidad",
            content: "Por todos los jóvenes creyentes en las universidades, que su fe no se apague sino que sea testimonio ante sus compañeros.",
            createdAt: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 62,
            category: .community
        )
    ]
}
```

### 3.7 MockHabits.swift

```swift
// Core/MockData/MockHabits.swift

import Foundation

struct MockHabits {

    static let all: [HabitTracker] = [
        HabitTracker(name: "Oración matutina",   icon: "🙏", color: "#C97B8A",
                     targetFrequency: .daily,   streak: 7),
        HabitTracker(name: "Lectura bíblica",    icon: "📖", color: "#4A90D9",
                     targetFrequency: .daily,   streak: 3),
        HabitTracker(name: "Devocional diario",  icon: "✨", color: "#E8B86D",
                     targetFrequency: .daily,   streak: 5),
        HabitTracker(name: "Gratitud escrita",   icon: "📝", color: "#5A9E7C",
                     targetFrequency: .daily,   streak: 0),
        HabitTracker(name: "Ayuno semanal",      icon: "⚡️", color: "#6B4B8A",
                     targetFrequency: .weekly,  streak: 2),
    ]

    // Simulated history for the last 30 days — used by calendar/heatmap views
    static var history: [Date: Set<UUID>] = {
        var result: [Date: Set<UUID>] = [:]
        let calendar = Calendar.current
        let habitIds = all.map { $0.id }
        // Fill last 30 days with realistic completion patterns
        for daysBack in 0..<30 {
            guard let date = calendar.date(byAdding: .day, value: -daysBack, to: Date()) else { continue }
            let normalized = calendar.startOfDay(for: date)
            // Simulate ~70% completion rate with some gaps
            let completedCount = daysBack == 0 ? 2 : (daysBack % 7 == 0 ? 1 : Int.random(in: 2...5))
            result[normalized] = Set(habitIds.prefix(completedCount))
        }
        return result
    }()

    // Weekly completion for streak display
    static func completionRate(for weeks: Int = 4) -> Double {
        let totalDays = weeks * 7
        let completedDays = history.filter { !$0.value.isEmpty }.count
        return Double(min(completedDays, totalDays)) / Double(totalDays)
    }
}
```

### 3.8 MockChallenges.swift

```swift
// Core/MockData/MockChallenges.swift

import Foundation

struct MockChallenges {

    static let featured = SpiritualChallenge(
        title: "21 Días de Gratitud",
        description: "Durante 21 días, cada mañana escribe 3 cosas por las que estás agradecido. Cierra cada día con una oración de gracias. Transforma tu perspectiva desde adentro hacia afuera.",
        duration: 21,
        currentDay: 4,
        type: .gratitude,
        participants: 247,
        isActive: true
    )

    static let all: [SpiritualChallenge] = [
        featured,
        SpiritualChallenge(
            title: "7 Días de Oración en Familia",
            description: "Siete días de devoción familiar. Cada día incluye un versículo, una conversación y una oración juntos.",
            duration: 7, currentDay: 0,
            type: .prayer, participants: 892, isActive: false
        ),
        SpiritualChallenge(
            title: "Ayuno de Medios Digitales",
            description: "Cinco días desconectándote de redes sociales para conectarte más profundamente con Dios.",
            duration: 5, currentDay: 0,
            type: .fasting, participants: 156, isActive: false
        ),
        SpiritualChallenge(
            title: "30 Días de Salmos",
            description: "Un salmo por día durante un mes. Aprende a orar usando las palabras que Dios mismo inspiró.",
            duration: 30, currentDay: 0,
            type: .scripture, participants: 1204, isActive: false
        )
    ]
}
```

### 3.9 Injecting MockDataService into the App

```swift
// In PraybaraApp.swift — replace AppState with MockDataService for prototype:

@main
struct PraybaraApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var mockData = MockDataService.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
                .environmentObject(mockData)
        }
    }
}

// In every View that needs data:
@EnvironmentObject var mockData: MockDataService
```

### 3.10 Rules for Using Mock Data

1. **Every list must have content.** If a screen shows prayer requests, habits, plans, or verses — they must be pre-populated from MockDataService, never empty.
2. **Every action must feel interactive.** Tapping "Orar por esto" increments the count. Checking a habit updates the streak. Completing a devotional marks it done. Use `mockData.toggleHabit()`, `mockData.prayForRequest()`, etc.
3. **Never use `.constant([])` or empty arrays.** Always source from the mock layer.
4. **Dates must be realistic.** Use relative dates (`byAdding: .day, value: -3`) not hardcoded strings.
5. **Numbers must feel real.** Community prayers have 47, 89, 134 people praying — not 1, 2, 3.
6. **When backend is ready**, the developer will replace MockDataService with real API calls. The View layer must not change — only the data source.

---

## 4. DESIGN SYSTEM — FIGMA SOURCE OF TRUTH

> ALL design tokens come from the Figma Design System file. Never hardcode values that exist as tokens.
> When the Figma MCP is connected, pull latest tokens before building new screens.

**Figma Design System:** https://www.figma.com/design/LcaSEcTxDsyU1EjqfrmAIV/Praybara---Design-System?node-id=0-1
**Figma App Screens:** https://www.figma.com/design/QHivzkbTxGGq1SbFt84vW3/App-design?node-id=0-1

---

### 4.1 Color Tokens (Figma → Swift)

```
Figma Token                   Hex           Swift
────────────────────────────────────────────────────────────────────
BACKGROUNDS — DARK
color/bg/dark/primary         #0B1120       Color(hex: "#0B1120")
color/bg/dark/secondary       #111827       Color(hex: "#111827")

BACKGROUNDS — LIGHT
color/bg/light/primary        #FEFDF9       Color(hex: "#FEFDF9")
color/bg/light/secondary      #F0EBE3       Color(hex: "#F0EBE3")

BRAND
color/brand/celestial         #1B3A6B
color/brand/gold              #E8B86D       ← PRIMARY ACCENT (buttons, highlights)
color/brand/gold-light        #F0C878
color/brand/gold-dark         #C8923A
color/brand/midnight          #0B1120
color/brand/cosmic            #2D1B69

FEATURE ACCENTS (one per tab)
color/accent/prayer           #C97B8A       Prayer / Rose
color/accent/bible            #4A90D9       Bible / Blue
color/accent/habits           #5A9E7C       Habits / Green
color/accent/challenges       #6B4B8A       Challenges / Purple

TEXT — DARK MODE
color/text/dark/primary       #F5F0E8
color/text/dark/secondary     #A89880

TEXT — LIGHT MODE
color/text/light/primary      #1A1611
color/text/light/secondary    #5C5248
```

---

### 4.2 Typography Tokens (Figma → Swift)

```
Figma Token                   Swift
────────────────────────────────────────────────────────────────────
type/display/hero             PraybaraFonts.display(40, weight: .bold)
type/display/h1               PraybaraFonts.display(28, weight: .bold)
type/display/h2               PraybaraFonts.display(22, weight: .semibold)
type/display/h3               PraybaraFonts.display(18, weight: .semibold)
type/body/regular             PraybaraFonts.body(15, weight: .regular)
type/body/medium              PraybaraFonts.body(15, weight: .medium)
type/body/semibold            PraybaraFonts.body(16, weight: .semibold)
type/label/sm                 PraybaraFonts.label(13, weight: .medium)
type/label/xs                 PraybaraFonts.label(11, weight: .medium)
type/caption                  PraybaraFonts.label(10, weight: .regular)
type/scripture/verse          PraybaraFonts.scripture(18)
type/scripture/reference      .system(size: 13, weight: .semibold, design: .serif)

PraybaraFonts helpers (PraybaraTheme.swift):
  .display(size, weight)  → design: .serif    (Cormorant Garamond feel)
  .body(size, weight)     → design: .rounded  (DM Sans feel)
  .label(size, weight)    → design: .rounded
  .scripture(size)        → design: .serif, italic, light weight
```

---

### 4.3 Spacing Tokens

```
spacing/xs   4px    PraybaraSpacing.xs
spacing/sm   8px    PraybaraSpacing.sm
spacing/md   16px   PraybaraSpacing.md
spacing/lg   24px   PraybaraSpacing.lg
spacing/xl   32px   PraybaraSpacing.xl
spacing/xxl  48px   PraybaraSpacing.xxl
spacing/xxxl 64px   PraybaraSpacing.xxxl
```

---

### 4.4 Corner Radius Tokens

```
radius/sm    10px   PraybaraRadius.sm
radius/md    16px   PraybaraRadius.md
radius/lg    24px   PraybaraRadius.lg
radius/xl    32px   PraybaraRadius.xl
radius/pill  999px  PraybaraRadius.pill

ALWAYS use: RoundedRectangle(cornerRadius: PraybaraRadius.X, style: .continuous)
```

---

### 4.5 Liquid Glass Material Tokens

Praybara uses Apple's native `.ultraThinMaterial` for all glass surfaces (Liquid Glass — iOS 18 / visionOS native). Every card, sheet, and overlay uses this system.

```
effect/glass/dark           .ultraThinMaterial
                            + border: rgba(255,255,255,0.12) 1px
                            + shadow: black 40%, radius 20, y 8

effect/glass/light          .ultraThinMaterial
                            + border: rgba(255,255,255,0.85) 1px
                            + shadow: rgba(184,160,144,0.2), radius 20, y 8

effect/glass/gold-tinted    .ultraThinMaterial
                            + overlay: rgba(232,184,109,0.08)
                            + border: rgba(232,184,109,0.25) 1px
                            Used for: hero cards, featured CTAs

effect/glass/feature-tinted .ultraThinMaterial
                            + overlay: feature accent at 0.08 opacity
```

```swift
// CORRECT — always use the modifier
view
    .padding(PraybaraSpacing.md)
    .liquidGlass(cornerRadius: PraybaraRadius.lg)

// WRONG — never manually recreate glass
view
    .background(Color.white.opacity(0.07))
    .cornerRadius(24)
```

---

### 4.6 Gradient Tokens

```
gradient/bg/celestial-dark    PraybaraGradients.celestialDark
                              [#0B1120 → #1B2A50 → #2D1B69]

gradient/bg/dawn-light        PraybaraGradients.dawnLight
                              [#FEFDF9 → #F5ECD8 → #EDE0CC]

gradient/accent/gold          PraybaraGradients.goldAccent
                              [#E8B86D → #F0C878 → #C8923A]

gradient/feature/home/dark    [#0B1120, #1B2A50, #2D1B69]
gradient/feature/prayer/dark  [#0B1120, #1a0d20, #2D1B69]  + rose radial glow
gradient/feature/bible/dark   #0B1120 + radial #1B3A6B at top-right
gradient/feature/habits/dark  [#0B1120, #0d1f14, #1a3020]  + green radial
gradient/feature/home/light   [#FEFDF9, #F5ECD8, #EDE0CC]
gradient/feature/prayer/light [#FDF5F5, #F8EDE8]
gradient/feature/bible/light  [#F5F8FF, #EEF2FA]
gradient/feature/habits/light [#F5FBF7, #EDF5F0]
```

---

## 5. COMPONENT LIBRARY

All reusable components live in `Components/PraybaraComponents.swift`. Check before creating anything new.

| Component | Figma Name | Notes |
|-----------|-----------|-------|
| `PraybaraButton` | `Button` | styles: .primary .secondary .ghost .danger |
| `GlassCard` | `GlassCard` | Generic Liquid Glass container |
| `SectionHeader` | `SectionHeader` | Title + subtitle + optional action |
| `StreakBadge` | `Badge/Streak` | 🔥 count in gold pill |
| `ProgressRing` | `ProgressRing` | Animated circular progress |
| `BibleVerseCard` | `BibleVerseCard` | Scripture with reference + translation |
| `PraybaraTabItem` | `TabBar/Item` | Custom tab with spring animation |
| `HabitCheckButton` | `HabitRow` | Full row with bounce on check |
| `CategoryPill` | `FilterPill` | Horizontal filter chip |
| `SpringButtonStyle` | — | 0.96 scale press on any Button |
| `QuickActionItem` | `QuickAction` | Icon + label grid tile |

**Adding new components:** Add to `PraybaraComponents.swift`, support dark/light, use only tokens, add `SpringButtonStyle` to interactive elements.

---

## 6. SCREEN ARCHITECTURE

### Navigation
```
PraybaraApp
└── Group
    ├── AuthContainerView        (if !authState.isAuthenticated)
    │   ├── LoginView            email + Apple Sign In
    │   ├── RegisterView         name, email, password, confirm
    │   └── ForgotPasswordView   email recovery + success state
    └── ContentView              (if isAuthenticated)
        ├── OnboardingView       (if !hasCompletedOnboarding)
        └── MainTabView          (custom Liquid Glass tab — never native TabView)
            ├── HomeView
            ├── BibleView
            ├── PrayerView
            ├── HabitsView
            └── CommunityView
```

### Auth Flow Rules
- Auth screens are always **dark mode** — they represent pre-dawn prayer intimacy, never light
- Navigation between auth screens uses state-driven spring transitions (no NavigationStack)
- `AuthState.shared` is a singleton `ObservableObject` injected via `.environmentObject`
- "Forgot password" link is **hidden by default** — it slides in after `failedLoginAttempts >= 2`
- All input fields **preserve their value on error** — never clear on failure
- Error state: red border `#E57373` + trailing exclamation icon + red message below field
- Focus state: gold border `#E8B86D` at 65% opacity
- Mock credentials: any valid email + password `"praybara123"` → success
- Apple Sign In: custom styled button (no `AuthenticationServices` entitlement for prototype)

### Tab Bar Rules
- NEVER use SwiftUI native `TabView`
- Active tab: gold `#E8B86D`, slightly larger, spring animation
- Dark background: `.ultraThinMaterial` + `rgba(11,17,32,0.85)` + top border `rgba(255,255,255,0.08)`
- Light background: `.ultraThinMaterial` + `rgba(254,253,249,0.85)` + top border `rgba(0,0,0,0.06)`
- Bottom padding: 28px for home indicator

### Screen Status

| Screen | File | Status |
|--------|------|--------|
| **AUTH** | | |
| Login | `Features/Auth/LoginView.swift` | ✅ |
| Register | `Features/Auth/RegisterView.swift` | ✅ |
| Forgot Password | `Features/Auth/ForgotPasswordView.swift` | ✅ |
| Auth Container | `Features/Auth/AuthContainerView.swift` | ✅ |
| Auth Components | `Features/Auth/AuthComponents.swift` | ✅ |
| **MAIN APP** | | |
| Onboarding | `Features/Onboarding/OnboardingView.swift` | ✅ |
| Home | `Features/Home/HomeView.swift` | ✅ |
| Prayer | `Features/Prayer/PrayerView.swift` | ✅ |
| Bible | `Features/Bible/BibleView.swift` | ✅ |
| Habits | `Features/Habits/HabitsView.swift` | ✅ |
| Devotional Detail | `Features/Home/DevotionalDetailView.swift` | 🔲 P1 |
| Guided Prayer | `Features/Prayer/GuidedPrayerView.swift` | 🔲 P1 |
| Bible Reader | `Features/Bible/BibleReaderView.swift` | 🔲 P1 |
| Reading Plan Detail | `Features/Bible/ReadingPlanDetailView.swift` | 🔲 P2 |
| Add Prayer Sheet | `Features/Prayer/AddPrayerSheet.swift` | 🔲 P2 |
| Community | `Features/Community/CommunityView.swift` | 🔲 P2 |
| Settings | `Features/Settings/SettingsView.swift` | 🔲 P3 |
| Paywall | `Features/Settings/PaywallView.swift` | 🔲 P3 |
| AI Bible Chat | `Features/Bible/AIStudyView.swift` | 🔲 P3 |

---

## 7. DARK AND LIGHT THEME RULES

1. Declare `@Environment(\.colorScheme) var colorScheme` on every view
2. Background: dark = `gradient/bg/celestial-dark`, light = `gradient/bg/dawn-light`
3. `.ultraThinMaterial` adapts automatically — only borders and shadows need theming
4. Text: dark `#F5F0E8` / `#A89880` — light `#1A1611` / `#5C5248`
5. Accent colors same hex in both themes
6. Stars/particles: dark only — never in light mode
7. Shadows: dark `black 40%` / light `#B8A090 20%`
8. Each feature has its own gradient — see Section 4.6

---

## 8. CODING CONVENTIONS

### Always
```swift
@Environment(\.colorScheme) var colorScheme
colorScheme == .dark ? Color(hex: "#F5F0E8") : Color(hex: "#1A1611")
.animation(.spring(response: 0.3, dampingFraction: 0.7), value: state)
RoundedRectangle(cornerRadius: PraybaraRadius.lg, style: .continuous)
view.liquidGlass(cornerRadius: PraybaraRadius.lg)
.buttonStyle(SpringButtonStyle())
Spacer(minLength: 100)   // tab bar clearance at bottom of every scroll
NavigationStack { ... }
@EnvironmentObject var mockData: MockDataService  // source of all data
```

### Never
```swift
TabView { ... }                        // use custom MainTabView
Color.blue                             // use Color(hex:) tokens
Font.system(size: 16)                  // add design: .rounded or .serif
List { ... }                           // use ScrollView + VStack + ForEach
NavigationView { ... }                 // deprecated
.background(Color.white.opacity(0.07)) // use .liquidGlass()
.padding(12)                           // use PraybaraSpacing constants
[]                                     // never pass empty arrays — always use MockDataService
```

---

## 9. PROJECT STRUCTURE

```
Praybara/
├── CLAUDE.md
├── Praybara.xcodeproj/
└── Praybara/
    ├── App/
    │   └── PraybaraApp.swift
    ├── Core/
    │   ├── Theme/
    │   │   └── PraybaraTheme.swift        tokens, LiquidGlass modifier, SpringButtonStyle, PraybaraButton
    │   ├── Auth/
    │   │   └── AuthState.swift            mock auth state + login/register/reset logic
    │   ├── Models/
    │   │   └── Models.swift               domain models + AppState
    │   ├── MockData/                      ← PROTOTYPE DATA LAYER
    │   │   ├── MockDataService.swift      main service, injected via @EnvironmentObject
    │   │   ├── MockBibleContent.swift     verses, chapters, plans
    │   │   ├── MockDevotionals.swift      devotional content
    │   │   ├── MockPrayers.swift          personal + community prayers
    │   │   ├── MockHabits.swift           habits + history
    │   │   ├── MockChallenges.swift       challenges
    │   │   └── MockUser.swift             user profile
    │   └── ViewModels/
    ├── Features/
    │   ├── Auth/                          ✅
    │   │   ├── AuthContainerView.swift    state-driven navigation between auth screens
    │   │   ├── AuthComponents.swift       StarfieldView, AuthInputField, AuthDivider, AppleSignInButton
    │   │   ├── LoginView.swift            email + Apple Sign In + error states + forgot password
    │   │   ├── RegisterView.swift         name/email/password/confirm + validation
    │   │   └── ForgotPasswordView.swift   email recovery + success state
    │   ├── Onboarding/   ✅
    │   ├── Home/         ✅
    │   ├── Prayer/       ✅
    │   ├── Bible/        ✅
    │   ├── Habits/       ✅
    │   ├── Community/    🔲
    │   └── Settings/     🔲
    ├── Components/
    │   └── PraybaraComponents.swift
    └── Resources/
        └── Assets.xcassets
```

---

## 10. TECH STACK

| Layer | Tech |
|-------|------|
| Language | Swift 5.9+ |
| UI | SwiftUI 100% |
| Min OS | iOS 17.0 |
| Architecture | MVVM + @Observable |
| Prototype data | MockDataService (@EnvironmentObject) |
| Persistence (future) | SwiftData |
| Backend (future — not our scope) | Supabase |
| Auth (future — not our scope) | Supabase Auth |
| AI (future — not our scope) | Anthropic API |

---

## 11. GIT WORKFLOW

```
main      → stable builds
develop   → integration
feature/X → per-feature branches off develop
```

Commit prefix: ✨ feature · 🐛 fix · 💄 UI · ♻️ refactor · 📝 docs

---

## 12. WHAT TO BUILD NEXT

### P1
1. **DevotionalDetailView** — full reading, pull quote, audio player bar, prayer prompt. Uses `mockData.todayDevotional`
2. **GuidedPrayerView** — full-screen ACTS prayer flow (Adoration → Confession → Thanksgiving → Supplication), ambient starfield
3. **BibleReaderView** — chapter display, generous serif text, tap to highlight in gold, bookmark

### P2
4. **ReadingPlanDetailView** — day list, today highlighted, mark complete → calls `mockData.advanceReadingPlan()`
5. **AddPrayerSheet** — bottom sheet, category picker, title + content fields, private toggle → calls `mockData.addPrayer()`
6. **CommunityView** — prayer feed from `mockData.communityPrayers`, "Orar" button → calls `mockData.prayForRequest()`

### P3
7. **SettingsView** — reminders, language, subscription status
8. **PaywallView** — premium feature comparison, monthly/annual toggle
9. **AIStudyView** — chat interface, Premium gate (no real API yet — show mocked response)

---

## 13. FIGMA DESIGN SYSTEM — MANDATORY DOCUMENTATION

**Figma Design System file:** https://www.figma.com/design/LcaSEcTxDsyU1EjqfrmAIV/Praybara---Design-System

> Every component built in SwiftUI **must also exist in the Figma Design System file** as a proper Figma component. This is not optional. The Figma file is the living design source of truth that the backend developer, future designers, and stakeholders reference.

### 13.1 What Must Be in Figma

Every component that exists in code must be documented in Figma with:

1. **Component with variants** — all interactive states as separate variant properties:
   - Input field: `State=Default`, `State=Focused`, `State=Error`
   - Button: `Style=Primary`, `Style=Secondary`, `Style=Ghost`, `Style=Danger` + `Loading=True/False`
   - Auth screens: full artboard at iPhone 16 Pro size (393 × 852)

2. **Design tokens connected** — every color, text style, radius, and spacing must be a Figma variable or style, not a raw value

3. **Auto Layout** — every component and frame must use Auto Layout. No fixed-position elements.

4. **Annotations** — use Figma's annotation tool or sticky notes to document:
   - What the component does
   - Interaction behavior
   - Conditions (e.g., "Forgot password appears after 2+ failed attempts")
   - SwiftUI file reference (e.g., `→ LoginView.swift`)

### 13.2 Liquid Glass Style — iOS 26

Praybara uses **iOS 26 Liquid Glass** as its primary surface language. In Figma, replicate this with:

- **Background material:** `Background Blur` effect at 20–30px, fill `rgba(255,255,255,0.06)` for dark / `rgba(255,255,255,0.45)` for light
- **Border:** 1px stroke `rgba(255,255,255,0.12)` dark / `rgba(255,255,255,0.85)` light
- **Shadow:** Drop shadow `rgba(0,0,0,0.40)` · blur 20 · Y 8 (dark) or `rgba(184,160,144,0.20)` (light)
- **Corner radius:** Always use corner radius variables — never hardcode: `radius/sm=10`, `radius/md=16`, `radius/lg=24`, `radius/xl=32`
- **Naming in Figma:** Every glass layer must be named `Glass/Dark`, `Glass/Light`, or `Glass/Gold-Tinted`

In code, always use the `.liquidGlass(cornerRadius:)` modifier — never recreate glass manually.

### 13.3 Components to Create in Figma (Priority Order)

| Priority | Component | Variants Needed |
|----------|-----------|----------------|
| ✅ Done in code | `AuthInputField` | Default / Focused / Error |
| ✅ Done in code | `PraybaraButton` | Primary / Secondary / Ghost / Danger · Loading state |
| ✅ Done in code | `AppleSignInButton` | Default |
| ✅ Done in code | `AuthBackButton` | Default |
| ✅ Done in code | `AuthDivider` | Default |
| ✅ Done in code | `StarfieldView` | Dark only |
| 🔲 Needs Figma | `GlassCard` | Dark / Light / Gold-Tinted |
| 🔲 Needs Figma | `SectionHeader` | With action / Without action |
| 🔲 Needs Figma | `StreakBadge` | Default |
| 🔲 Needs Figma | `ProgressRing` | Various % states |
| 🔲 Needs Figma | `BibleVerseCard` | Default |
| 🔲 Needs Figma | `HabitCheckButton` | Unchecked / Checked / Streak |
| 🔲 Needs Figma | `CategoryPill` | Default / Selected |
| 🔲 Needs Figma | `PraybaraTabBar` | Each tab active/inactive |

### 13.4 Auth Screen Artboards to Create in Figma

All auth screens must exist as full-fidelity artboards in the Figma App Screens file:
https://www.figma.com/design/QHivzkbTxGGq1SbFt84vW3/App-design

| Artboard | States |
|----------|--------|
| Login | Default / Email Error / Password Error / After 2 Failed Attempts (forgot pw visible) |
| Register | Default / Each field error state |
| Forgot Password — Form | Default / Email Error |
| Forgot Password — Success | Sent confirmation |

### 13.5 Documentation Standards in Figma

- Use **pages** in Figma to organize: `Tokens` / `Components` / `Auth` / `Home` / `Bible` / `Prayer` / `Habits` / `Community` / `Settings`
- Every component frame must have a **component description** (Figma right panel → Description field)
- Use **Figma Variables** for all color and spacing tokens — linked to Section 4 of this document
- Every screen artboard must show **both dark and light mode** side by side
- Mark screens with status labels: `✅ Built` / `🎨 Design only` / `🔲 Not started`

---

## 14. MANDATORY WORKFLOW — EVERY CHANGE

### 14.1 Figma — Always Push to Both Files Simultaneously

Every change must be pushed to the correct file immediately:

| Change type | Target Figma file |
|-------------|------------------|
| Design tokens, color, typography, spacing | Design System `LcaSEcTxDsyU1EjqfrmAIV` |
| Reusable components (buttons, inputs, cards) | Design System `LcaSEcTxDsyU1EjqfrmAIV` |
| App screens (Login, Home, Prayer, etc.) | App design `QHivzkbTxGGq1SbFt84vW3` |
| Components that appear IN screens | **BOTH files simultaneously** |

Never push to one file and skip the other. Both captures must be triggered in the same session.

### 14.2 Figma Capture — Managing Duplicates

The Figma MCP capture tool always **adds new frames** — it cannot replace existing ones. To prevent duplicate accumulation:

1. **Before each new capture**, Claude will check the current canonical frame IDs from memory
2. **After each capture**, Claude will tell you the exact old frame IDs to delete in Figma
3. **You delete the old frames** in Figma: select the frame by name/ID → press Delete
4. **Claude updates memory** with the new canonical frame IDs

**Frame versioning rule:**
- Every HTML design file has a version number in its `<title>` and heading (e.g. `v3`)
- When a frame is updated, increment the version number in the HTML file BEFORE capturing
- The captured Figma frame will show the version in its name (e.g. "Praybara — Auth Screens v3")
- After each capture, tell the user which old versioned frame to delete in Figma

**Current canonical frame versions (always update this table after every capture):**

| Frame | Version | Design System ID | App Design ID |
|-------|---------|-----------------|---------------|
| Praybara — Design Tokens | v1 | `37:2` | — |
| Praybara — Components | v2 | `42:2` | `7:2` |
| Praybara — Auth Screens | v4 | `57:2` | `11:2` |

### 14.3 RemixIcon Font in HTML Files

Always use CDN — never a local path:
```css
@font-face {
  font-family: 'remixicon';
  src: url('https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.woff2') format('woff2'),
       url('https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.ttf') format('truetype');
}
```
Local paths (`../Praybara/Resources/...`) cause squares in Figma's capture environment.

### 14.4 Git — Commit and Push After Every Change

```bash
git add <changed files>
git commit -m "descriptive message"
git push
# Remote: https://github.com/redg1402/Praybara-Design.git
# Branch: main · User: Rafael De Guglielmo · redg402@gmail.com
```

Never leave changes uncommitted. Every code change + every Figma update = a git commit.

---

*Survey: 30 respondents, March 2026 · Design: Figma Praybara Design System · Frontend only — no backend scope*
