//
//  ImageCell.swift
//  ImagineSmoothie
//
//  Created by User on 12/08/21.
//

import Foundation
import SwiftUI

struct ImageCell:View {
    
    let url:String!
    
    @State private var image:Image?
    
    var body: some View{
            VStack{
                AnyView(image).padding(.all, 2)
            }.cornerRadius(10.0)
            .background(Color.gray)
            .onAppear(){
                self.downloadImage()
            }
        }
    
    func downloadImage(){
        if let imageUrl =  URL(string: url) {
            URLSession.shared.dataTask(with:imageUrl) { data, response, error in
                    if let data = data, data.count > 0 {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.image =  Image(uiImage: image).resizable()
                            }
                        }
                    }
            }.resume()
        }
    }
    
}
