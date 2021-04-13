//
//  HomeNavigationBar.swift
//  Eibo
//
//  Created by LIU SHURUI on 2021/04/10.
//

import SwiftUI

private let kLabelWidth:CGFloat = 65
private let kButtonHeight:CGFloat = 24


struct HomeNavigationBar: View {
    @State var leftPercent:CGFloat //0 for left, 1 for right
    
    var body: some View {
        
        HStack(alignment:.top,spacing:0) {
            Button(action:{
                print("Click camera button")
            }, label:{
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            })
            
            Spacer()
            
            
            VStack(spacing:3) {
                HStack(spacing:0) {
                    
                    Text("ForYou")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 0
                            }
                            
                        }
                        
                    Spacer()
                    
                    Text("Trend")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top,5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation{
                                self.leftPercent = 1
                            }
                            
                            //ontab动作不会改变背景色
                        }
                }
                .font(.system(size:20))
                
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x:0.25 * kLabelWidth + self.leftPercent * (geo.size.width * 0.5 + kLabelWidth * 0.55) )
                        
                }
                
                .frame(height:6)
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            
            Spacer()
            
            Button(action:{
                print("Click camera button")
            }, label:{
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal,15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            })
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
