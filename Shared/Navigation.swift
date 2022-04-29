//
//  Navigation.swift
//  NavigationPOC
//
//  Created by Maxence on 29/04/2022.
//

import Foundation

class Navigation: ObservableObject {
    @Environment(\.presentationMode) var presentationMode
    @Published var stack: [Screen] = []

    func isInStack(_ screen: Screen) -> Bool {
        stack.contains(screen)
    }

    func isCurrentScreen(_ screen: Screen) -> Bool {
        stack.last == screen
    }

    func navigate(_ screen: Screen) {
        stack.append(screen)
    }

    func navigate(_ screens: [Screen]) {
        screens.forEach { [weak self] screen in
            self?.stack.append(screen)
        }
    }

    func popToRootView() {
        _ = stack.removeLast()

        if !stack.isEmpty {
            popToRootView()
        }
    }

    func pop() {
        _ = stack.removeLast()
    }
}

enum Screen {
    case screen1, screen2, screen3
}



import SwiftUI

protocol NavigableView: View {
    var navigation: Navigation { get }
    var currentScreen: Screen { get }
    var presentationMode: Binding<PresentationMode> { get }
}

extension NavigableView {
    func enableNavigation() -> some View {
        self
            .onChange(of: presentationMode.wrappedValue.isPresented) { newValue in
                if !newValue {
                    navigation.pop()
                }
            }
    }

    func navigation<V: View>(
        screen: Screen,
        destination: () -> V
    ) -> some View {
        return VStack {
            NavigationLink(
                isActive: .constant(navigation.isInStack(screen)),
                destination: {
                    destination()
                },
                label: { EmptyView() }
            )

            self
        }
    }
}
