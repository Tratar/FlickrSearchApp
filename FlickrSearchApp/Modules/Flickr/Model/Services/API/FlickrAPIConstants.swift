//
//  FlickrAPIConstants.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

public class FlickrAPIConstants {

    static let apiRoot = "https://api.flickr.com/services/rest/"                                // GET method
    static let farmRoot = "https://farm{farm}.static.flickr.com/{server}/{id}_{secret}.jpg"     // GET method
    
    static let getMethod = "GET"
    
    static let apiKey = "api_key"
    static let methodKey = "method"
    static let formatKey = "format"
    static let pageKey = "page"
    static let textKey = "text"
    static let safeSearchKey = "safe_search"
    static let noJsonCallbackKey = "nojsoncallback"
    
    static let flagEnabled = "1"
    static let flagDisabled = "0"
    
    static let methodSearch = "flickr.photos.search"
    
    static let jsonFormat = "json"
    
    static let farmPlaceholder = "{farm}"
    static let serverPlaceholder = "{server}"
    static let idPlaceholder = "{id}"
    static let secretPlaceholder = "{secret}"
}
