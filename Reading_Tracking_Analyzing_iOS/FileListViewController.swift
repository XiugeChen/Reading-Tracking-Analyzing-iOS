//
//  FileListViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/8/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func test1Clicked(_ sender: Any) {
        TEST_ID = 0
        executeSegue()
    }
    
    @IBAction func test2Clicked(_ sender: Any) {
        TEST_ID = 1
        executeSegue()
    }
    
    @IBAction func test3Clicked(_ sender: Any) {
        TEST_ID = 2
        executeSegue()
    }
    
    @IBAction func test4Clicked(_ sender: Any) {
        TEST_ID = 3
        executeSegue()
    }
    
    func executeSegue() {
        ARTICLE_ID = 0
        
        if (URLS_SOCIAL.count >= 1) {
            switch (READING_MODE[TEST_ID][ARTICLE_ID]) {
                case ReadingMode.deep:
                    performSegue(withIdentifier: "ListToRead", sender: self)
                    break
                case ReadingMode.shallow:
                    performSegue(withIdentifier: "ListToQuesPre", sender: self)
                    break
            }
        }
    }
}
