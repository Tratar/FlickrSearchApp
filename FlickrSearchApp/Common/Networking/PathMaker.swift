//
//  PathMaker.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 19/02/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class PathMaker {
    class func makePath(for path: String, placeholders: [String: CustomStringConvertible]) -> String {
        var result = path
        for (key, value) in placeholders {
            result = result.replacingOccurrences(of: "\(key)", with: value.description)
        }
        return result
    }
}
