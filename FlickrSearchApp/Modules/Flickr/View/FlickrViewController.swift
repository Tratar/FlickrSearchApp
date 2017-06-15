//
//  FlickrViewController.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrViewController: UITabBarController {
    
    var searchViewController: FlickrSearchViewController {
        get {
            return self.viewControllers![0] as! FlickrSearchViewController
        }
    }
    
    var historyViewController: FlickrHistoryViewController {
        get {
            return self.viewControllers![1] as! FlickrHistoryViewController
        }
    }
}
