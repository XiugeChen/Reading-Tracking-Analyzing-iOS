//
//  QuestionPreviewViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/9/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class QuestionPreviewViewController: UIViewController {
    
    var fileURL: URL?
    
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
        
        let currentTime = Int64(Date().timeIntervalSince1970 * 1000);
        let file = String(format: "ques_preview_%ld.txt", currentTime)
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            self.fileURL = dir.appendingPathComponent(file)
            
            print("Init question preview file url to be:", self.fileURL!)
            
            let text = String(format: "#Question_preview\n#Participant_num,%d\n#Article_num,%d\n", TEST_ID, articleId)
            
            do {
                try text.write(to: fileURL!, atomically: true, encoding: .utf8)
            }
            catch {
                print("[Error]: Write to file failed, file:", self.fileURL!)
            }
        }
        
        let start_text = String(format: "#Start_preview_reading,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: start_text)
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
            
            let next_text = String(format: "#Next_clicked,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
            
            record_data(text: next_text)
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
            
            let back_text = String(format: "#Back_clicked,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
            
            record_data(text: back_text)
        }
    }
    
    @IBAction func onClickConitnue(_ sender: UIButton) {
        QUESTION_ID = 0
        
        let end_text = String(format: "#End_preview_reading,%ld\n", Int64(Date().timeIntervalSince1970 * 1000))
        
        record_data(text: end_text)
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

