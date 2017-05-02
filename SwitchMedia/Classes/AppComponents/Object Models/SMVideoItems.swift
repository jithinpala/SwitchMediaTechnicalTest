//
//  SMVideoItems.swift
//  SwitchMediaTechnicalTest
//
//  Created by Jithin on 2/5/17.
//  Copyright © 2017 Jithinpala. All rights reserved.
//

import UIKit
import Foundation

class SMVideoItems: NSObject {
    
    var contentItems = NSMutableArray()
    
    public init(withDictionary dic: [Dictionary<String, String>]) {
        
        //imageUrl = dictionary["title"] as? String
        let urlItems: NSMutableArray = NSMutableArray()
        for items in dic {
            let imageUrl = SMTileUrlItem(stringValue: items["imageUrl"]!)
            urlItems.add(imageUrl)
        }
        self.contentItems = urlItems
        //print(contentItems.count)
        
    }

}
