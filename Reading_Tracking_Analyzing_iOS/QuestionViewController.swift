//
//  QuestionViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionL: UILabel!
    
    @IBOutlet var answerA: UIButton!
    @IBOutlet var answerB: UIButton!
    @IBOutlet var answerC: UIButton!
    
    @IBOutlet var backB: UIButton!
    @IBOutlet var nextB: UIButton!
    @IBOutlet var finishB: UIButton!
    
    var articleId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nextB.isEnabled = false
        backB.isEnabled = false
        finishB.isEnabled = false
        
        articleId = ARTICLES[ARTICLE_SEQ]
        
        questionL.text = QUESTIONS[articleId][QUESTION_ID]
        answerA.setTitle(CHOICES[articleId][QUESTION_ID][0], for: .normal)
        answerB.setTitle(CHOICES[articleId][QUESTION_ID][1], for: .normal)
        answerC.setTitle(CHOICES[articleId][QUESTION_ID][2], for: .normal)
        
        answerA.backgroundColor = UIColor.white
        answerB.backgroundColor = UIColor.white
        answerC.backgroundColor = UIColor.white
    }
    
    @IBAction func onClickA(_ sender: UIButton) {
        ANSWERS[QUESTION_ID] = "A"
        
        answerA.backgroundColor = UIColor.lightGray
        answerB.backgroundColor = UIColor.white
        answerC.backgroundColor = UIColor.white
        
        if (QUESTION_ID < QUESTION_NUM - 1) {
            nextB.isEnabled = true
        }
        else {
            finishB.isEnabled = true
        }
    }
    
    @IBAction func onClickB(_ sender: UIButton) {
        ANSWERS[QUESTION_ID] = "B"
        
        answerB.backgroundColor = UIColor.lightGray
        answerA.backgroundColor = UIColor.white
        answerC.backgroundColor = UIColor.white
        
        if (QUESTION_ID < QUESTION_NUM - 1) {
            nextB.isEnabled = true
        }
        else {
            finishB.isEnabled = true
        }
    }
    
    @IBAction func onClickC(_ sender: UIButton) {
        ANSWERS[QUESTION_ID] = "C"
        
        answerC.backgroundColor = UIColor.lightGray
        answerA.backgroundColor = UIColor.white
        answerB.backgroundColor = UIColor.white
        
        if (QUESTION_ID < QUESTION_NUM - 1) {
            nextB.isEnabled = true
        }
        else {
            finishB.isEnabled = true
        }
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        if (QUESTION_ID > 0) {
            QUESTION_ID = QUESTION_ID - 1
            
            questionL.text = QUESTIONS[articleId][QUESTION_ID]
            answerA.setTitle(CHOICES[articleId][QUESTION_ID][0], for: .normal)
            answerB.setTitle(CHOICES[articleId][QUESTION_ID][1], for: .normal)
            answerC.setTitle(CHOICES[articleId][QUESTION_ID][2], for: .normal)
            
            switch (ANSWERS[QUESTION_ID]) {
            case "A":
                answerA.backgroundColor = UIColor.lightGray
                answerB.backgroundColor = UIColor.white
                answerC.backgroundColor = UIColor.white
                break;
            case "B":
                answerB.backgroundColor = UIColor.lightGray
                answerA.backgroundColor = UIColor.white
                answerC.backgroundColor = UIColor.white
                break;
            case "C":
                answerC.backgroundColor = UIColor.lightGray
                answerA.backgroundColor = UIColor.white
                answerB.backgroundColor = UIColor.white
                break;
            default:
                answerA.backgroundColor = UIColor.white
                answerB.backgroundColor = UIColor.white
                answerC.backgroundColor = UIColor.white
                break;
            }
            
            if (QUESTION_ID == 0) {
                backB.isEnabled = false
            }
            
            if (QUESTION_ID < QUESTION_NUM - 1) {
                nextB.isEnabled = true
                finishB.isEnabled = false
            }
        }
    }
    
    @IBAction func onClickNext(_ sender: UIButton) {
        if (QUESTION_ID < QUESTION_NUM - 1) {
            QUESTION_ID = QUESTION_ID + 1
            
            questionL.text = QUESTIONS[articleId][QUESTION_ID]
            answerA.setTitle(CHOICES[articleId][QUESTION_ID][0], for: .normal)
            answerB.setTitle(CHOICES[articleId][QUESTION_ID][1], for: .normal)
            answerC.setTitle(CHOICES[articleId][QUESTION_ID][2], for: .normal)
            
            switch (ANSWERS[QUESTION_ID]) {
            case "A":
                answerA.backgroundColor = UIColor.lightGray
                answerB.backgroundColor = UIColor.white
                answerC.backgroundColor = UIColor.white
                
                if (QUESTION_ID == QUESTION_NUM - 1) {
                    nextB.isEnabled = false
                    finishB.isEnabled = true
                }
                break;
            case "B":
                answerB.backgroundColor = UIColor.lightGray
                answerA.backgroundColor = UIColor.white
                answerC.backgroundColor = UIColor.white
                
                if (QUESTION_ID == QUESTION_NUM - 1) {
                    nextB.isEnabled = false
                    finishB.isEnabled = true
                }
                break;
            case "C":
                answerC.backgroundColor = UIColor.lightGray
                answerA.backgroundColor = UIColor.white
                answerB.backgroundColor = UIColor.white
                
                if (QUESTION_ID == QUESTION_NUM - 1) {
                    nextB.isEnabled = false
                    finishB.isEnabled = true
                }
                break;
            default:
                answerA.backgroundColor = UIColor.white
                answerB.backgroundColor = UIColor.white
                answerC.backgroundColor = UIColor.white
                
                nextB.isEnabled = false
                finishB.isEnabled = false
                break;
            }
            
            if (QUESTION_ID > 0) {
                backB.isEnabled = true
            }
            

        }
    }
    
    
    @IBAction func finishClicked(_ sender: Any) {
        QUESTION_ID = 0
        ARTICLE_SEQ += 1
        
        var answer_text = "#Answer"
        
        for i in 0...(QUESTION_NUM - 1) {
            answer_text += "," + ANSWERS[i]
            
            ANSWERS[i] = ""
        }
        
        // TODO: record this
        print(answer_text)
        
        if (ARTICLE_SEQ < ARTICLE_NUM) {
            switch (READING_MODE[TEST_ID][ARTICLE_SEQ]) {
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
