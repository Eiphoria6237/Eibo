//
//  HomeNavigationBar.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI
import UIKit

private let kLabelWidth:CGFloat = 80
private let kLabelHeight:CGFloat = 24


struct HomeNavigationBar: View {
    var leftPercent:CGFloat //0 for left, 1 for right
    
    var body: some View {
        
        VStack(spacing:3) {
            HStack(spacing:0) {
                Text("ForYou")
                    .bold()
                    .frame(width: kLabelWidth, height: kLabelHeight)
                    .padding(.top, 5)
                    
                Spacer()
                Text("Trend")
                    .bold()
                    .frame(width: kLabelWidth, height: kLabelHeight)
                    .padding(.top,5)
            }
            .font(.system(size:20))
            
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(.orange)
                    .frame(width: 30, height: 4)
                    .offset(
                        x: geo.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent))
            }
            .frame(height:6)
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.5)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
