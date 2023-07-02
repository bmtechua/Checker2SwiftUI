//
//  ListViewNews.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 08.05.2023.
//

import SwiftUI

struct ListViewNews: View {

    @ObservedObject var news = NewsModel()
    @ObservedObject var favoritesNews = NewsModelFavorites()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(news.data) { item in
                    RowHStackNewsOne(news: item)
                        .listRowSeparator(.hidden)
                        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .overlay{
                            NavigationLink {
                                DetailNewsView(news: item)
                            } label: {
                                EmptyView()
                            }
                            .opacity(0)
                        }
                        .contextMenu(menuItems: {
                            Button {
                                favoritesNews.addFavorites(news: NewsOne(title: item.title, image: item.image, description: item.description, content: item.description, author: item.author, publishedAt: item.publishedAt))
                                print("news was add to favorites")
                            } label: {
                                Text("Add news")
                            }
                            
                            
                        })
                }
            }
            .listStyle(.plain)
            .buttonStyle(.plain)
            .navigationTitle("News List")
        }
    }
}

struct ListViewNews_Previews: PreviewProvider {
    static var previews: some View {
        ListViewNews()
    }
}
