//
//  SearchScreenView.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/26/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchScreenView: View {
    @State private var searchText = ""
    @State private var isShowingCategories = false
   @StateObject private var viewModel = CategoryModel()
    
    var filteredCategories: [Category] {
        if searchText.isEmpty {
            return viewModel.categories
        } else {
            return viewModel.categories.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText, isShowingCategories: $isShowingCategories)
                    .padding(.top, 10)
                if isShowingCategories {
                    GeometryReader { geometry in
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: geometry.size.width / 2.5))], spacing: 20) {
                                ForEach(filteredCategories) { category in
                                    CategoryView(category: category)
                                }
                            }
                            .padding()
                        }
                    }
                } else {
                    List(filteredCategories) { category in
                        Text(category.name)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Search Categories")
            .onAppear {
                viewModel.fetchCategories()
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    @Binding var isShowingCategories: Bool
    
    var body: some View {
        HStack {
            TextField("Search.....", text: $text, onEditingChanged: { isEditing in
                isShowingCategories = isEditing
            })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: { self.text = ""
                                
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        }
    }
}
    struct CategoryView: View {
        let category: Category
        
        var body: some View {
            VStack {
                
                Text(category.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
        }
    }

#Preview {
    SearchScreenView()
}
