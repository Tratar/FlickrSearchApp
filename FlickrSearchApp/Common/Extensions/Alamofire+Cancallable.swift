//
//  Alamofire+Cancallable.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 15/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit
import Alamofire

extension Alamofire.Request: Cancallable {
    func cancelIt() {
        self.cancel()
    }
}
