//
//  SignInViewControllerWrapper.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/23/24.
//

import Foundation
import SwiftUI
import UIKit

struct SignInViewControllerWrapper:
    UIViewControllerRepresentable {
    typealias UIViewControllerType = SignInViewController
    
    func makeUIViewController(context: Context) -> SignInViewController {
        let viewController = SignInViewController()
        viewController.delegate =  context.coordinator
        return viewController
    }
    func updateUIViewController(_ uiViewController: SignInViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator 
    {
        Coordinator(parent: self)
    }
    class Coordinator: NSObject, SignInViewControllerDelegate {
        func dicCompleteSignIn(user: User) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.windows.first?.rootViewController = UIHostingController(rootView: HomeScreenView())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
        
        
        var parent: SignInViewControllerWrapper
        
        init(parent: SignInViewControllerWrapper) {
            self.parent = parent
        }
        
        
        func didRequestSignUp() {
            if let windowScene =
                UIApplication.shared.connectedScenes.first
                as? UIWindowScene {
                windowScene.windows.first?.rootViewController = UIHostingController(rootView: SignUpViewControllerWrapper())
                
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }
}
