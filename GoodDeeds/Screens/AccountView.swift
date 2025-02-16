//
//  AccountView.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/26/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authManager: AuthManager
    @StateObject private var viewModel = UserAccountModel()
    @State private var isImagePickerPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button(action: {
                    isImagePickerPresented.toggle()
                }) {
                    if let profileImage = viewModel.profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                    }
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(image: $viewModel.profileImage)
                    
                }
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    viewModel.saveUserDetails()
                }) {
                    Text("Save")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    viewModel.signOut()
                }) {
                    Text("Sign Out")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationTitle("User Account")
            .onChange(of: authManager.isSignedIn) { isSignedIn in
                if !isSignedIn {
                    if let window = UIApplication.shared.windows.first {
                        window.rootViewController = UIHostingController(rootView: SignInView()
                        .environmentObject(authManager))
                    }
                }}
        }
    }
}

#Preview {
    AccountView()
}
