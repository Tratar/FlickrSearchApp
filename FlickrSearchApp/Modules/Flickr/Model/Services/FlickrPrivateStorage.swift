//
//  FlickrPrivateStorage.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrPrivateStorage: NSObject {
    //Not secured. Be careful. It's better not to do in this way.
    var apiKey: String {
        get {
            return "f82731c9741ed6a0fce99414856332d1"
        }
    }
    
    var secret: String {
        get {
            return "6cacf315ae2e763f"
        }
    }
}
