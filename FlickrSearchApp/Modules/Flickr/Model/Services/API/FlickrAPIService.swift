//
//  FlickrAPIService.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrAPIService {
    var privateStorage: FlickrPrivateStorage!
    
    func searchItems(by text: String, page: Int, callback: @escaping ([FlickrImage]?, Error?) -> ()) -> Cancallable {
        let parameteres = [FlickrAPIConstants.methodKey : FlickrAPIConstants.methodSearch, FlickrAPIConstants.apiKey : privateStorage.apiKey, FlickrAPIConstants.formatKey : FlickrAPIConstants.jsonFormat, FlickrAPIConstants.noJsonCallbackKey : FlickrAPIConstants.flagEnabled, FlickrAPIConstants.safeSearchKey : FlickrAPIConstants.flagEnabled, FlickrAPIConstants.textKey : text, FlickrAPIConstants.pageKey : page.description]
        return Requester.requestJSON(path: FlickrAPIConstants.apiRoot, method: FlickrAPIConstants.getMethod, parameters: parameteres, placeholders: [:], mapper: FlickrJSONParser.parseSearchResults) { (result, error) in
            callback(result as? [FlickrImage], error)
        }
    }
    
    func loadImage(image: FlickrImage, callback: @escaping (UIImage?, Error?) -> ()) -> Cancallable {
        let placeholders = [FlickrAPIConstants.farmPlaceholder : image.farm.description, FlickrAPIConstants.serverPlaceholder : image.server, FlickrAPIConstants.idPlaceholder : image.id, FlickrAPIConstants.secretPlaceholder : image.secret]
        
        return Requester.requestData(path: FlickrAPIConstants.farmRoot, method:FlickrAPIConstants.getMethod , parameters: [:], placeholders: placeholders, completion: { (res, error) in
            guard let data = res as? Data, error == nil else {
                callback(nil, error)
                return
            }
            callback(UIImage(data: data), nil)
        })
    }
}
