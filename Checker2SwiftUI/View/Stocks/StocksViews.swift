//
//  StocksViews.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 19.06.2023.
//

import SwiftUI

struct StocksViews: View {
    
    @State var stocks: [Stock] = []
    @State var stocksFavorites: [Stocks] = []
    @State var index = 0
    
    let urlFirst = "http://phisix-api3.appspot.com/stocks.json"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Count: \(stocks.count)")
                HStack{
                    Button {
                        //
                    } label: {
                        Text("All")
                    }
                    Button {
                        //
                    } label: {
                        Text("Favorites")
                    }

                }
                List(stocks) {
                    stock in
                    HStack{
                        Text(stock.name)
                        Spacer()
                        Text(String(stock.price.amount))
                        Spacer()
                        Text(String(stock.percent_change))
                            .foregroundColor(stock.percent_change < 0 ? .red : .green)
                    }.background( Color.gray.opacity(0.4))
                }
                .onAppear() {
                    Api().getStocks(urlString: urlFirst) { stocks in
                        self.stocks = stocks.stock
                    }
                }
            } .navigationTitle("Stocks")
        }
    }
}

struct StocksViews_Previews: PreviewProvider {
    static var previews: some View {
        StocksViews()
    }
}
