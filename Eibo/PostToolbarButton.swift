//
//  PostToolbarButton.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let image:String
    let text:String
    let color:Color
    let action:() -> Void
    
    
    var body: some View {
        Button(action: action, label: {
            HStack(spacing:5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width:18,height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        })
        .foregroundColor(color)
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "Like", color: .red) {
            print("Liked")
        }
    }
}
