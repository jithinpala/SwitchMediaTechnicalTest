//
//  SMTileUrlItem.swift
//  SwitchMediaTechnicalTest
//
//  Created by Jithin on 2/5/17.
//  Copyright © 2017 Jithinpala. All rights reserved.
//

import UIKit
import Foundation


class SMTileUrlItem: NSObject {
    
    var imageUrl:String?
    var channelName: String?
    
    public override init() {
        
        imageUrl =  ""
        
    }
    
    public init(stringValue: String) {
        
        imageUrl = stringValue
        channelName = "Asset \(Helper.sharedInstance.generateRandomNumber())"
        
    }
    
//    public init(withDictionary dic: [Dictionary<String, String>]) {
//        for items in dic {
//            print(items)
//        }
//    }

}
