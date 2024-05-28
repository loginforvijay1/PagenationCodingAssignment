//
//  PostsViewModel.swift
//  PagenationCodingAssignment
//
//  Created by Vijay Reddy on 28/05/24.
//

import Foundation

class PostsViewModel {
    private var posts: [Post] = []
    private var isLoading = false
    private var currentPage = 1
    private let pageSize = 10
    private let urlSession = URLSession.shared
    
    var onDataUpdated: (() -> Void)?
    
    func loadPosts() {
        guard !isLoading else { return }
        isLoading = true
        
        let urlString = "https://jsonplaceholder.typicode.com/posts?_page=\(currentPage)&_limit=\(pageSize)"
        guard let url = URL(string: urlString) else { return }
        
        urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                self?.isLoading = false
                return
            }
            do {
                let newPosts = try JSONDecoder().decode([Post].self, from: data)
                self.posts.append(contentsOf: newPosts)
                self.currentPage += 1
                self.isLoading = false
                DispatchQueue.main.async {
                    self.onDataUpdated?()
                }
            } catch {
                self.isLoading = false
            }
        }.resume()
    }
    
    func numberOfPosts() -> Int {
        return posts.count
    }
    
    func post(at index: Int) -> Post {
        return posts[index]
    }
}
