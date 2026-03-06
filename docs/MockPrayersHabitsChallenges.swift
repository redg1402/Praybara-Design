// MockPrayers.swift
// Praybara — Mock Prayer Requests

import Foundation

struct MockPrayers {

    // MARK: - Personal (private journal)
    static let personal: [PrayerRequest] = [
        PrayerRequest(
            title: "Sanidad para mi mamá",
            content: "Señor, toca el cuerpo de mi mamá y restaura su salud completamente. Que los médicos tengan sabiduría y que Tu mano sea evidente en su recuperación. Confío en Ti.",
            createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .health,
            tags: ["familia", "salud"]
        ),
        PrayerRequest(
            title: "Dirección para esta decisión laboral",
            content: "Padre, necesito claridad sobre esta oportunidad. No quiero decidir desde el miedo ni desde la ambición — quiero Tu dirección. Dame paz cuando sea Tu voluntad y cierra la puerta si no lo es.",
            createdAt: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .work,
            tags: ["trabajo", "decisión"]
        ),
        PrayerRequest(
            title: "Restauración en mi matrimonio",
            content: "Señor, restaura la comunicación y el amor en mi hogar. Que podamos ser un reflejo de Tu amor el uno para el otro. Quita el orgullo de ambos y trae sanidad.",
            createdAt: Calendar.current.date(byAdding: .day, value: -14, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .family,
            tags: ["matrimonio", "familia"]
        ),
        PrayerRequest(
            title: "Mis hijos en la universidad",
            content: "Señor, guarda la fe de mis hijos en medio del ambiente universitario. Que encuentren comunidad cristiana y que su identidad esté firme en Ti.",
            createdAt: Calendar.current.date(byAdding: .day, value: -21, to: Date())!,
            isAnswered: false,
            isPrivate: true,
            prayedByCount: 0,
            category: .family
        ),
        PrayerRequest(
            title: "Nueva etapa de ministerio — Respondida ✨",
            content: "Oré durante meses por una puerta en el ministerio juvenil. Dios lo hizo posible de una forma que no imaginé. Su tiempo es perfecto.",
            createdAt: Calendar.current.date(byAdding: .day, value: -60, to: Date())!,
            isAnswered: true,
            answeredAt: Calendar.current.date(byAdding: .day, value: -15, to: Date()),
            isPrivate: true,
            prayedByCount: 0,
            category: .spiritual
        )
    ]

    // MARK: - Community (shared feed)
    static let community: [PrayerRequest] = [
        PrayerRequest(
            title: "Por las misiones en Colombia rural",
            content: "Oremos por los misioneros en zonas rurales de Colombia que no tienen acceso al evangelio. Que Dios proteja su vida, multiplique su impacto y provea sus necesidades.",
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
            title: "Unidad en la iglesia local",
            content: "Que Dios sane las divisiones y traiga un espíritu de unidad verdadera a nuestra congregación. Que el amor sea nuestra seña de identidad.",
            createdAt: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 134,
            category: .spiritual
        ),
        PrayerRequest(
            title: "Jóvenes en la universidad",
            content: "Por todos los jóvenes creyentes en universidades, que su fe no se apague sino que sea testimonio ante sus compañeros.",
            createdAt: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 62,
            category: .community
        ),
        PrayerRequest(
            title: "Avivamiento en América Latina",
            content: "Señor, derrama Tu Espíritu sobre nuestra región. Que la iglesia latinoamericana sea sal y luz en este tiempo de oscuridad política y social.",
            createdAt: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            isAnswered: false,
            isPrivate: false,
            prayedByCount: 312,
            category: .spiritual
        )
    ]
}


// MockHabits.swift
// Praybara — Mock Spiritual Habit Data

struct MockHabits {

    static var all: [HabitTracker] = [
        HabitTracker(
            name: "Oración matutina",
            icon: "🙏",
            color: "#C97B8A",
            targetFrequency: .daily,
            streak: 7
        ),
        HabitTracker(
            name: "Lectura bíblica",
            icon: "📖",
            color: "#4A90D9",
            targetFrequency: .daily,
            streak: 3
        ),
        HabitTracker(
            name: "Devocional diario",
            icon: "✨",
            color: "#E8B86D",
            targetFrequency: .daily,
            streak: 5
        ),
        HabitTracker(
            name: "Gratitud escrita",
            icon: "📝",
            color: "#5A9E7C",
            targetFrequency: .daily,
            streak: 0
        ),
        HabitTracker(
            name: "Ayuno semanal",
            icon: "⚡️",
            color: "#6B4B8A",
            targetFrequency: .weekly,
            streak: 2
        )
    ]

    // Weekly completion booleans for streak view (Mon–Sun, this week)
    static let thisWeek: [Bool] = [true, true, true, true, false, false, false]

    // Monthly completion rate (used for stats cards)
    static let monthlyCompletionRate: Double = 0.87

    // Longest streak in history
    static let longestStreak: Int = 14

    // History — Dict of day offset from today → Set of habit names completed
    // Used by any calendar/heatmap component
    static var history: [Int: Set<String>] = {
        var result: [Int: Set<String>] = [:]
        let habitNames = all.map { $0.name }
        for daysBack in 0..<30 {
            // Simulate realistic 70-80% completion
            let completed = habitNames.filter { _ in Bool.random() || daysBack < 7 }
            result[-daysBack] = Set(completed.prefix(Int.random(in: 2...5)))
        }
        return result
    }()
}


// MockChallenges.swift
// Praybara — Mock Spiritual Challenges

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
            description: "Siete días de devoción familiar. Cada día incluye un versículo para leer juntos, una conversación guiada y una oración en familia.",
            duration: 7,
            currentDay: 0,
            type: .prayer,
            participants: 892,
            isActive: false
        ),
        SpiritualChallenge(
            title: "Ayuno de Redes Sociales",
            description: "Cinco días desconectándote de redes sociales para conectarte más profundamente con Dios. Cada hora libre se convierte en oportunidad de oración.",
            duration: 5,
            currentDay: 0,
            type: .fasting,
            participants: 156,
            isActive: false
        ),
        SpiritualChallenge(
            title: "30 Días de Salmos",
            description: "Un salmo por día durante un mes. Aprende a orar usando las palabras que Dios mismo inspiró. Include guía de reflexión diaria.",
            duration: 30,
            currentDay: 0,
            type: .scripture,
            participants: 1204,
            isActive: false
        ),
        SpiritualChallenge(
            title: "14 Días de Servicio",
            description: "Dos semanas buscando activamente cómo servir a alguien cada día. Pequeños actos de amor que reflejan el carácter de Cristo.",
            duration: 14,
            currentDay: 0,
            type: .service,
            participants: 438,
            isActive: false
        )
    ]
}
