//
//  HomeScreenView.swift
//  GoodDeeds
//
//  Created by Donovan Holmes on 6/26/24.
//

import SwiftUI
import FirebaseFirestore

struct HomeScreenView: View {
    @State private var posts: [Post] = []
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(posts) { post in
                        PostView(post: post)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 2)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Home")
            .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
            .onAppear {
                fetchPosts()
            }
            
        }
    }
    func fetchPosts() {
        posts = [
            Post(id: UUID().uuidString, userId: "1", userName: "Don", content: "Be Inspired Everyone!", imageURL: nil, timestamp: Date()),
            Post(id: UUID().uuidString, userId: "2", userName: "James", content: "Be Blessed Guys", imageURL: nil, timestamp: Date())
        ]
//        //Fetch Posts from Database
//        let db = Firestore.firestore()
//        db.collection("posts").getDocuments
//        { (snapshot, error) in
//            if let snapshot = snapshot
//            {
//                self.posts = snapshot.documents.map { document in
//                    let data = document.data()
//                    return Post(id: document.documentID,
//                    userId: data["userId"] as? String ?? "",
//                                userName: data["userName"] as? String ?? "",
//                                content: data["content"] as? String ?? "",
//                    imageURL: data["imageURL"] as? String,
//                                timestamp: (data["timestamp"] as? Timestamp)?.dateValue() ?? Date())}
  //          }}
    }
}
struct PostView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(post.userName)
                        .font(.headline)
                    Text(post.timestamp, style: .time)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                Spacer()
            }
            Text(post.content)
                .font(.body)
            if let imageURL = post.imageURL {
                AsyncImage(url: URL(string: imageURL)) { image in image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxHeight: 300)
                .cornerRadius(10)
            }
            
        }
        
        .padding()
        
    }

}

#Preview {
    HomeScreenView()
}
