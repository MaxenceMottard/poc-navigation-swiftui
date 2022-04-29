//
//  HomeView.swift
//  Shared
//
//  Created by Maxence on 29/04/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        CustomNavigationLink(.screen1) {
            VStack {
                Button(action: { navigation.navigate(.screen1) }) {
                    Text("navigate to screen 1")
                }

                Button(action: { navigation.navigate([.screen1, .screen2]) }) {
                    Text("navigate to screen 2")
                }
            }
        }
        .navigation(navigation, .screen1) {
            Screen1()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
