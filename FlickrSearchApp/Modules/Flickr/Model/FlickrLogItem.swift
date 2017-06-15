//
//  FlickrLogItem.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

struct FlickrLogItem {
    let text: String
    let date: Date
    
    init(text: String, date: Date) {
        self.text = text
        self.date = date
    }
}
