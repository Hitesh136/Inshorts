//
//  NewsCollectionViewCell.swift
//  inShorts
//
//  Created by Hitesh Agarwal on 11/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var _contentView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var headLineLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _contentView.layer.cornerRadius = 4.0
        _contentView.clipsToBounds = true 
    }
    
    func configureCell(_ news: News,_ index: Int) {
        headLineLabel.text = news.headeLine
        messageLabel.text = news.message
        newsImageView.image = UIImage(named: "news\(index)")
    }
}
