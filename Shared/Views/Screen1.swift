//
//  Screen1.swift
//  NavigationPOC
//
//  Created by Maxence on 29/04/2022.
//

import SwiftUI

struct Screen1: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        CustomNavigationLink(.screen2) {
            VStack {
                Button(action: { navigation.navigate(.screen2) }) {
                    Text("navigate to screen 2")
                }

                Button(action: { navigation.pop() }) {
                    Text("Close")
                }
            }
        }
        .navigation(navigation, .screen2) {
            Screen2()
        }
//        .navigation(navigation, screen: .screen2) {
//            Screen2()
//        }
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1()
    }
}
