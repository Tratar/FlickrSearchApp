//
//  JSONParser.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 15/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

let photosKey = "photos"
let photoKey = "photo"
let idKey = "id"
let secretKey = "secret"
let serverKey = "server"
let farmKey = "farm"
let titleKey = "title"

class JSONParser {
    static func parseSearchResults(data: Any) -> Any {
        guard let dict = data as? [String: Any], let photos = dict[photosKey] as? [String: Any], let photo = photos[photoKey] as? [[String: Any]] else {
            return []
        }
    
        return photo.map(parseSearchResult)
    }

    static func parseSearchResult(data: [String : Any]) -> Any {
        let id = data[idKey] as! String
        let secret = data[secretKey] as! String
        let server = data[serverKey] as! String
        let farm = data[farmKey] as! Int
        let title = data[titleKey] as! String
        return FlickrImage(id: id, secret: secret, server: server, farm: farm, title: title)
    }
}
