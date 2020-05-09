//
//  GlobalSettings.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/8/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import Foundation

enum SettingError: Error {
    case invalidReadingMode
    case invalidDisplay
}

enum DisplayMethod {
    case social
    case news
}

enum ReadingMode {
    case deep
    case shallow
}

let URLS = ["https://arxiv.org/pdf/1505.01731.pdf"]

let DISPLAY = [[DisplayMethod.social],
               [DisplayMethod.social],
               [DisplayMethod.news],
               [DisplayMethod.news]]

let READING_MODE = [[ReadingMode.deep],
                    [ReadingMode.shallow],
                    [ReadingMode.deep],
                    [ReadingMode.shallow]]

var TEST_ID = 0
var ARTICLE_ID = 0
