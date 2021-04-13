//
//  PostListView.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI
import UIKit

struct PostListView: View {
    let category: PostListCategory
    
    var postList: PostList {
        switch category {
        case .forYou:
            return loadPostListData("PostListData_forYou_1.json")
        case .trend:
            return loadPostListData("PostListData_trend_1.json")
        }
    }
    

    var body: some View {
        
        List {
            ForEach(self.postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post:post)) {
                            EmptyView()
                    }
                    .hidden()
                }
                
               .listRowInsets(EdgeInsets())
            }
        }
        
    }
}

struct SNSView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .forYou)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
        
    }
}
