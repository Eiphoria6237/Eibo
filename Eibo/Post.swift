//
//  Post.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import Foundation
import SwiftUI


struct PostList:Codable {
    var list:[Post]
}

struct Post:Codable, Identifiable {
    
    let id :Int
    let avatar:String
    let name:String
    var isFollowed:Bool
    var vip:Bool
    var date:String
    
    let text:String
    let images:[String]
    
    let commentCount:Int
    let likeCount:Int
    var isLiked:Bool
    
    
}

extension Post {
    
    var avatarImage:Image {
        return loadImage(name: avatar)
    }
    
    var commentCountText:String {//calculative property
        if commentCount<=0 {return "Comment"}
        if commentCount < 1000 {return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount)/1000)
    }
    
    var likeCountText:String {//calculative property
        if likeCount<=0 {return "Like"}
        if likeCount < 1000 {return "\(likeCount)"}
        return String(format: "%.1fk", Double(likeCount)/1000)
    }
    
}

let postList = loadPostListData("PostListData_recommend_1.json")

func loadPostListData(_ fileName:String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("cannot find \(fileName)")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("cannot load \(url)")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("cannot decode post list json data")
    }
    return list
}

func loadImage(name:String) -> Image {
    return Image(uiImage: UIImage(named:name)!)
}
