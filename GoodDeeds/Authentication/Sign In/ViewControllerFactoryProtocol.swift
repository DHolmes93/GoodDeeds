//
//  ViewControllerFactoryProtocol.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/23/24.
//

import Foundation
import UIKit

protocol ViewControllerFactoryProtocol {
    func createSignInViewController() ->
    SignInViewController
    
    func createSignUpViewController() ->
    SignUpViewController
}
