//
//  FlickrHistoryService.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

// FlickrHistoryService keeps history in memory. I'd considered using persistent storage if needen.
class FlickrHistoryService {

    private var historyList = [FlickrLogItem]()
    private let lock = NSLock()
    
    func list() -> [FlickrLogItem] {
        self.lock.lock()
        defer {
            self.lock.unlock()
        }
        
        return historyList
    }
    
    func append(logItem: FlickrLogItem) {
        self.lock.lock()
        defer {
            self.lock.unlock()
        }
        
        historyList.append(logItem)
    }
}
