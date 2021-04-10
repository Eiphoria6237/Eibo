//
//  PostListView.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI
import UIKit

struct PostListView: View {
 
    var body: some View {
        
        List {
            ForEach(postList.list) { post in
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
            PostListView()
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
        
    }
}
