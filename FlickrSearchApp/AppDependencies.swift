//
//  AppDependencies.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

class AppDependencies {
    let flickrHistorySevice = FlickrHistoryService()
    let flickrPrivateStorage = FlickrPrivateStorage()
    let flickrAPIService = FlickrAPIService()
    
    let flickrWireframe = FlickrWireframe()
    let flickrInteractor = FlickrInteractor()
    
    func configureDependencies(window: UIWindow) {
        
        flickrAPIService.privateStorage = self.flickrPrivateStorage
        
        flickrInteractor.historyService = flickrHistorySevice
        flickrInteractor.APIService = flickrAPIService
        
        flickrWireframe.flickrInteractor = flickrInteractor
        flickrWireframe.window = window
    }
    
    func presentFlickrSearchScreen() {
        flickrWireframe.presentFlickrSearch()
    }
}
