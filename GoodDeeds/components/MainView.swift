//
//  bottombarnavigator.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/26/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchScreenView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            DeedsView()
                .tabItem {
                    Label("Deeds", systemImage: "heart")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
        }
    }
}

#Preview {
    MainView()
}
