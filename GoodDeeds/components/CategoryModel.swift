//
//  CategoryModel.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/30/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Category: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var imageUrl: String
    var details: [CategoryDetail]?
}

enum CategoryDetail: Codable {
    case string(String)
    case int(Int)
    case bool(Bool)
    case double(Double)
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else if let intValue = try? container.decode(Int.self) {
            self = .int(intValue)
        } else if let boolValue = try? container.decode(Bool.self) {
            self = .bool(boolValue)
        } else if let doubleValue = try? container.decode(Double.self) {
            self = .double(doubleValue)
        } else {
            throw DecodingError.typeMismatch(CategoryDetail.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unknown type"))
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        case .bool(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        }
    }
}

class CategoryModel: ObservableObject {
    @Published var categories: [Category] = []
    
    private var db = Firestore.firestore()
    
    func fetchCategories() {
        db.collection("categories").getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            if let snapshot = snapshot {
                self.categories = snapshot.documents.compactMap { document in
                    try? document.data(as: Category.self)
                }
            }
        }
    }
}
