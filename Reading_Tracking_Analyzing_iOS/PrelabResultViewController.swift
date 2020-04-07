//
//  PrelabResultViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 4/7/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class PrelabResultViewController: UIViewController {
    
    let X_POS: Array<Float> = [0.1, 0.9, 0.5, 0.1, 0.9]
    let Y_POS: Array<Float> = [0.1, 0.1, 0.5, 0.9, 0.9]

    var mTimer: Timer?
    var mScreenWidth: Int = 0
    var mScreenHeight: Int = 0
    var mNumDots: Int = 0
    var mCurrentCircle: RedCircleView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mScreenSize = UIScreen.main.bounds
        
        mScreenWidth = Int(mScreenSize.maxX)
        mScreenHeight = Int(mScreenSize.maxY)
        
        mTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerTicked), userInfo: nil, repeats: true)
    }
    
    @objc func timerTicked() {
        if (mNumDots >= X_POS.count) {
            mTimer?.invalidate()
            
            self.performSegue(withIdentifier: "PrelabRunToPrelabResult", sender: self)
        }
        else {
            let x = Int(Float(mScreenWidth) * X_POS[mNumDots])
            let y = Int(Float(mScreenHeight) * Y_POS[mNumDots])
            
            mCurrentCircle?.removeFromSuperview()
            
            let circleView = RedCircleView(frame: CGRect(x: x, y: y, width: 25, height: 25))
            view.addSubview(circleView)
            
            mCurrentCircle = circleView
            mNumDots += 1
        }
    }
}
