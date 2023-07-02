//
//  RowHStackNewsOne.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 08.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI
import Foundation


struct RowHStackNewsOne: View {
    
    let news: NewsOne
    let arrayNews: [NewsOne] = []
    @ObservedObject var viewModel = NewsModelFavorites()
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                VStack{
                    Text(news.title)
                        .font(.custom("Roboto-Black", size: 20))
                        .lineLimit(3)
                        .foregroundColor(.green)
                        
                    
                    Text(news.description)
                        .font(.custom("Roboto-Regular", size: 17))
                        .lineLimit(5)
                }
                Spacer()
                if news.image != "" {
                    WebImage(url: URL(string: news.image))
                        .resizable()
                        .frame(height: 160)
                        .cornerRadius(15)
                } else {
                    Image("image_1200")
                        .resizable()
                        .frame(height: 160)
                        .cornerRadius(15)
                    
                }
                Spacer()
            }
            .padding()
            footer
                
        }
    }
    
    var footer: some View {
        
        HStack(spacing: 130){
            
            Text(stringToDate(date: news.publishedAt).timeAgo())
                .font(.custom("Roboto-Regular", size: 12))
                .lineLimit(1)
            HStack(spacing: 40){
                Button {
                    print("add to favorite")
                    viewModel.addFavorites(news: NewsOne(title: news.title, image: news.image, description: news.description, content: news.content, author: news.author, publishedAt: news.publishedAt))
                    
                } label: {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                }
                
                Button {
                    print("share")
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                }

            }
        }
    }
    
}

struct RowHStackNewsOne_Previews: PreviewProvider {
    static var previews: some View {
        RowHStackNewsOne(news: NewsOne(title: "Tile Bluetooth trackers review: Oldest in the game, best in the biz", image: "", description: "Whether it's your wallet, car keys, remote control, or the notorious (yet adorable) Mr. Butters, there's a Tile tracker to find them all. Do they work as advertised? Our review puts Tile's Bluetooth trackers to the test to find out.", content: "", author: "author", publishedAt: "2023-05-07T13:30:25Z"))
    }
}
