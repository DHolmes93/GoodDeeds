//
//  ContentView.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/23/24.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = AuthManager.shared
    @State private var isSignedIn = false
    var body: some View {
        VStack {
            if isSignedIn {
                MainView()
            } else {
                SignInView()
            }
        }
                                  
        .onAppear {
            authManager.checkAuthState { isSignedIn in
                self.isSignedIn = isSignedIn
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
