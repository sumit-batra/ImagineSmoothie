//
//  VideoCell.swift
//  ImagineSmoothie
//
//  Created by User on 12/08/21.
//

import Foundation
import SwiftUI
import AVFoundation
import AVKit

struct VideoCell:View {
    
    let url:String!
    
    @State private var image:Image?
    
    var body: some View{
            VStack{
                VideoPlayer(player: AVPlayer(url:  URL(string: url)!))
                .padding(.all, 2)
            }.cornerRadius(10.0)
            .background(Color.gray)
        }
}
