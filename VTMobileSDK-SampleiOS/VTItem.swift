//
//  VTItem.swift
//  VTMobileSDK-SampleiOS
//
//  Created by Muhammad Anis on 2/13/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

import Foundation

func ==(lhs: VTItem, rhs: VTItem) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

class VTItem : Hashable{
    
    var id : String
    var imageName : String
    var name : String
    var price : Int
    
    init(id: String, imageName: String, name: String, price: Int){
        self.id = id
        self.imageName = imageName
        self.name = name
        self.price = price
    }
    
    var hashValue : Int{
        get{
            return self.id.hash
        }
    }
    
}
