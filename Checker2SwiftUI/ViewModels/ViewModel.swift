//
//  ViewModel.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 30.04.2023.
//

import Foundation
import SwiftUI
import Combine
import SwiftyJSON


class NewsModel: ObservableObject {
    
    let urlString = "https://newsapi.org/v2/everything?q=Apple&from=\(dateSet())&sortBy=popularity&apiKey=ffc40f9cda57418e9b3600f003ed11b5"
    
    @Published var data = [NewsOne]()
    
    init() {
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: urlString)!) { data, _, error in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
                let json = try! JSON(data: data!)
                let item = json["articles"].array!
                
                for i in item {
                    let title = i["title"].stringValue
                    let description = i["description"].stringValue
                    let imgUrl = i["urlToImage"].stringValue
                    let content = i["content"].stringValue
                    let author = i["author"].stringValue
                    let publishedAt = i["publishedAt"].stringValue
                    
                    DispatchQueue.main.async {
                        self.data.append(NewsOne(title: title, image: imgUrl, description: description, content: content, author: author, publishedAt: publishedAt))
                    }
                }
            } .resume()
        
        }
    
    func addNews(news: NewsOne) {
        data.append(news)
    }
    
    func removeNews(news: NewsOne) {
        data.removeAll { $0.id == news.id }
    }
    
    }

