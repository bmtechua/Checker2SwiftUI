//
//  DetailNewsView.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 08.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailNewsView: View {
    
    var news: NewsOne
    
    var body: some View {
        VStack{
            Text(news.title)
                .font(.custom("Roboto-Black", size: 26))
                .multilineTextAlignment(.leading)
            
            HStack{
                Text(news.author)
                    .font(.custom("Roboto-Regular", size: 12))
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    
            }
            Text(news.description)
                .font(.custom("Roboto-Regular", size: 17))
                .multilineTextAlignment(.leading)
                .padding()
                
            if news.image != "" {
                WebImage(url: URL(string: news.image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity)
                    .padding()
            } else {
                Image(systemName: "image_1200")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding()
            }
            Text(news.content)
                .font(.custom("Roboto-Regular", size: 17))
                .multilineTextAlignment(.leading)
                .padding()
                
            
            Spacer()
        }
    }
}

struct DetailNewsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNewsView(news: NewsOne(title: "Title", image: "", description: "Description", content: "Content", author: "Author", publishedAt: "2023-05-07T13:30:25Z"))
    }
}
