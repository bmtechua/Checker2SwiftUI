//
//  ViewModelNewsFavorites.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 19.05.2023.
//

import Foundation

class NewsModelFavorites: ObservableObject {
    
    @Published var favoritesNews: [NewsOne] = []
    
    func saveFavorites() {
        do {
            let data = try JSONEncoder().encode(favoritesNews)
            UserDefaults.standard.set(data, forKey: "Favorites")
            print("Saveded favorites: \(data.count)")
        } catch {
         print("Failed to encode news: \(error)")
        }
    }

    func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "Favorites") {
            do {
                let loadedNews = try JSONDecoder().decode([NewsOne].self, from: data)
                favoritesNews = loadedNews
                print("Loaded favorites: \(loadedNews.count)")
            } catch {
                print("Failed to decode news: \(error)")
            }
        }
    }

    func addFavorites(news: NewsOne) {
        loadFavorites()
        let favorites = NewsOne(title: news.title, image: news.image, description: news.description, content: news.content, author: news.author, publishedAt: news.publishedAt)
        favoritesNews.append(news)
        saveFavorites()
    }

    func removeFavorites(news: NewsOne) {
        loadFavorites()
        favoritesNews.removeAll { $0.id == news.id }
        saveFavorites()
    }
}
