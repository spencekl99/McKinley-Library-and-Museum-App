//  ViewController.swift
//  McKinley Library and Museum was created by The Cabinet – Copyright © 2022

import UIKit
import WebKit

class ViewController: UIViewController, UIScrollViewDelegate, WKUIDelegate {
    
    //var wv: WKWebView!
    var webView = WKWebView()
    
    override func loadView() {
        let wc = WKWebViewConfiguration()
        wc.allowsInlineMediaPlayback = true
        wc.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: .zero, configuration: wc)
        webView.uiDelegate = self
        webView.scrollView.bounces = false
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.delegate = self
        webView.isOpaque = false
        webView.isHidden = false
        
        // Make view extend to notch and bottom of display
        webView.scrollView.contentInsetAdjustmentBehavior = .never;
        view = webView
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "/html/index", withExtension: "html")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        webView.translatesAutoresizingMaskIntoConstraints = false;
    }
}
