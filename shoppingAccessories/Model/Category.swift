//
//  Category.swift
//  shoppingAccessories
//
//  Created by chihhao on 2019-01-19.
//  Copyright © 2019 ChihHao. All rights reserved.
//

import Foundation

struct Category {
    private(set) var title: String
    private(set) var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
