//
//  FlickrInteractor.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrInteractor: NSObject {
    var APIService: FlickrAPIService!
    var historyService: FlickrHistoryService!
    
    func searchImages(by text: String, page: Int, callback:@escaping ([FlickrImage]?, Error?)->()) -> Cancallable {
        
        historyService.append(logItem: FlickrLogItem(text: text, date: Date()))
        return APIService.searchItems(by: text, page: page, callback: callback)
    }
    
    func image(by image: FlickrImage, callback: @escaping (UIImage?, Error?) -> ()) -> Cancallable {
        return APIService.loadImage(image: image, callback: callback)
    }
    
    func historyItems() -> [FlickrLogItem] {
        return historyService.list()
    }
}
