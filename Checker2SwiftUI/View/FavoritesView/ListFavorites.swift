//
//  ListFavorites.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 10.05.2023.
//

import SwiftUI
import Combine

struct ListFavorites: View {
    @StateObject var newsModel = NewsModelFavorites()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(newsModel.favoritesNews) { item in
                    RowHStackFavorites(news: item)
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
                                newsModel.removeFavorites(news: item)
                            } label: {
                                Text("Delete news")
                            }
                            
                            
                        })
                }
            }
            .onAppear(perform: {
                newsModel.loadFavorites()
            })
            .listStyle(.plain)
            .buttonStyle(.plain)
            .navigationTitle("Favorite News List")
        }
        
    }
}

struct ListFavorites_Previews: PreviewProvider {
    static var previews: some View {
        ListFavorites()
    }
}
