//
//  PrelabRunViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 3/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class PrelabRunViewController: UIViewController {
    
    let NUM_ROW: Int = 3
    let NUM_COL: Int = 2
    let OFFSET: Int = 66

    var mTimer: Timer?
    var mScreenWidth: Int = 0
    var mScreenHeight: Int = 0
    var mNumDots: Int = 0
    var mCurrentCircle: CircleView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mScreenSize = UIScreen.main.bounds
        
        mScreenWidth = Int(mScreenSize.maxX) - 2 * OFFSET
        mScreenHeight = Int(mScreenSize.maxY) - 2 * OFFSET
        
        mTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerTicked), userInfo: nil, repeats: true)
    }
    
    @objc func timerTicked() {
        if (mNumDots >= NUM_ROW * NUM_COL) {
            mTimer?.invalidate()
            
            self.performSegue(withIdentifier: "PrelabRunToPrelab", sender: self)
        }
        else {
            let x = (mScreenWidth / (NUM_COL - 1)) * (mNumDots % NUM_COL) + OFFSET
            let y = (mScreenHeight / (NUM_ROW - 1)) * (mNumDots / NUM_COL) + OFFSET
            
            mCurrentCircle?.removeFromSuperview()
            
            let circleView = CircleView(frame: CGRect(x: x, y: y, width: 25, height: 25))
            view.addSubview(circleView)
            
            mCurrentCircle = circleView
            mNumDots += 1
        }
    }
}
