//
//  CustomNavigationLink.swift
//  NavigationPOC
//
//  Created by Maxence on 30/04/2022.
//

import SwiftUI

struct CustomNavigationLink<C: View>: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var navigation: Navigation

    var currentScreen: Screen
    @ViewBuilder var content: () -> C

    init(_ screen: Screen, content: @escaping () -> C) {
        self.currentScreen = screen
        self.content = content
    }

    var body: some View {
        content()
            .onChange(of: presentationMode.wrappedValue.isPresented) { newValue in
                print("====================================")
                print("isPresented: \(newValue) || currentScreen: \(currentScreen) || \(navigation.isCurrentScreen(currentScreen))")
                print(navigation.stack)
                if !newValue && navigation.isCurrentScreen(currentScreen) {
                    navigation.pop()
                }
            }
    }

    func navigation<D: View>(_ navigation: Navigation, _ screen: Screen, @ViewBuilder destination: () -> D) -> some View {
        VStack {
            NavigationLink(
                isActive: .constant(navigation.isInStack(screen)),
                destination: destination,
                label: { EmptyView() }
            )

            self
        }
    }
}

struct CustomNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationLink(.screen1) {
            Text("Screen 1")
        }
    }
}
