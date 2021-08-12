//
//  TextCell.swift
//  ImagineSmoothie
//
//  Created by User on 12/08/21.
//

import Foundation
import SwiftUI

struct TextCell:View {
    
    let text:String!
    
    var body: some View{
            ZStack{
                Rectangle().fill(Color.gray)
                Text("\(text)").foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
            }.cornerRadius(10.0)
        }
}
