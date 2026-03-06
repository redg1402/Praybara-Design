// PraybaraTheme.swift
// Praybara — Design Token System
//
// Single source of truth for all colors, typography, spacing, radii, gradients,
// and reusable UI modifiers. Every view must use these tokens — never hardcode values.
//
// Figma Design System: https://www.figma.com/design/LcaSEcTxDsyU1EjqfrmAIV/Praybara---Design-System

import SwiftUI

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:  (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:  (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:  (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 1, 1, 1)
        }
        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

// MARK: - Colors

enum PraybaraColors {
    // Backgrounds — Dark
    static let bgDarkPrimary   = Color(hex: "#0B1120")
    static let bgDarkSecondary = Color(hex: "#111827")

    // Backgrounds — Light
    static let bgLightPrimary   = Color(hex: "#FEFDF9")
    static let bgLightSecondary = Color(hex: "#F0EBE3")

    // Brand
    static let celestial = Color(hex: "#1B3A6B")
    static let gold      = Color(hex: "#E8B86D")
    static let goldLight = Color(hex: "#F0C878")
    static let goldDark  = Color(hex: "#C8923A")
    static let midnight  = Color(hex: "#0B1120")
    static let cosmic    = Color(hex: "#2D1B69")

    // Feature Accents
    static let prayer     = Color(hex: "#C97B8A")
    static let bible      = Color(hex: "#4A90D9")
    static let habits     = Color(hex: "#5A9E7C")
    static let challenges = Color(hex: "#6B4B8A")

    // Text — Dark Mode
    static let textDarkPrimary   = Color(hex: "#F5F0E8")
    static let textDarkSecondary = Color(hex: "#A89880")

    // Text — Light Mode
    static let textLightPrimary   = Color(hex: "#1A1611")
    static let textLightSecondary = Color(hex: "#5C5248")

    // Semantic
    static let error   = Color(hex: "#E57373")
    static let success = Color(hex: "#81C784")

    static func textPrimary(for scheme: ColorScheme) -> Color {
        scheme == .dark ? textDarkPrimary : textLightPrimary
    }
    static func textSecondary(for scheme: ColorScheme) -> Color {
        scheme == .dark ? textDarkSecondary : textLightSecondary
    }
}

// MARK: - Spacing

enum PraybaraSpacing {
    static let xs: CGFloat   = 4
    static let sm: CGFloat   = 8
    static let md: CGFloat   = 16
    static let lg: CGFloat   = 24
    static let xl: CGFloat   = 32
    static let xxl: CGFloat  = 48
    static let xxxl: CGFloat = 64
}

// MARK: - Corner Radius

enum PraybaraRadius {
    static let sm: CGFloat   = 10
    static let md: CGFloat   = 16
    static let lg: CGFloat   = 24
    static let xl: CGFloat   = 32
    static let pill: CGFloat = 999
}

// MARK: - Typography

enum PraybaraFonts {
    /// Serif display — headings, titles, scripture references
    static func display(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .serif)
    }
    /// Rounded body — most UI text
    static func body(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
    /// Rounded label — small UI text, chips, badges
    static func label(_ size: CGFloat, weight: Font.Weight = .medium) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
    /// Italic serif — scripture verse text
    static func scripture(_ size: CGFloat) -> Font {
        .system(size: size, weight: .light, design: .serif).italic()
    }
}

// MARK: - Gradients

enum PraybaraGradients {
    static let celestialDark = LinearGradient(
        colors: [Color(hex: "#0B1120"), Color(hex: "#1B2A50"), Color(hex: "#2D1B69")],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let dawnLight = LinearGradient(
        colors: [Color(hex: "#FEFDF9"), Color(hex: "#F5ECD8"), Color(hex: "#EDE0CC")],
        startPoint: .top,
        endPoint: .bottom
    )
    static let goldAccent = LinearGradient(
        colors: [Color(hex: "#E8B86D"), Color(hex: "#F0C878"), Color(hex: "#C8923A")],
        startPoint: .leading,
        endPoint: .trailing
    )
    static let featurePrayer = LinearGradient(
        colors: [Color(hex: "#0B1120"), Color(hex: "#1a0d20"), Color(hex: "#2D1B69")],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
    static let featureBible = LinearGradient(
        colors: [Color(hex: "#0B1120"), Color(hex: "#0d1526"), Color(hex: "#1B3A6B")],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
    static let featureHabits = LinearGradient(
        colors: [Color(hex: "#0B1120"), Color(hex: "#0d1f14"), Color(hex: "#1a3020")],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
}

// MARK: - Liquid Glass Modifier

struct LiquidGlassModifier: ViewModifier {
    let cornerRadius: CGFloat
    var tintColor: Color?
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .overlay {
                if let tint = tintColor {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(tint.opacity(0.08))
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(
                        colorScheme == .dark
                            ? Color.white.opacity(0.12)
                            : Color.white.opacity(0.85),
                        lineWidth: 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(
                color: colorScheme == .dark
                    ? Color.black.opacity(0.4)
                    : Color(hex: "#B8A090").opacity(0.2),
                radius: 20, x: 0, y: 8
            )
    }
}

extension View {
    func liquidGlass(cornerRadius: CGFloat, tintColor: Color? = nil) -> some View {
        modifier(LiquidGlassModifier(cornerRadius: cornerRadius, tintColor: tintColor))
    }
}

// MARK: - SpringButtonStyle

struct SpringButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: configuration.isPressed)
    }
}

// MARK: - PraybaraButton

struct PraybaraButton: View {
    enum Style { case primary, secondary, ghost, danger }

    let title: String
    let style: Style
    let isLoading: Bool
    let action: () -> Void

    init(_ title: String, style: Style = .primary, isLoading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.isLoading = isLoading
        self.action = action
    }

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: action) {
            Group {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(foregroundColor)
                        .scaleEffect(0.85)
                } else {
                    Text(title)
                        .font(PraybaraFonts.body(16, weight: .semibold))
                        .foregroundColor(foregroundColor)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background { backgroundView }
            .overlay { overlayView }
            .clipShape(RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous))
        }
        .buttonStyle(SpringButtonStyle())
        .disabled(isLoading)
    }

    private var foregroundColor: Color {
        switch style {
        case .primary: return Color(hex: "#1A1611")
        case .danger:  return .white
        case .secondary, .ghost: return PraybaraColors.gold
        }
    }

    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .primary:   PraybaraGradients.goldAccent
        case .danger:    Color(hex: "#E57373")
        case .secondary: Color.clear
        case .ghost:     Color.clear
        }
    }

    @ViewBuilder
    private var overlayView: some View {
        if style == .secondary {
            RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous)
                .stroke(PraybaraColors.gold, lineWidth: 1)
        }
    }
}
