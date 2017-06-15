//
//  FlickrAPIService.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrAPIService {
    var privateStorage: PrivateStorage!
    
    func searchItems(by text: String, page: Int, callback: @escaping ([FlickrImage]?, Error?) -> ()) -> Cancallable {
        let parameteres = [APIConstants.methodKey : APIConstants.methodSearch, APIConstants.apiKey : privateStorage.apiKey, APIConstants.formatKey : APIConstants.jsonFormat, APIConstants.noJsonCallbackKey : APIConstants.flagEnabled, APIConstants.safeSearchKey : APIConstants.flagEnabled, APIConstants.textKey : text, APIConstants.pageKey : page.description]
        return Requester.request(path: APIConstants.apiRoot, method: APIConstants.getMethod, parameters: parameteres, placeholders: [:], mapper: JSONParser.parseSearchResults) { (result, error) in
            callback(result as? [FlickrImage], error)
        }
    }
}
