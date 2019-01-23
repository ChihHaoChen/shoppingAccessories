//
//  Product.swift
//  shoppingAccessories
//
//  Created by chihhao on 2019-01-19.
//  Copyright © 2019 ChihHao. All rights reserved.
//

import Foundation

struct Product  {
    private(set) var title: String
    private(set) var price: String
    private(set) var imageName: String
    
    init(title: String, price: String, imageName: String) {
        self.title = title
        self.price = price
        self.imageName = imageName
    }
}
