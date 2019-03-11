
//
//  NewsViewController.swift
//  inShorts
//
//  Created by Hitesh Agarwal on 11/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrNews = NewsData.all
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        cell.configureCell(arrNews[indexPath.row], indexPath.row)
        return cell
    }
}

