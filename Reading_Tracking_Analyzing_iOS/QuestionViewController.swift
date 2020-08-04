//
//  QuestionViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishClicked(_ sender: Any) {
        ARTICLE_ID += 1
        
        if (ARTICLE_ID < URLS_SOCIAL.count) {
            switch (READING_MODE[TEST_ID][ARTICLE_ID]) {
                case ReadingMode.deep:
                    performSegue(withIdentifier: "QuesToRead", sender: self)
                    break
                case ReadingMode.shallow:
                    performSegue(withIdentifier: "QuesToQuesPre", sender: self)
                    break
            }
        }
        else {
            performSegue(withIdentifier: "QuesToFinish", sender: self)
        }
    }
}
