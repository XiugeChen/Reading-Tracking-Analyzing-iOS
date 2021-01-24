//
//  QuestionPreviewViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class QuestionPreviewViewController: UIViewController {
    
    var articleId = 0
    
    @IBOutlet var QuestionL: UILabel!
    
    @IBOutlet var ContinueB: UIButton!
    @IBOutlet var BackB: UIButton!
    @IBOutlet var NextB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BackB.isEnabled = false
        ContinueB.isEnabled = false
        
        articleId = ARTICLES[ARTICLE_SEQ]
        
        QuestionL.text = QUESTIONS[articleId][QUESTION_ID]
    }
    
    @IBAction func onClickNext(_ sender: UIButton) {
        if (QUESTION_ID < QUESTION_NUM - 1) {
            QUESTION_ID = QUESTION_ID + 1
            
            QuestionL.text = QUESTIONS[articleId][QUESTION_ID]
            
            if (QUESTION_ID > 0) {
                BackB.isEnabled = true
            }
            
            if (QUESTION_ID == QUESTION_NUM - 1) {
                NextB.isEnabled = false
                ContinueB.isEnabled = true
            }
        }
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        if (QUESTION_ID > 0) {
            QUESTION_ID = QUESTION_ID - 1
            
            QuestionL.text = QUESTIONS[articleId][QUESTION_ID]
            
            if (QUESTION_ID == 0) {
                BackB.isEnabled = false
            }
            
            if (QUESTION_ID < QUESTION_NUM - 1) {
                NextB.isEnabled = true
                ContinueB.isEnabled = false
            }
        }
    }
    
    @IBAction func onClickConitnue(_ sender: UIButton) {
        QUESTION_ID = 0
    }
}

