//
//  FlickrSearchViewController.swift
//  FlickrSearchApp
//
//  Created by Michael Belenchenko on 14/06/2017.
//  Copyright © 2017 We. All rights reserved.
//

import UIKit

let searchCollectionViewCellIdentifier = "searchCollectionViewCellIdentifier"
let columnsNum = 3

class FlickrSearchViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: FlickrPresenter!
    
    var searchItems = [FlickrImage]()
    
    var cellRequests: [FlickrSearchCollectionViewCell : Cancallable] = [:]
    var cellImages: [FlickrSearchCollectionViewCell : FlickrImage] = [:]
    
    override func viewDidLoad() {
        self.searchBar.showsCancelButton = true
        
        self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 40.0, right: 0.0)
    }
    
    override func viewDidLayoutSubviews() {
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let dim = collectionView.frame.width / CGFloat(columnsNum) - 10
        flow.itemSize = CGSize(width: dim, height: dim)
    }
    
    func updateSearchItems(newItems: [FlickrImage]) {
        DispatchQueue.main.async {
            let diff = newItems.count - self.searchItems.count
            
            var newPathes = [IndexPath]()
            for i in 0..<diff {
                newPathes.append(IndexPath(row: i + self.searchItems.count, section: 0))
            }
            
            self.searchItems = newItems
            self.collectionView.insertItems(at: newPathes)
        }
    }
    
    func resetSearchItems() {
        DispatchQueue.main.async {
            self.searchItems = []
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let dim = size.width / CGFloat(columnsNum) - 10
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: dim, height: dim)
    }
}

extension FlickrSearchViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.bounds.size.height > scrollView.contentSize.height {
            self.presenter.loadMore()
        }
    }
}

extension FlickrSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.search(text: searchBar.text!)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.cancelSearch()
        searchBar.resignFirstResponder()
    }
}

extension FlickrSearchViewController: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchItems.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchCollectionViewCellIdentifier, for: indexPath) as! FlickrSearchCollectionViewCell
        cell.image = nil
        if let request = self.cellRequests[cell] {
            request.cancelIt()
            
        }
        let flickrImage = self.searchItems[indexPath.row]
        self.cellImages[cell] = flickrImage
        self.cellRequests[cell] = self.presenter.image(by: flickrImage)  { [weak self] (image, error)  in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                
                if let cellImage = strongSelf.cellImages[cell], cellImage == flickrImage {
                    cell.image = image
                }
                strongSelf.cellRequests[cell] = nil
            }
        }
        return cell
    }
}
