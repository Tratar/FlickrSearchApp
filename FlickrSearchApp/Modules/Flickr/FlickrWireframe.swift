//
//  FlickrWireframe.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class FlickrWireframe {
    var flickrInteractor: FlickrInteractor!
    var window: UIWindow!
    
    func presentFlickrSearch() {
        let presenter = FlickrPresenter()
        presenter.interactor = flickrInteractor
        
        let storyboard = UIStoryboard(name: "FlickrStoryboard", bundle: nil)
        
        let viewController = storyboard.instantiateInitialViewController() as! FlickrViewController
        viewController.historyViewController.presenter = presenter
        viewController.searchViewController.presenter = presenter
        
        presenter.uiHistory = viewController.historyViewController
        presenter.uiSearch = viewController.searchViewController
        
        let navigationController = self.window.rootViewController as! UINavigationController
        navigationController.setViewControllers([viewController], animated: false)
    }
}
