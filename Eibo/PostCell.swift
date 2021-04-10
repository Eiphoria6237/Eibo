//
//  PostCell.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment:.leading, spacing:10) {
            HStack(spacing:5) {
                
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(vip:post.vip)
                            .offset(x: 16, y: 16))
                
                VStack(alignment:.leading, spacing: 5) {
                    Text(post.name)
                        .font(.system(size:16))
                        .foregroundColor(.red)
                        .lineLimit(1)
                    
                    Text(post.date)
                        .font(.system(size:11))
                        .foregroundColor(.gray)
                }
                .padding(.leading,10)
                
                if !post.isFollowed {
                    Spacer()
                    
                    Button(action: {
                        print("Click follow button")
                    }, label: {
                        Text("follow")
                            .font(.system(size:14))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26)
                            .overlay(
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .stroke(Color.orange, lineWidth: 1)
                            )

                    })
                    
                }
               
            }
            
            Text(post.text)
                .font(.system(size:17))
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width-30)
            }
            
            Divider()
            
            HStack(spacing:0) {
                Spacer()
                PostCellToolbarButton(image:"message",text:post.commentCountText,color:.black) {
                    print("Click Comment button")
            
                }
                
                Spacer()
                
                PostCellToolbarButton(image:"heart",text:post.likeCountText,color:.black) {
                    print("Click Like button")
                }
                
                Spacer()
                
            }
            .buttonStyle(BorderlessButtonStyle())
            
            Rectangle()
                .padding(.horizontal,-15)
                .frame(height:10)
                .foregroundColor(.gray)
                .opacity(0.2)
        }
        .padding(.horizontal,15)
        .padding(.top,15)
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post:postList.list[4])
    }
}
