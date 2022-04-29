//
//  NavigationPOCApp.swift
//  Shared
//
//  Created by Maxence on 29/04/2022.
//

import SwiftUI

@main
struct NavigationPOCApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(Navigation())
        }
    }
}
