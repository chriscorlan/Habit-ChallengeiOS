//
//  WebViewViewController.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 12/26/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKUIDelegate {

    var webURL = ""
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.empowerministry.org/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
