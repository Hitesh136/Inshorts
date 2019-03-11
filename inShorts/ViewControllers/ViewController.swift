//
//  ViewController.swift
//  inShorts
//
//  Created by Hitesh  Agarwal on 3/10/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var pageSize: CGSize = {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        return CGSize(width: screenWidth, height: screenHeight)
    }()
    
    let categoriesViewController: UINavigationController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let categoriesViewController = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        let navigationController = UINavigationController(rootViewController: categoriesViewController)
        return navigationController
    }()
    
    let newViewController: NewsViewController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newsViewController = storyBoard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        return newsViewController
    }()
    
    let detailViewController: DetailsViewController = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        return detailViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
    }

    func configureScrollView() {
        categoriesViewController.view.frame = frame(index: 0)
        scrollView.addSubview(categoriesViewController.view)
        
        newViewController.view.frame = frame(index: 1)
        scrollView.addSubview(newViewController.view)
        
        detailViewController.view.frame = frame(index: 2)
        scrollView.addSubview(detailViewController.view)
        
        scrollView.contentSize = CGSize(width: pageSize.width * 3, height: pageSize.height)
    }
}

extension ViewController {
    func frame(index: CGFloat) -> CGRect {
        return CGRect(x: pageSize.width * index, y: 0, width: pageSize.width, height: pageSize.height)
    }
}

