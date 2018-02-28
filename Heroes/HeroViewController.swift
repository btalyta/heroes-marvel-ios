//
//  HeroViewController.swift
//  Heroes
//
//  Created by Bárbara Souza on 27/02/18.
//  Copyright © 2018 Bárbara Souza. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero : Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: self.hero.urls.first!.url)
        let request = URLRequest(url: url!)
        self.title = self.hero.name
        
        self.webView.allowsBackForwardNavigationGestures = true
        self.webView.navigationDelegate = self
        self.webView.load(request)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension HeroViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loading.stopAnimating()
    }
}
