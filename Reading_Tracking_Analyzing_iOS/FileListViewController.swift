//
//  FileListViewController.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/8/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import UIKit

class FileListViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var inputT: UITextField!
    
    @IBOutlet var warnL: UILabel!
    
    @IBOutlet var nextB: UIButton!
    @IBOutlet var backB: UIButton!
    
    var par_num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputT.delegate = self
        
        nextB.isEnabled = false;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        onEditNum()
        return false
    }
    
    func onEditNum() {
        if let numS: String = inputT.text {
            if let num = Int(numS) {
                if num >= 0 {
                    warnL.text = ""
                    nextB.isEnabled = true;
                    par_num = num
                }
                else {
                    nextB.isEnabled = false;
                    warnL.text = "Error: Input must 0 or positive"
                }
            }
            else {
                nextB.isEnabled = false;
                warnL.text = "Error: Input must be an integer"
            }
        }
        else {
            warnL.text = "Error: Input cannot be empty"
            nextB.isEnabled = false;
        }
    }
    
    @IBAction func onClickNext(_ sender: UIButton) {
        TEST_ID = par_num % TEST_NUM
        executeSegue()
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
    }
    
    func executeSegue() {
        ARTICLE_SEQ = 0
        
        if (URLS_SOCIAL.count >= 1) {
            switch (READING_MODE[TEST_ID][ARTICLE_SEQ]) {
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
