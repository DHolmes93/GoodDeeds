//
//  Post.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/29/24.
//

import Foundation

struct Post: Identifiable {
    var id: String
    var userId: String
    var userName: String
    var content: String
    var imageURL: String?
    var timestamp: Date
}
