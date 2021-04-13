//
//  HomeView.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI

struct HomeView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    PostListView(category: .forYou)
                        .frame(width: UIScreen.main.bounds.width)
                    PostListView(category: .trend)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .listStyle(PlainListStyle())
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("Home", displayMode: .inline)

        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
