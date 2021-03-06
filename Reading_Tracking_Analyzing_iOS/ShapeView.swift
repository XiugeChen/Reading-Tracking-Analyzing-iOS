//
//  CircleView.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 3/14/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var mColor: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
        
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let context = UIGraphicsGetCurrentContext() {
               
           // Set the circle outerline-width
           context.setLineWidth(5.0);
           
            // Set the circle outerline-colour
            switch(mColor) {
            case "red":
                UIColor.red.set()
                break
            case "blue":
                UIColor.blue.set()
                break
            default:
                UIColor.black.set()
            }
           
           // Create Circle
           let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
           let radius = (frame.size.width - 10)/2
           context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
               
           // Draw
           context.strokePath()
       }
    }
    
    func setColor(color: String) {
        mColor = color
    }
}

class BlueRecView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
        
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let h = rect.height
        let w = rect.width
        let color:UIColor = UIColor.blue

        let drect = CGRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
        let bpath:UIBezierPath = UIBezierPath(rect: drect)

        color.set()
        bpath.stroke()
    }
}
