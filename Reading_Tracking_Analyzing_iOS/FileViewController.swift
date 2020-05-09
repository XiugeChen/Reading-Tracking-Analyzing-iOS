//
//  FileViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/8/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import WebKit

class FileViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, UIScrollViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.scrollView.delegate = self
        
        let url: URL! = URL(string: "https://arxiv.org/pdf/1505.01731.pdf")
        webView.load(URLRequest(url: url))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroll: %f, %f", scrollView.contentOffset.x, scrollView.contentOffset.y)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("Zoom: %f", scrollView.zoomScale)
    }
}
