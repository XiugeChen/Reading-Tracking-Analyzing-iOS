//
//  QuestionViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var fileURL: URL?
    
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
        
        let currentTime = Int64(Date().timeIntervalSince1970 * 1000);
        let file = String(format: "ques_answer_%ld.txt", currentTime)
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            self.fileURL = dir.appendingPathComponent(file)
            
            print("Init question answering file url to be:", self.fileURL!)
            
            let text = String(format: "#Question_answering\n#Participant_num,%d\n#Article_num,%d\n", TEST_ID, articleId)
            
            do {
                try text.write(to: fileURL!, atomically: true, encoding: .utf8)
            }
            catch {
                print("[Error]: Write to file failed, file:", self.fileURL!)
            }
        }
        
        let start_text = String(format: "#Start_question_answering,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: start_text)
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
        
        let choic_a_text = String(format: "#Select_A,%d,%ld\n", QUESTION_ID, Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: choic_a_text)
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
        
        let choic_b_text = String(format: "#Select_B,%d,%ld\n", QUESTION_ID, Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: choic_b_text)
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
        
        let choic_c_text = String(format: "#Select_C,%d,%ld\n", QUESTION_ID, Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: choic_c_text)
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
            
            let back_text = String(format: "#Back_clicked,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
            
            record_data(text: back_text)
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
            
            let next_text = String(format: "#Next_clicked,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
            
            record_data(text: next_text)
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
        
        answer_text += "\n"
        
        record_data(text: answer_text)
        
        let end_text = String(format: "#End_question_answering,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: end_text)
        
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
    
    // MARK: - Helper functions related to data recording
    func record_data(text: String) {
        if let fileUpdater = try? FileHandle(forUpdating: self.fileURL!) {
            fileUpdater.seekToEndOfFile()
            fileUpdater.write(text.data(using: .utf8)!)
            fileUpdater.closeFile()
        }
    }
}
