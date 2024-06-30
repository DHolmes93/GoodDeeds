//
//  SignUpViewControllerWrapper.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/26/24.
//

import Foundation
import SwiftUI
import UIKit


struct SignUpViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = SignUpViewController
    
    func makeUIViewController(context: Context) -> SignUpViewController {
        return SignUpViewController()
    }
    
    func updateUIViewController(_ uiViewController: SignUpViewController, context: Context) {}
}
