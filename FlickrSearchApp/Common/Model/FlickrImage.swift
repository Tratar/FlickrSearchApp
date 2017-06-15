//
//  SearchResult.swift
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

extension FlickrImage {
    var url: URL {
        get {
            return URL(string: PathMaker.makePath(for: APIConstants.farmRoot, placeholders: [APIConstants.farmPlaceholder : self.farm, APIConstants.serverPlaceholder : self.server, APIConstants.idPlaceholder : self.id, APIConstants.secretPlaceholder : self.secret]))!
        }
    }
}
