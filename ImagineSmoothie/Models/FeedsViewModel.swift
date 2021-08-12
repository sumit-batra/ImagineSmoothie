//
//  FeedsViewModel.swift
//  ImagineSmoothie
//
//  Created by User on 12/08/21.
//

import Foundation
import FirebaseDatabase

enum FeedType:String{
    case text, url, image, video, other
}

class FeedsViewModel:ObservableObject{
    
    @Published var feeds:[FeedItem]?
    private var database = Database.database()
    
    init() {
        fetchFeeds()
    }
    
    func fetchFeeds(){
        var response:[AnyObject]?
        let ref = database.reference(withPath: "feeds")
        ref.observe(.value, with: {[weak self] snapshot in
            print(snapshot.value as Any)
            response = snapshot.value as? [AnyObject]
            
            guard let data = response, data.count > 0 else {
                return
            }
            
            self?.feeds = data.map({ feedObj in
                if let dataStr = feedObj["data"] as? String, let itemType = feedObj["item_type"] as? String{
                    let feedItem = FeedItem(data: dataStr, item_type: FeedType(rawValue: itemType))
                    return feedItem
                }
                return FeedItem(data: "", item_type: .other)
            })
            
        })
        
        
    }
    
}
