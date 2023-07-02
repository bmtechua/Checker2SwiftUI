//
//  Home.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 10.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    @ObservedObject var news = NewsModel()
    var body: some View {
            List(news.data){ item in
                NavigationLink(destination: DetailNewsView(news: item)) {
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text(item.title)
                                .fontWeight(.bold)
                            Text(item.description)
                                .font(.caption)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                        }
                        
                        VStack{
                            if item.image != "" {
                                WebImage(url: URL(string: item.image))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110, height: 118)
                                    .background(Color.secondary)
                                    .cornerRadius(10)
                            } else {
                                Image(systemName: "video")
                                    .resizable()
                                    .frame(width: 120, height: 170)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
     
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
