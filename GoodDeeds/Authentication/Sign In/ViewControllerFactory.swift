//
//  ViewControllerFactory.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/23/24.
//

import Foundation
import UIKit


class ViewControllerFactory:
    ViewControllerFactoryProtocol {
    static let shared = ViewControllerFactory()
    
    private init() {}
    
    func createSignInViewController() -> SignInViewController {
        return SignInViewController()
    }
    func createSignUpViewController() -> SignUpViewController {
        return SignUpViewController()
    }
}
