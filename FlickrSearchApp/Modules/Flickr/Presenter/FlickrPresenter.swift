//
//  FlickrPresenter.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

let perPage = 100

class FlickrPresenter {
    
    var interactor: FlickrInteractor!
    
    var searchResult = [FlickrImage]()
    var historyItems = [FlickrLogItem]()
    
    var uiSearch: FlickrSearchViewController!
    var uiHistory: FlickrHistoryViewController!
    
    var searchRequest: Cancallable? {
        didSet {
            UIApplication.shared.isNetworkActivityIndicatorVisible = searchRequest != nil
        }
    }
    
    var searchSession: String = ""
    var pageToLoad = 1
    var text = ""
    
    func search(text: String) {
        self.cancelSearch()
        
        self.text = text
        self.loadImages(text: text, page: self.pageToLoad)
    }
    
    func loadMore() {
        guard text != "", self.searchRequest == nil else {
            return
        }
        self.loadImages(text: self.text, page: self.pageToLoad)
    }
    
    func image(by image: FlickrImage, callback: @escaping (UIImage?, Error?) -> ()) -> Cancallable {
        return interactor.image(by: image, callback: callback)
    }
    
    func loadImages(text: String, page: Int) {
        let session = self.searchSession
        self.searchRequest = self.interactor.searchImages(by: text, page: self.pageToLoad) { (result, _) in
            if let result = result, self.searchSession == session {
                self.searchResult.append(contentsOf: result)
                self.uiSearch.updateSearchItems(newItems: self.searchResult)
                if result.count == perPage {
                    self.pageToLoad += 1
                }
            }
            self.searchRequest = nil
        }
        self.historyItems = self.interactor.historyItems()
        self.uiHistory.updateItems(items: self.historyItems)
    }
    
    func cancelSearch() {
        if let searchRequest = self.searchRequest {
            searchRequest.cancelIt()
        }
        
        self.searchResult = []
        self.pageToLoad = 1
        self.searchSession = UUID().uuidString
        self.text = ""
        self.searchRequest = nil
        
        self.uiSearch.resetSearchItems()
    }
}
