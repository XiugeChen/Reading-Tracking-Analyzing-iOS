//
//  GlobalSettings.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/8/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import Foundation

enum DisplayMethod {
    case social
    case news
}

enum ReadingMode {
    case deep
    case shallow
}

let URLS_SOCIAL = ["https://ibb.co/rs3LqwQ"]
let URLS_NEWS = ["https://medium.com/@cxgsimon/article3-the-great-wall-of-china-cc4836e91bc?source=friends_link&sk=2ebcec6f6aa362f9adcea39bdd2e2047"]

let QUESTIONS = [PAS1_QUESTION]

let CHOICES = [PAS1_CHOICE]

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

let PAS1_QUESTION = [
    "1. According to the passage, which of the following is correct about walls in China?",
    "2. Chinese cities resembled a maze because:",
    "3. The Great Wall was built:",
    "4. The foundation of the Great Wall was built to protect the kingdom:",
    "5. Who built the first continuous Great Wall?"
]

let PAS1_CHOICE = [
    ["A. Walls were an essential part of villages, towns, houses and even temples.",
     "B. People usually built walls around villages and towns, but never inside them.",
     "C. Only critical villages and towns are walled."
    ],
    ["A. they were walled.",
     "B. the house has no external windows.",
     "C. the name for cities in Chinese means 'wall'."
    ],
    ["A. during a single dynasty.",
     "B. in one dynasty and refurbished in other dynasties.",
     "C. across several dynasties."
    ],
    ["A. against other kingdoms.",
     "B. against the northern nomads.",
     "C. A and B."
    ],
    ["A. Chao",
     "B. Ch’in Shih Huang Di",
     "C. Yen"
    ]
]

/*
struct Passage {
    var text = ""
    var question = [""]
    var choices = [[""]]
}

let FILES = [PAS1]

let PAS1 = Passage(text: PAS1_TEXT, question: PAS1_QUESTION, choices: PAS1_CHOICE)

let PAS1_TEXT = """
    Walls and wall building have played a very important role in Chinese culture. These people, from the dim mists of prehistory have been wall-conscious; from the Neolithic period – when ramparts of pounded earth were used - to the Communist Revolution, walls were an essential part of any village. Not only towns and villages; the houses and the temples within them were somehow walled, and the houses also had no windows overlooking the street, thus giving the feeling of wandering around a huge maze. The name for “city” in Chinese (ch’eng) means wall, and over these walled cities, villages, houses and temples presides the god of walls and mounts, whose duties were, and still are, to protect and be responsible for the welfare of the inhabitants. Thus a great and extremely laborious task such as constructing a wall, which was supposed to run throughout the country, must not have seemed such an absurdity.

    However, it is indeed a common mistake to perceive the Great Wall as a single architectural structure, and it would also be erroneous to assume that it was built during a single dynasty. For the building of the wall spanned the various dynasties, and each of these dynasties somehow contributed to the refurbishing and the construction of a wall, whose foundations had been laid many centuries ago. It was during the fourth and third century B.C. that each warring state started building walls to protect their kingdoms, both against one another and against the northern nomads. Especially three of these states: the Ch’in, the Chao and the Yen, corresponding respectively to the modern provinces of Shensi, Shanzi and Hopei, over and above building walls that surrounded their kingdoms, also laid the foundations on which Ch’in Shih Huang Di would build his first continuous Great Wall.

    The role that the Great Wall played in the growth of Chinese economy was an important one. Throughout the centuries many settlements were established along the new border. The garrison troops were instructed to reclaim wasteland and to plant crops on it, roads and canals were built, to mention just a few of the works carried out. All these undertakings greatly helped to increase the country’s trade and cultural exchanges with many remote areas and also with the southern, central and western parts of Asia – the formation of the Silk Route. Builders, garrisons, artisans, farmers and peasants left behind a trail of objects, including inscribed tablets, household articles, and written work, which have become extremely valuable archaeological evidence to the study of defence institutions of the Great Wall and the everyday life of these people who lived and died along the wall.
"""
*/
