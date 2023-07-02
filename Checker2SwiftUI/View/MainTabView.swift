//
//  MainTabView.swift
//  Checker2SwiftUI
//
//  Created by bmtech on 18.04.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selected = 0
    
    var body: some View {
        
        VStack {
            Button {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            } label: {
                Text("logout")
            }

            
            switch selected {
            case 0:
                NewsView()
            case 1:
                FavoritesView()
            case 2:
                StocksView()
            default:
                NewsView()
            }
            
            Spacer()
            HStack {
                Spacer(minLength: 12)
                Button {
                    print("News")
                    NewsView()
                    self.selected = 0
                } label: {
                    Image("news")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
                .foregroundColor(self.selected == 0 ? .black : .gray).colorInvert()

                Spacer(minLength: 12)

                Button {
                    print("Bookmarks")
                    self.selected = 1
                } label: {
                    Image("bookmarks")
                        .resizable()
                        .frame(width: 36, height: 36)
                }.foregroundColor(self.selected == 1 ? .black : .gray).colorInvert()

                Spacer(minLength: 12)

                Button {
                    print("Stocks")
                    self.selected = 2
                } label: {
                    Image("stocks")
                        .resizable()
                        .frame(width: 36, height: 36)
                }.foregroundColor(self.selected == 2 ? .black : .gray).colorInvert()

                Spacer(minLength: 12)

            }
        }

    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
