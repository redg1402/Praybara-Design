// LoginView.swift
// Praybara — Login Screen
//
// Entry point for existing users. Supports:
//   • Email + password login
//   • Apple Sign In
//   • Error states on both fields (value preserved, not cleared)
//   • "Forgot password" link slides in after 2+ failed attempts
//   • Navigation to RegisterView

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authState: AuthState

    let onRegister:       () -> Void
    let onForgotPassword: () -> Void

    // MARK: - State

    @State private var email = ""
    @State private var password = ""
    @State private var emailError: String?    = nil
    @State private var passwordError: String? = nil

    @State private var didAppear = false

    // MARK: - Body

    var body: some View {
        ZStack {
            background

            ScrollView {
                VStack(spacing: 0) {
                    Spacer(minLength: 64)
                    logoSection
                        .opacity(didAppear ? 1 : 0)
                        .offset(y: didAppear ? 0 : 20)
                    Spacer(minLength: 40)
                    formCard
                        .padding(.horizontal, PraybaraSpacing.lg)
                        .opacity(didAppear ? 1 : 0)
                        .offset(y: didAppear ? 0 : 32)
                    Spacer(minLength: PraybaraSpacing.lg)
                    bottomLinks
                        .opacity(didAppear ? 1 : 0)
                    Spacer(minLength: 48)
                }
            }
            .scrollDismissesKeyboard(.immediately)
        }
        .onAppear {
            withAnimation(.spring(response: 0.7, dampingFraction: 0.8).delay(0.1)) {
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

    // MARK: - Logo

    private var logoSection: some View {
        VStack(spacing: PraybaraSpacing.sm) {
            ZStack {
                Circle()
                    .fill(PraybaraColors.gold.opacity(0.1))
                    .frame(width: 68, height: 68)
                RIcon(icon: .sparklingFill, size: 30, color: PraybaraColors.gold)
            }

            Text("Praybara")
                .font(PraybaraFonts.display(34, weight: .bold))
                .foregroundColor(PraybaraColors.textDarkPrimary)

            Text("Tu compañero espiritual")
                .font(PraybaraFonts.label(14))
                .foregroundColor(PraybaraColors.textDarkSecondary)
        }
    }

    // MARK: - Form Card

    private var formCard: some View {
        VStack(alignment: .leading, spacing: PraybaraSpacing.lg) {
            // Header
            VStack(alignment: .leading, spacing: 4) {
                Text("Bienvenido de vuelta")
                    .font(PraybaraFonts.display(22, weight: .semibold))
                    .foregroundColor(PraybaraColors.textDarkPrimary)
                Text("Entra a tu espacio devocional")
                    .font(PraybaraFonts.label(13))
                    .foregroundColor(PraybaraColors.textDarkSecondary)
            }

            // Fields
            VStack(spacing: PraybaraSpacing.md) {
                AuthInputField(
                    title: "Correo electrónico",
                    placeholder: "tu@correo.com",
                    text: $email,
                    keyboardType: .emailAddress,
                    errorMessage: emailError
                )
                AuthInputField(
                    title: "Contraseña",
                    placeholder: "••••••••",
                    text: $password,
                    isSecure: true,
                    errorMessage: passwordError
                )
            }

            // Primary CTA
            PraybaraButton("Iniciar sesión", isLoading: authState.isLoading) {
                Task { await performLogin() }
            }

            // Divider
            AuthDivider(label: "o continúa con")

            // Apple Sign In
            AppleSignInButton {
                authState.signInWithApple()
            }
        }
        .padding(PraybaraSpacing.lg)
        .liquidGlass(cornerRadius: PraybaraRadius.lg)
    }

    // MARK: - Bottom Links

    private var bottomLinks: some View {
        VStack(spacing: PraybaraSpacing.md) {
            // Forgot password — appears after 2+ failed attempts
            if authState.showForgotPassword {
                Button(action: onForgotPassword) {
                    HStack(spacing: 5) {
                        RIcon(icon: .keyFill, size: 13, color: PraybaraColors.gold)
                        Text("¿Olvidaste tu contraseña?")
                            .font(PraybaraFonts.label(13, weight: .medium))
                            .foregroundColor(PraybaraColors.gold)
                    }
                }
                .buttonStyle(SpringButtonStyle())
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }

            // Register prompt
            HStack(spacing: 4) {
                Text("¿No tienes cuenta?")
                    .font(PraybaraFonts.label(13))
                    .foregroundColor(Color.white.opacity(0.45))
                Button("Regístrate", action: onRegister)
                    .font(PraybaraFonts.label(13, weight: .semibold))
                    .foregroundColor(PraybaraColors.gold)
                    .buttonStyle(SpringButtonStyle())
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: authState.showForgotPassword)
    }

    // MARK: - Login Action

    private func performLogin() async {
        // Clear previous errors before retry
        withAnimation {
            emailError    = nil
            passwordError = nil
        }

        let result = await authState.login(email: email, password: password)

        withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
            emailError    = result.emailError?.message
            passwordError = result.passwordError?.message
        }

        if !result.success {
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }
}

// MARK: - Preview

#Preview {
    LoginView(onRegister: {}, onForgotPassword: {})
        .environmentObject(AuthState.shared)
}
