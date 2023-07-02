//
//  News.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 24.04.2023.
//

import Foundation

struct NewsOne: Codable, Identifiable, Hashable {
    var id = UUID()
    var title: String
    var image: String
    var description: String
    var content: String
    var author: String
    var publishedAt: String
    
    init (id: UUID = UUID(),
          title: String,
          image: String,
          description: String,
          content: String,
          author: String,
          publishedAt: String)
    {
        self.id = id
        self.title = title
        self.image = image
        self.description = description
        self.description = description
        self.content = content
        self.author = author
        self.publishedAt = publishedAt
    }
}


