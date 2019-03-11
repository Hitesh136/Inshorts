//
//  DetailsViewController.swift
//  inShorts
//
//  Created by Hitesh Agarwal on 11/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var link: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func loadWebView() {
        if let url = URL(string: link) {
            webView.load(URLRequest(url: url))
        } else {
            let url = URL(string: "http://google.com")!
            webView.load(URLRequest(url: url))
        }
    }

}
