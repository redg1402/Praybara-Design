// AuthContainerView.swift
// Praybara — Auth Flow Container
//
// Root container for the entire authentication flow.
// Manages navigation between Login → Register → ForgotPassword
// using state-driven transitions (no NavigationStack — custom spring animations).
//
// Integration in PraybaraApp.swift:
//
//   @StateObject private var authState = AuthState.shared
//
//   var body: some Scene {
//       WindowGroup {
//           Group {
//               if authState.isAuthenticated {
//                   ContentView()   // → Onboarding or MainTabView
//               } else {
//                   AuthContainerView()
//               }
//           }
//           .environmentObject(authState)
//       }
//   }

import SwiftUI

// MARK: - Auth Screen Enum

enum AuthScreen: Equatable {
    case login
    case register
    case forgotPassword
}

// MARK: - AuthContainerView

struct AuthContainerView: View {
    @StateObject private var authState = AuthState.shared
    @State private var screen: AuthScreen = .login

    var body: some View {
        ZStack {
            switch screen {
            case .login:
                LoginView(
                    onRegister: { navigate(to: .register) },
                    onForgotPassword: { navigate(to: .forgotPassword) }
                )
                .transition(transition(for: .login))

            case .register:
                RegisterView(
                    onBack: { navigate(to: .login) }
                )
                .transition(transition(for: .register))

            case .forgotPassword:
                ForgotPasswordView(
                    onBack: { navigate(to: .login) }
                )
                .transition(transition(for: .forgotPassword))
            }
        }
        .environmentObject(authState)
        .animation(.spring(response: 0.45, dampingFraction: 0.88), value: screen)
    }

    // MARK: - Navigation

    private func navigate(to destination: AuthScreen) {
        withAnimation(.spring(response: 0.45, dampingFraction: 0.88)) {
            screen = destination
        }
    }

    // MARK: - Transitions

    private func transition(for target: AuthScreen) -> AnyTransition {
        switch target {
        case .login:
            return .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        case .register, .forgotPassword:
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        }
    }
}

// MARK: - Preview

#Preview {
    AuthContainerView()
}
