//
//  FlickrHistoryViewController.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

let cellIdentifier = "historyCellIdentifier"

class FlickrHistoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: FlickrPresenter!
    let dateFormatter = DateFormatter()

    var items = [FlickrLogItem]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dateFormatter.dateFormat = "mm/dd/yy hh:mm:ss"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
    }
    
    func updateItems(items: [FlickrLogItem]) {
        DispatchQueue.main.async {
            self.items = items
            self.tableView?.reloadData()
        }
    }
}

extension FlickrHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
        }
        cell!.textLabel?.text = self.items[indexPath.row].text
        cell!.detailTextLabel?.text = dateFormatter.string(from: self.items[indexPath.row].date)
        
        return cell!
    }
}
