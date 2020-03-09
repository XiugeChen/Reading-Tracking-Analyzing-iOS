//
//  PrelabRunViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 3/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class PrelabRunViewController: UIViewController {
    
    var mTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerTicked), userInfo: nil, repeats: false)
    }
    
    @objc func timerTicked() {
        mTimer?.invalidate()
        
        self.performSegue(withIdentifier: "PrelabRunToPrelab", sender: self)
    }
}
