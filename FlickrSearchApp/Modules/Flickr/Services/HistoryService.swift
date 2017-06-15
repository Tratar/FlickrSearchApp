//
//  HistoryService.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

// HistoryService keeps history in memory. I'd considered using persistent storage if needen.
class HistoryService {

    private var historyList = [LogItem]()
    private let lock = NSLock()
    
    func list() -> [LogItem] {
        self.lock.lock()
        defer {
            self.lock.unlock()
        }
        
        return historyList
    }
    
    func append(logItem: LogItem) {
        self.lock.lock()
        defer {
            self.lock.unlock()
        }
        
        historyList.append(logItem)
    }
}
