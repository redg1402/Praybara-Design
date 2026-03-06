// ForgotPasswordView.swift
// Praybara — Password Recovery Screen
//
// Shown only when user has 2+ failed login attempts (surfaced from LoginView).
// Two states:
//   • Form state — email input + send button
//   • Success state — animated confirmation with "back to login" option

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var authState: AuthState

    let onBack: () -> Void

    // MARK: - State

    @State private var email      = ""
    @State private var emailError: String? = nil
    @State private var didSend    = false
    @State private var didAppear  = false

    // MARK: - Body

    var body: some View {
        ZStack {
            background

            if didSend {
                successState
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing).combined(with: .opacity),
                        removal: .opacity
                    ))
            } else {
                formState
                    .transition(.asymmetric(
                        insertion: .opacity,
                        removal: .move(edge: .leading).combined(with: .opacity)
                    ))
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.85), value: didSend)
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8).delay(0.05)) {
                didAppear = true
            }
        }
    }

    // MARK: - Background

    private var background: some View {
        ZStack {
            PraybaraGradients.celestialDark
            StarfieldView()
        }
        .ignoresSafeArea()
    }

    // MARK: - Form State

    private var formState: some View {
        ScrollView {
            VStack(spacing: 0) {
                Spacer(minLength: 56)

                // Header
                VStack(alignment: .leading, spacing: PraybaraSpacing.lg) {
                    AuthBackButton(action: onBack)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Recuperar contraseña")
                            .font(PraybaraFonts.display(26, weight: .bold))
                            .foregroundColor(PraybaraColors.textDarkPrimary)
                        Text("Te enviaremos un enlace a tu correo")
                            .font(PraybaraFonts.label(14))
                            .foregroundColor(PraybaraColors.textDarkSecondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, PraybaraSpacing.lg)
                .opacity(didAppear ? 1 : 0)
                .offset(y: didAppear ? 0 : 16)

                Spacer(minLength: PraybaraSpacing.xl)

                // Form card
                VStack(spacing: PraybaraSpacing.lg) {
                    // Context hint
                    HStack(spacing: PraybaraSpacing.sm) {
                        RIcon(icon: .informationLine, size: 15, color: PraybaraColors.gold.opacity(0.7))
                        Text("Ingresa el correo con el que te registraste y te enviaremos las instrucciones.")
                            .font(PraybaraFonts.label(13))
                            .foregroundColor(Color.white.opacity(0.5))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(PraybaraSpacing.md)
                    .background {
                        RoundedRectangle(cornerRadius: PraybaraRadius.sm, style: .continuous)
                            .fill(PraybaraColors.gold.opacity(0.07))
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: PraybaraRadius.sm, style: .continuous)
                            .stroke(PraybaraColors.gold.opacity(0.18), lineWidth: 1)
                    }

                    AuthInputField(
                        title: "Correo electrónico",
                        placeholder: "tu@correo.com",
                        text: $email,
                        keyboardType: .emailAddress,
                        errorMessage: emailError
                    )

                    PraybaraButton("Enviar enlace", isLoading: authState.isLoading) {
                        Task { await performReset() }
                    }
                }
                .padding(PraybaraSpacing.lg)
                .liquidGlass(cornerRadius: PraybaraRadius.lg)
                .padding(.horizontal, PraybaraSpacing.lg)
                .opacity(didAppear ? 1 : 0)
                .offset(y: didAppear ? 0 : 28)

                Spacer(minLength: 48)
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }

    // MARK: - Success State

    private var successState: some View {
        VStack(spacing: PraybaraSpacing.xl) {
            Spacer()

            // Animated checkmark
            ZStack {
                Circle()
                    .fill(PraybaraColors.gold.opacity(0.07))
                    .frame(width: 130, height: 130)
                Circle()
                    .fill(PraybaraColors.gold.opacity(0.12))
                    .frame(width: 100, height: 100)
                RIcon(icon: .mailSendLine, size: 44, color: PraybaraColors.gold)
            }

            VStack(spacing: PraybaraSpacing.sm) {
                Text("Enlace enviado")
                    .font(PraybaraFonts.display(26, weight: .bold))
                    .foregroundColor(PraybaraColors.textDarkPrimary)

                Text("Revisa tu bandeja de entrada en\n\(email)")
                    .font(PraybaraFonts.label(14))
                    .foregroundColor(PraybaraColors.textDarkSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
            }

            // Scripture quote — fits the sacred context
            VStack(spacing: PraybaraSpacing.sm) {
                Text("\"Pedid, y se os dará\"")
                    .font(PraybaraFonts.scripture(16))
                    .foregroundColor(PraybaraColors.gold.opacity(0.7))
                Text("Mateo 7:7")
                    .font(.system(size: 11, weight: .semibold, design: .serif))
                    .foregroundColor(Color.white.opacity(0.3))
            }

            Spacer()

            VStack(spacing: PraybaraSpacing.md) {
                PraybaraButton("Volver al inicio de sesión", action: onBack)
                    .padding(.horizontal, PraybaraSpacing.lg)

                Text("¿No llegó el correo? Revisa tu carpeta de spam.")
                    .font(PraybaraFonts.label(12))
                    .foregroundColor(Color.white.opacity(0.3))
                    .multilineTextAlignment(.center)
            }

            Spacer(minLength: 48)
        }
        .padding(.horizontal, PraybaraSpacing.lg)
    }

    // MARK: - Reset Action

    private func performReset() async {
        withAnimation {
            emailError = nil
        }

        let error = await authState.sendPasswordReset(email: email)

        if let error {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                emailError = error.message
            }
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        } else {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            withAnimation {
                didSend = true
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ForgotPasswordView(onBack: {})
        .environmentObject(AuthState.shared)
}
