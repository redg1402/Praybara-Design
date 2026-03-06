// AuthState.swift
// Praybara — Mock Authentication State
//
// PURPOSE: Manages the auth flow state for the prototype frontend.
// All "API calls" are simulated with async delays. No real auth logic.
// When backend is ready, the developer replaces the internals — Views do not change.
//
// DEMO credentials: any valid email + password "praybara123"
// To trigger error states: any email + wrong password (< 3 attempts = password error,
// >= 2 failed attempts = forgot password link appears on LoginView)

import Foundation

// MARK: - Auth Error

enum AuthError: Equatable {
    case invalidEmail
    case wrongPassword
    case emailNotFound
    case emailAlreadyInUse
    case weakPassword
    case passwordMismatch
    case emptyField
    case networkError

    var message: String {
        switch self {
        case .invalidEmail:       return "El correo no tiene un formato válido"
        case .wrongPassword:      return "La contraseña es incorrecta"
        case .emailNotFound:      return "No encontramos una cuenta con este correo"
        case .emailAlreadyInUse:  return "Este correo ya está registrado"
        case .weakPassword:       return "La contraseña debe tener al menos 8 caracteres"
        case .passwordMismatch:   return "Las contraseñas no coinciden"
        case .emptyField:         return "Este campo es obligatorio"
        case .networkError:       return "Error de conexión. Intenta de nuevo"
        }
    }
}

// MARK: - Auth Result Types

struct LoginResult {
    var emailError: AuthError?
    var passwordError: AuthError?
    var success: Bool { emailError == nil && passwordError == nil }
}

struct RegisterResult {
    var nameError: AuthError?
    var emailError: AuthError?
    var passwordError: AuthError?
    var confirmError: AuthError?
    var success: Bool { nameError == nil && emailError == nil && passwordError == nil && confirmError == nil }
}

// MARK: - AuthState

@MainActor
class AuthState: ObservableObject {

    static let shared = AuthState()

    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var failedLoginAttempts = 0

    // Computed — drives the "Forgot password" link visibility on LoginView
    var showForgotPassword: Bool { failedLoginAttempts >= 2 }

    // MARK: - Mock Credentials
    // In production: replaced by Supabase Auth calls
    private let mockEmail    = "demo@praybara.app"
    private let mockPassword = "praybara123"

    // MARK: - Login

    func login(email: String, password: String) async -> LoginResult {
        isLoading = true
        try? await Task.sleep(nanoseconds: 900_000_000) // simulate network latency
        isLoading = false

        // Validate email format
        guard isValidEmail(email) else {
            return LoginResult(emailError: .invalidEmail)
        }

        // Check credentials against mock
        let emailMatch    = email.lowercased().trimmingCharacters(in: .whitespaces) == mockEmail
        let passwordMatch = password == mockPassword

        if emailMatch && passwordMatch {
            failedLoginAttempts = 0
            isAuthenticated = true
            return LoginResult()
        }

        // Wrong credentials — track attempts
        failedLoginAttempts += 1

        if !emailMatch {
            return LoginResult(emailError: .emailNotFound)
        } else {
            return LoginResult(passwordError: .wrongPassword)
        }
    }

    // MARK: - Register

    func register(name: String, email: String, password: String, confirmPassword: String) async -> RegisterResult {
        isLoading = true
        try? await Task.sleep(nanoseconds: 900_000_000)
        isLoading = false

        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            return RegisterResult(nameError: .emptyField)
        }
        if !isValidEmail(email) {
            return RegisterResult(emailError: .invalidEmail)
        }
        if password.count < 8 {
            return RegisterResult(passwordError: .weakPassword)
        }
        if password != confirmPassword {
            return RegisterResult(confirmError: .passwordMismatch)
        }

        // Mock: always succeeds for any valid input
        isAuthenticated = true
        return RegisterResult()
    }

    // MARK: - Password Reset

    func sendPasswordReset(email: String) async -> AuthError? {
        isLoading = true
        try? await Task.sleep(nanoseconds: 900_000_000)
        isLoading = false

        guard isValidEmail(email) else { return .invalidEmail }
        return nil // nil = success
    }

    // MARK: - Apple Sign In

    func signInWithApple() {
        // Mock: instant success. Production: AuthenticationServices + Supabase.
        isAuthenticated = true
        failedLoginAttempts = 0
    }

    // MARK: - Sign Out

    func signOut() {
        isAuthenticated = false
        failedLoginAttempts = 0
    }

    // MARK: - Helpers

    private func isValidEmail(_ email: String) -> Bool {
        let trimmed = email.trimmingCharacters(in: .whitespaces)
        return trimmed.contains("@") && trimmed.contains(".") && trimmed.count > 5
    }
}
