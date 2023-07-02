//
//  StockModel.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 19.06.2023.
//

import Foundation
import SwiftUI
import Combine
import SwiftyJSON

class Api {
    //get stocks
    func getStocks(urlString: String, completion: @escaping (Stocks) -> ()) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if (error == nil) {
                
            } else {
                print("error")
            }
            
            if response == nil {
                
            } else {
                print("response")
            }
         
            let stocks = try! JSONDecoder().decode(Stocks.self, from: data!)
            DispatchQueue.main.async {
                completion(stocks)
            }
        }.resume()
    }
    
    //get news
//    func getNews(urlString: String, completion: @escaping (News) -> ()) {
//        guard let url = URL(string: urlString) else {return}
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//
//            if (error == nil) {
//
//            } else {
//                print("error")
//            }
//
//            if response == nil {
//
//            } else {
//                print("response")
//            }
//
//
//
//            let news = try! JSONDecoder().decode(News.self, from: data!)
//            //        print(stocks.count)
//            DispatchQueue.main.async {
//                completion(news)
//            }
//        }.resume()
//    }
}


class StocksModel: ObservableObject {
    
    let urlString = "http://phisix-api3.appspot.com/stocks.json"
    
    @Published var data = [Stock]()
    
    init() {
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: urlString)!) { data, _, error in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
                let json = try! JSON(data: data!)
                let item = json["stocks"].array!
                
                for i in item {
                    let name = i["name"].stringValue
                    let description = i["description"].stringValue
                    let percent_change = i["percent_change"].stringValue
                    let content = i["content"].stringValue
                    let author = i["author"].stringValue
                    let publishedAt = i["publishedAt"].stringValue
                    
                    DispatchQueue.main.async {
                        self.data.append(Stock())
                    }
                }
            } .resume()
        
        }
    
    func addStock(stock: Stock) {
        data.append(stock)
    }
    
    func removeStock(stock: Stock) {
        data.removeAll { $0.id == stock.id }
    }
    
}
