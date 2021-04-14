//
//  HomeView.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI

struct HomeView: View {
    @State var leftPercent:CGFloat = 0
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                HScrollViewController(pageWidth: geo.size.width, contentSize: CGSize(width: geo.size.width * 2 , height: geo.size.height), leftPercent:self.$leftPercent)
                {
            
                HStack(spacing: 0) {
                    PostListView(category: .forYou)
                        .frame(width: UIScreen.main.bounds.width)
                    PostListView(category: .trend)
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .listStyle(PlainListStyle())
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("Home", displayMode: .inline)

        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
