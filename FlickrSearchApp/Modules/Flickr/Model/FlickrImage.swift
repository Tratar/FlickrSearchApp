//
//  FlickrSearchResult.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

struct FlickrImage {
    let id: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    
    init(id: String, secret: String, server: String, farm: Int, title: String) {
        self.id = id
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
    }
}

extension FlickrImage: Equatable {
    public static func ==(lhs: FlickrImage, rhs: FlickrImage) -> Bool {
        return lhs.id == rhs.id
    }
}
