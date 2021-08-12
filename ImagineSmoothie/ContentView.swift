//
//  ContentView.swift
//  ImagineSmoothie
//
//  Created by User on 12/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var feedViewModel = FeedsViewModel()
    
    var body: some View {
        ScrollView{
            if let allFeeds = feedViewModel.feeds{
                ForEach(allFeeds, id: \.self) { feedItem in
                    getView(feedItem: feedItem)
                }
            }
        }
    }
    
    func getView(feedItem:FeedItem) ->  AnyView{
        var view:AnyView!
        switch feedItem.item_type {
        case .text:
            view = AnyView(TextCell(text: feedItem.data).frame(width: UIScreen.main.bounds.size.width - 20, height: 300, alignment: .center).padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)))
            break
        case .image:
            view = AnyView(ImageCell(url: feedItem.data)
                            .frame(width: UIScreen.main.bounds.size.width - 20, height: 300, alignment: .center).padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)))
        break
        case .url:
            view = AnyView(TextCell(text: feedItem.data).frame(width: UIScreen.main.bounds.size.width - 20, height: 300, alignment: .center).padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)))
        break
        case .video:
            view = AnyView(VideoCell(url:feedItem.data).frame(width: UIScreen.main.bounds.size.width - 20, height: 300, alignment: .center).padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)))
        break
        default:
            break
        }
        
        return view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
