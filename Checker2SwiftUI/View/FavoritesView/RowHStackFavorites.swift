//
//  RowHStackFavorites.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 10.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI
import Foundation


struct RowHStackFavorites: View {
    let news: NewsOne
    @ObservedObject var viewModel = NewsModelFavorites()
    @State private var showAlert = false
    
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
                    print("delete news \(news.title)")
                    viewModel.removeFavorites(news: news)
                    showAlert = true
                    print("deleted")
                } label: {
                    Image(systemName: "trash.fill")
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Favorite"),
            message: Text("News has been deleted!"),
                  dismissButton: .default(Text("Ok")))
        }
    }
        
}

struct RowHStackFavorites_Previews: PreviewProvider {
    static var previews: some View {
        RowHStackFavorites(news: NewsOne(title: "Tile Bluetooth trackers review: Oldest in the game, best in the biz", image: "", description: "Whether it's your wallet, car keys, remote control, or the notorious (yet adorable) Mr. Butters, there's a Tile tracker to find them all. Do they work as advertised? Our review puts Tile's Bluetooth trackers to the test to find out.", content: "", author: "author", publishedAt: "2023-05-07T13:30:25Z"))
    }
}
