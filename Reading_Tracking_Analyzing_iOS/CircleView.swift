//
//  CircleView.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 3/14/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
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
           UIColor.red.set()
           
           // Create Circle
           let center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
           let radius = (frame.size.width - 10)/2
           context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
               
           // Draw
           context.strokePath()
       }
    }
}
