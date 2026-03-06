// RegisterView.swift
// Praybara — Registration Screen
//
// New user account creation. Fields:
//   • Full name
//   • Email
//   • Password (8+ characters, with reveal toggle)
//   • Confirm password (with reveal toggle)
// All fields preserve their value on error.
// On success → authState.isAuthenticated = true → app routes to Onboarding.

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authState: AuthState

    let onBack: () -> Void

    // MARK: - State

    @State private var name            = ""
    @State private var email           = ""
    @State private var password        = ""
    @State private var confirmPassword = ""

    @State private var nameError:    String? = nil
    @State private var emailError:   String? = nil
    @State private var passwordError: String? = nil
    @State private var confirmError:  String? = nil

    @State private var didAppear = false

    // MARK: - Body

    var body: some View {
        ZStack {
            background

            ScrollView {
                VStack(spacing: 0) {
                    Spacer(minLength: 56)
                    header
                        .padding(.horizontal, PraybaraSpacing.lg)
                        .opacity(didAppear ? 1 : 0)
                        .offset(y: didAppear ? 0 : 16)
                    Spacer(minLength: PraybaraSpacing.xl)
                    formCard
                        .padding(.horizontal, PraybaraSpacing.lg)
                        .opacity(didAppear ? 1 : 0)
                        .offset(y: didAppear ? 0 : 28)
                    Spacer(minLength: PraybaraSpacing.lg)
                    loginPrompt
                        .opacity(didAppear ? 1 : 0)
                    Spacer(minLength: 48)
                }
            }
            .scrollDismissesKeyboard(.immediately)
        }
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

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: PraybaraSpacing.lg) {
            AuthBackButton(action: onBack)

            VStack(alignment: .leading, spacing: 4) {
                Text("Crea tu cuenta")
                    .font(PraybaraFonts.display(28, weight: .bold))
                    .foregroundColor(PraybaraColors.textDarkPrimary)
                Text("Empieza tu camino espiritual hoy")
                    .font(PraybaraFonts.label(14))
                    .foregroundColor(PraybaraColors.textDarkSecondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Form Card

    private var formCard: some View {
        VStack(spacing: PraybaraSpacing.md) {
            AuthInputField(
                title: "Nombre completo",
                placeholder: "Tu nombre",
                text: $name,
                autocapitalization: .words,
                errorMessage: nameError
            )

            AuthInputField(
                title: "Correo electrónico",
                placeholder: "tu@correo.com",
                text: $email,
                keyboardType: .emailAddress,
                errorMessage: emailError
            )

            AuthInputField(
                title: "Contraseña",
                placeholder: "Mínimo 8 caracteres",
                text: $password,
                isSecure: true,
                errorMessage: passwordError
            )

            AuthInputField(
                title: "Confirmar contraseña",
                placeholder: "Repite tu contraseña",
                text: $confirmPassword,
                isSecure: true,
                errorMessage: confirmError
            )

            Spacer(minLength: PraybaraSpacing.xs)

            // Terms note
            Text("Al registrarte aceptas nuestros Términos de Uso y Política de Privacidad.")
                .font(PraybaraFonts.label(11))
                .foregroundColor(Color.white.opacity(0.3))
                .multilineTextAlignment(.center)

            PraybaraButton("Crear cuenta", isLoading: authState.isLoading) {
                Task { await performRegister() }
            }

            AuthDivider(label: "o")

            AppleSignInButton {
                authState.signInWithApple()
            }
        }
        .padding(PraybaraSpacing.lg)
        .liquidGlass(cornerRadius: PraybaraRadius.lg)
    }

    // MARK: - Login Prompt

    private var loginPrompt: some View {
        HStack(spacing: 4) {
            Text("¿Ya tienes cuenta?")
                .font(PraybaraFonts.label(13))
                .foregroundColor(Color.white.opacity(0.45))
            Button("Inicia sesión", action: onBack)
                .font(PraybaraFonts.label(13, weight: .semibold))
                .foregroundColor(PraybaraColors.gold)
                .buttonStyle(SpringButtonStyle())
        }
    }

    // MARK: - Register Action

    private func performRegister() async {
        withAnimation {
            nameError     = nil
            emailError    = nil
            passwordError = nil
            confirmError  = nil
        }

        let result = await authState.register(
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword
        )

        withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
            nameError     = result.nameError?.message
            emailError    = result.emailError?.message
            passwordError = result.passwordError?.message
            confirmError  = result.confirmError?.message
        }

        if !result.success {
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }
}

// MARK: - Preview

#Preview {
    RegisterView(onBack: {})
        .environmentObject(AuthState.shared)
}
