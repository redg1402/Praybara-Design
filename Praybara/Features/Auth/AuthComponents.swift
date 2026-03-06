// AuthComponents.swift
// Praybara — Shared Auth UI Components
//
// Components used across Login, Register, and ForgotPassword screens.
// StarfieldView: deterministic background particles for auth screens.
// AuthInputField: text field with normal / focused / error states.

import SwiftUI

// MARK: - StarfieldView

/// Deterministic starfield background — no randomness, consistent across renders.
/// Dark-only (never shown in light mode).
struct StarfieldView: View {
    // Pre-computed star data: (normalizedX, normalizedY, radius, opacity)
    private let stars: [(CGFloat, CGFloat, CGFloat, Double)] = {
        var result: [(CGFloat, CGFloat, CGFloat, Double)] = []
        let count = 70
        for i in 0..<count {
            let x = CGFloat((i * 137 + 23) % 100) / 100.0
            let y = CGFloat((i * 97  + 11) % 100) / 100.0
            let r = CGFloat((i % 3) + 1) * 0.65
            let o = Double((i % 5) + 2) / 10.0
            result.append((x, y, r, o))
        }
        return result
    }()

    var body: some View {
        Canvas { ctx, size in
            for (nx, ny, r, opacity) in stars {
                let rect = CGRect(
                    x: nx * size.width  - r / 2,
                    y: ny * size.height - r / 2,
                    width: r, height: r
                )
                ctx.fill(Ellipse().path(in: rect), with: .color(.white.opacity(opacity)))
            }
        }
        .allowsHitTesting(false)
    }
}

// MARK: - AuthInputField

/// Text input field for auth screens with three visual states:
///   • Normal: subtle border
///   • Focused: gold border
///   • Error: red border + trailing icon + error message below
///
/// The field value is NEVER cleared on error so the user can read and correct what they typed.
struct AuthInputField: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var autocapitalization: TextInputAutocapitalization = .never
    var textContentType: UITextContentType? = nil
    var errorMessage: String? = nil

    @State private var isRevealed = false
    @FocusState private var isFocused: Bool

    private var hasError: Bool { errorMessage != nil }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Label
            Text(title)
                .font(PraybaraFonts.label(12, weight: .medium))
                .foregroundColor(hasError ? PraybaraColors.error : Color.white.opacity(0.55))

            // Input row
            HStack(spacing: PraybaraSpacing.sm) {
                inputContent
                    .font(PraybaraFonts.body(15))
                    .foregroundColor(PraybaraColors.textDarkPrimary)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(autocapitalization)
                    .autocorrectionDisabled()
                    .focused($isFocused)

                // Trailing — reveal toggle (secure) or error icon (text)
                if isSecure {
                    Button {
                        isRevealed.toggle()
                    } label: {
                        RIcon(
                            icon: isRevealed ? .eyeOffLine : .eyeLine,
                            size: 18,
                            color: hasError ? PraybaraColors.error : Color.white.opacity(0.35)
                        )
                    }
                } else if hasError {
                    RIcon(icon: .errorWarningFill, size: 18, color: PraybaraColors.error)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(.horizontal, PraybaraSpacing.md)
            .padding(.vertical, 14)
            .background {
                RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous)
                    .fill(Color.white.opacity(isFocused ? 0.08 : 0.05))
            }
            .overlay {
                RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous)
                    .stroke(borderColor, lineWidth: hasError ? 1.5 : 1)
            }
            .animation(.spring(response: 0.25, dampingFraction: 0.8), value: isFocused)

            // Error message
            if let message = errorMessage {
                HStack(spacing: 4) {
                    RIcon(icon: .errorWarningLine, size: 13, color: PraybaraColors.error)
                    Text(message)
                        .font(PraybaraFonts.label(12))
                        .foregroundColor(PraybaraColors.error)
                }
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.75), value: hasError)
    }

    // Switch between SecureField and TextField based on reveal state
    @ViewBuilder
    private var inputContent: some View {
        if isSecure && !isRevealed {
            SecureField(placeholder, text: $text)
        } else {
            TextField(placeholder, text: $text)
        }
    }

    private var borderColor: Color {
        if hasError  { return PraybaraColors.error.opacity(0.75) }
        if isFocused { return PraybaraColors.gold.opacity(0.65) }
        return Color.white.opacity(0.12)
    }
}

// MARK: - AuthDivider

struct AuthDivider: View {
    let label: String

    var body: some View {
        HStack(spacing: PraybaraSpacing.sm) {
            Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(height: 1)
            Text(label)
                .font(PraybaraFonts.label(12))
                .foregroundColor(Color.white.opacity(0.3))
                .fixedSize()
            Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(height: 1)
        }
    }
}

// MARK: - AppleSignInButton

/// Custom Apple Sign-In styled button (prototype — no AuthenticationServices entitlement needed).
struct AppleSignInButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: PraybaraSpacing.sm) {
                RIcon(icon: .appleFill, size: 20, color: PraybaraColors.textDarkPrimary)
                Text("Continuar con Apple")
                    .font(PraybaraFonts.body(15, weight: .semibold))
            }
            .foregroundColor(PraybaraColors.textDarkPrimary)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background {
                RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous)
                    .fill(Color.white.opacity(0.07))
            }
            .overlay {
                RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: PraybaraRadius.md, style: .continuous))
        }
        .buttonStyle(SpringButtonStyle())
    }
}

// MARK: - AuthBackButton

struct AuthBackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                RIcon(icon: .arrowLeftSLine, size: 20, color: Color.white.opacity(0.6))
                Text("Volver")
                    .font(PraybaraFonts.label(14, weight: .medium))
                    .foregroundColor(Color.white.opacity(0.6))
            }
        }
        .buttonStyle(SpringButtonStyle())
    }
}
