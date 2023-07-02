//
//  NetworkService.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 24.04.2023.
//

import Foundation

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

