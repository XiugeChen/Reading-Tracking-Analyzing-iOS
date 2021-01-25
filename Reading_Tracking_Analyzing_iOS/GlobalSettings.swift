//
//  GlobalSettings.swift
//  Reading_Tracking_Analyzing_iOS
//
//  Created by Xiuge Chen on 5/8/20.
//  Copyright © 2020 Xiuge Chen. All rights reserved.
//

import Foundation

let QUESTION_NUM = 20
let ARTICLE_NUM = 4
let TEST_NUM = 24

enum DisplayMethod {
    case social
    case news
}

enum ReadingMode {
    case deep
    case shallow
}

let URLS_SOCIAL =
    ["https://pasteboard.co/JL4O32z.jpg",
     "https://pasteboard.co/JL4FoYt.jpg",
     "https://pasteboard.co/JL4Lbv2.jpg",
     "https://pasteboard.co/JL4SnLC.jpg"]

let URLS_NEWS = ["https://cxgsimon.medium.com/the-shed-3865fd8b381a",
     "https://cxgsimon.medium.com/the-camels-back-b4c7aa12010d",
     "https://cxgsimon.medium.com/hedgehog-experience-29d8927b7e5c",
     "https://cxgsimon.medium.com/a-not-so-bad-bully-8c0ce6236f4a"]

let ARTICLES = [0, 1, 2, 3].shuffled()

let QUESTIONS = [PAS1_QUESTION, PAS2_QUESTION, PAS3_QUESTION, PAS4_QUESTION]

let CHOICES = [PAS1_CHOICE, PAS2_CHOICE, PAS3_CHOICE, PAS4_CHOICE]

let DISPLAY = [[DisplayMethod.social, DisplayMethod.social, DisplayMethod.news,         DisplayMethod.news],
               [DisplayMethod.social, DisplayMethod.social, DisplayMethod.news, DisplayMethod.news],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.news, DisplayMethod.social, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.news, DisplayMethod.social, DisplayMethod.social],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.news, DisplayMethod.social, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.news, DisplayMethod.social, DisplayMethod.social],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.news, DisplayMethod.social],
               [DisplayMethod.social, DisplayMethod.social, DisplayMethod.news, DisplayMethod.news],
               [DisplayMethod.social, DisplayMethod.social, DisplayMethod.news, DisplayMethod.news],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.social, DisplayMethod.news, DisplayMethod.social, DisplayMethod.news],
               [DisplayMethod.news, DisplayMethod.social, DisplayMethod.social, DisplayMethod.news]
              ]

let READING_MODE = [[ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow],
                    [ReadingMode.deep, ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep, ReadingMode.deep],
                    [ReadingMode.deep, ReadingMode.shallow, ReadingMode.shallow, ReadingMode.deep],
                    [ReadingMode.shallow, ReadingMode.deep, ReadingMode.shallow, ReadingMode.deep]
                   ]

var TEST_ID = 0
var ARTICLE_SEQ = 0
var QUESTION_ID = 0

var ANSWERS = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]

let PAS1_QUESTION = [
    "1. Why was Miranda sorry that she had come to Kim's house?",
    "2. What sound made Kim run away from the shed?",
    "3. Why were the boys lying on the floor of the shed?",
    "4. How did Miranda get Kim to agree to go to the shed?",
    "5. Why were the girls not able to use the computer or phone at Kim's house?",
    "6. What was the last thing Kim suggested they should do for entertainment at Kim's house?",
    "7. What is the main problem in the story?",
    "8. What had Miranda usually thought about the shed?",
    "9. What made the shed such a scary place?",
    "10. What is probably the reason Miranda's mom would NOT let her leave the house as easily as Kim's mom did?",
    "11. How many times did Kim object to going to the shed before she agreed to go?",
    "12. What made the girls expect to hear a baby cry from inside the shed?",
    "13. How was Miranda's personality different from Kim's?",
    "14. What did Miranda find in the shed?",
    "15. What gave Miranda the idea to go to the shed with Kim?",
    "16. What will Miranda probably do on Monday back at school?",
    "17. What was the first thing Miranda suggested they do at Kim's house?",
    "18. What kind of person was Kim?",
    "19. Why did the girls stop talking on the way to the shed?",
    "20. What best describes Miranda?"
]

let PAS1_CHOICE = [
    ["A: Kim's brother was bothering them while they played games.",
     "B: Kim wasn't interested in talking about boyfriends.",
     "C: None of the usual entertainment was available."
    ], // 1
    ["A: A hushed whisper.",
     "B: A loud shriek.",
     "C: A muffled cough."
    ], // 2
    ["A: They bumped into a wall.",
     "B: They'd bumped into Miranda.",
     "C: They were trying to hide."
    ], // 3
    ["A: By making her feel guilty as a friend.",
     "B: By saying it would impress kids at school.",
     "C: By making it sound like an adventure."
    ], // 4
    ["A: Kim's mom didn't want them to contact boys.",
     "B: Kim's mom was using them for work.",
     "C: Kim's mom cancelled the internet service."
    ], // 5
    ["A: Discuss boys.",
     "B: Watch TV.",
     "C: Play board games."
    ], // 6
    ["A: There was nothing to do at Kim's house.",
     "B: Kim and Miranda had to sneak out at night.",
     "C: Going to the shed might be dangerous."
    ], // 7
    ["A: It looked like any other shed.",
     "B: It was filled with ghosts.",
     "C: It was a scary place to go."
    ], // 8
    ["A: Its location next to a broken-down house.",
     "B: Kids told lots of scary stories about it.",
     "C: It was abandoned with `No Trespassing' signs."
    ], // 9
    ["A: Miranda's mom didn't have time to argue with her about going out.",
     "B: Miranda's mom was a lot stricter than Kim's mom about most things.",
     "C: Miranda's mom didn't trust Miranda because of her past behavior."
    ], // 10
    ["A: Two.",
     "B: Three.",
     "C: Four."
    ], // 11
    ["A: The house next to the shed had burned down with a baby in it.",
     "B: There were stories that baby ghosts lived in the shed.",
     "C: The moon was full that night like it was in the legend."
    ], // 12
    ["A: Miranda was more popular and persuasive with friends than Kim.",
     "B: Miranda was more sophisticated, brave, and adventurous than Kim.",
     "C: Miranda was more confident and easy-to-please than Kim."
    ], // 13
    ["A: A rough door.",
     "B: Her friends.",
     "C: A ghost baby."
    ], // 14
    ["A: Thinking about being frightened.",
     "B: Remembering part of the game, Clue.",
     "C: Wanting to impress the kids at school."
    ], // 15
    ["A: Think of a plan to get back at Kim for leaving her.",
     "B: Make up a story about what she saw in the shed.",
     "C: Tell a story about how scared the boys were."
    ],  // 16
    ["A: Go to the shed at night.",
     "B: Go to the store for candy.",
     "C: Bother Kim's little brother."
    ],  // 17
    ["A: Someone who was easily bullied in social situations.",
     "B: Someone who always preferred to obey all the rules.",
     "C: Someone who was worried about what people thought of her."
    ],  // 18
    ["A: Miranda was mad at Kim for being so resistant to go to the shed.",
     "B: They were getting increasingly nervous as they approached the shed.",
     "C: They wanted to sneak up on the shed without anyone hearing them."
    ], // 19
    ["A: She knew how to manipulate people.",
     "B: She was a bully and liked to be mean.",
     "C: She was only afraid of ghosts."
    ] // 20
]

let PAS2_QUESTION = [
    "1. Why did Chan's dad compare a motorcycle to a cat?",
    "2. Why was that part of the trail called the \"camel's back\" by Chan's family?",
    "3. Why did everything slow down as Chan approached the first hump on the trail?",
    "4. When did Chan realize she was seriously hurt?",
    "5. What made Chan notice how late it was after the crash?",
    "6. What made Chan decide to tell her parents about the accident?",
    "7. What is the main problem in this story?",
    "8. Why did Chan feel her chest constrict when looking at the dirt trail in front of her?",
    "9. Why did Chan make herself pick up the motorcycle even though it hurt?",
    "10. What is the main idea of this story?",
    "11. Why was Chan relieved after the accident?",
    "12. What caused Chan's crash on her motorcycle?",
    "13. What kind of person is Chan?",
    "14. Why did Chan do the jump even though she'd never tried it before?",
    "15. How does Chan probably feel about her parents?",
    "16. What probably will Chan's parents' first response be when she tells them about being hurt in the accident?",
    "17. What happened when Chan tried to lift the bike the first time?",
    "18. Why did Chan think she had a good example of irony for her teacher now?",
    "19. What did Chan do with her motorcycle before going into the house?",
    "20. What is the most likely explanation for why Chan's chest hurt?"
]

let PAS2_CHOICE = [
    ["A: The engine sounded like a cat purring.",
     "B: They both can have a dangerous side.",
     "C: A motorcycle can move fast like a cat."
    ], // 1
    ["A: That part of the trail was uneven; so it felt like riding a camel.",
     "B: That part of the trail had two large bumps like a camel did.",
     "C: That part of the trail had two sharp curves like a camel's back."
    ], // 2
    ["A: She was focused on making the jump and didn't notice the world around her.",
     "B: She became afraid as she approached the jump and lost all of her focus.",
     "C: She was daydreaming about showing off her skills to her family later on."
    ], // 3
    ["A: When she was lying in the grass unable to breathe.",
     "B: When she finally managed to stand up after crashing.",
     "C: When she started walking towards her motorcycle."
    ], // 4
    ["A: She noticed no one else was on the trail with her.",
     "B: She noticed the trees were casting long shadows.",
     "C: She noticed the sun was setting behind the trees."
    ], // 5
    ["A: She didn't have time to change out of her dirty clothes.",
     "B: She realized her pain was too much to hide from them.",
     "C: She felt guilty and wanted to confess to feel better."
    ], // 6
    ["A: Chan had to figure out how to get the bike back when she was hurt.",
     "B: Chan's fall was going to ruin her brother's homecoming if she told.",
     "C: Chan had to figure out how to hide her hurt ribs from her parents."
    ], // 7
    ["A: She was excited.",
     "B: Her chest hurt.",
     "C: She felt guilty."
    ], // 8
    ["A: She didn't have time to walk to the house before her parents got home.",
     "B: She wanted to make sure her motorcycle was OK after the crash.",
     "C: She needed to hide the fact she had been riding without permission."
    ], // 9
    ["A: Motorcycles are very dangerous for kids.",
     "B: Ignoring caution can lead to big problems.",
     "C: Stunts should only be attempted by adults."
    ], // 10
    ["A: She could see her bike wasn't hurt because it rolled into the bushes.",
     "B: She got her breath back after it had been knocked out of her.",
     "C: She finally didn't feel like she was drowning in molasses anymore."
    ], // 11
    ["A: She didn't notice the puddle as she came down from the jump.",
     "B: She jumped her motorcycle over two large bumps in the trail.",
     "C: She was daydreaming about showing her new skills to her family."
    ], // 12
    ["A: Careless and dangerous.",
     "B: Headstrong and determined.",
     "C: Prideful and risky."
    ], // 13
    ["A: She was tired of being jealous of her family's skills.",
     "B: She was going too fast and accidentally flew over the bump.",
     "C: She wanted to see if a smaller bike could do the jump."
    ], // 14
    ["A: She feels they are unfair and won't let her do things.",
     "B: She's afraid of them and how they will punish her.",
     "C: She respects them a lot and wants to please them."
    ], // 15
    ["A: They will get angry and lecture her.",
     "B: They will rush her to the doctor.",
     "C: They will be confused about what to do."
    ],  // 16
    ["A: The bike's engine started running.",
     "B: She forgot about the pain in her side.",
     "C: She couldn't do it and collapsed."
    ],  // 17
    ["A: She was in pain after doing what her parents told her not to.",
     "B: Her bike was perfectly fine, but she herself was badly hurt.",
     "C: Chan felt like giggling even though she had been injured."
    ],  // 18
    ["A: She wiped off the evidence of her ride.",
     "B: She checked the motorcycle for damage.",
     "C: She put the motorcycle in the barn."
    ], // 19
    ["A: She was having chest pains from fear and guilt.",
     "B: She hit the handlebars when she slid in the puddle.",
     "C: Her ribs were injured from falling off the bike."
    ] // 20
]

let PAS3_QUESTION = [
    "1. In what part of Africa did this story take place?",
    "2. What prediction was Henri's grandmother able to make for many years?",
    "3. Why did hedgehogs have no need to hide or run away from people?",
    "4. How did arguments between Henri and his dad about the hedgehogs that Henri brought home usually end?",
    "5. How did Henri's father feel about Hedgehogs?",
    "6. When did Henri first realize that his grandmother was right about the plague of ants?",
    "7. What was Henri's father like?",
    "8. How did the disappearance of hedgehogs affect Henry?",
    "9. After seeing the ant plague, what was Henri's biggest problem?",
    "10. What best describes the way Henri viewed hedgehogs after he saw them eating the ants?",
    "11. What did Henri do when he could find no hedgehogs around his village?",
    "12. What probably kept Grandmother from becoming upset with her son when he didn't believe her?",
    "13. How will Henri's father probably react when he finds out that there was an ant plague?",
    "14. What important thing did Henri remember his grandmother saying about the destruction she had predicted?",
    "15. After Henri learned that the plague would be ants, why did he consider that perhaps this time his father's viewpoint might be right?",
    "16. How did Grandmother feel about her ability to make predictions?",
    "17. What made Henri think about returning home when he was far from his village looking for hedgehogs?",
    "18. What was this story mostly about?",
    "19. What was the main argument Henri's father used for why there couldn't be a plague?",
    "20. What best describes the way Henri's family functioned?"
]

let PAS3_CHOICE = [
    ["A: South Africa",
     "B: West Africa",
     "C: North Africa"
    ], // 1
    ["A: Predict when the moon would rise and set.",
     "B: Predict when the seasons were going to change.",
     "C: Predict when there would be a major storm."
    ], // 2
    ["A: They moved in a way that made them uninteresting.",
     "B: They had a way to protect themselves so they were safe.",
     "C: They could look dangerous when they wanted to."
    ], // 3
    ["A: Henri's father made Henri put them outside.",
     "B: No decision or conclusion was reached.",
     "C: Henri agreed to keep the hedgehogs hidden."
    ], // 4
    ["A: He strongly disliked them and thought they belonged outside.",
     "B: He thought they were interesting but didn't make good pets.",
     "C: He thought they were okay as long as they stayed outside."
    ], // 5
    ["A: When he saw the noses of the hedgehogs moving up and down far away.",
     "B: When he realized what looked like hills of bushes were really hedgehogs.",
     "C: When he realized what the mass of black crawling across the grassland was."
    ], // 6
    ["A: He thought that he knew more than other people.",
     "B: He had strong opinions about things and stuck to them.",
     "C: He was interested in learning new and unusual things."
    ], // 7
    ["A: He felt an absence in his life and was depressed.",
     "B: He felt it wasn't fair that he lost his animal friends.",
     "C: He felt there were more important things than hedgehogs."
    ], // 8
    ["A: Deciding how to deal with hedgehogs now that he knew their power.",
     "B: Getting help from his grandmother to tell his father about the plague.",
     "C: Communicating with his father about what he had seen on his walk."
    ], // 9
    ["A: They were no longer just a curiosity but were a powerful force of nature.",
     "B: They were something to be feared, not something to be played with.",
     "C: They were still interesting, but now he would have to play with them outside."
    ], // 10
    ["A: He went on a long walk to search for them elsewhere.",
     "B: He decided to play ball with his friends after school.",
     "C: He kept searching for them all around his village."
    ], // 11
    ["A: She knew when the plague came her son would recognize that she was right.",
     "B: She was sure it would happen, and there was nothing she could do about it.",
     "C: She knew she was correct, and she expected her son to react negatively."
    ], // 12
    ["A: He will realize Grandmother was right about all of her predictions and will apologize.",
     "B: He will agree that Grandmother was right but will say that it was just a lucky guess.",
     "C: He will be angry Grandmother's prediction came true and not want to talk about it."
    ], // 13
    ["A: The ants were sure to cause destruction unless something stopped them.",
     "B: The ants would be like hungry giants and destroy everything in their path.",
     "C: There would be nothing that would stop the ants once they started to move."
    ], // 14
    ["A: He knew there couldn't be that many ants in one place.",
     "B: He was afraid of what a real plague would be like.",
     "C: He had never experienced anything like an ant plague."
    ], // 15
    ["A: She thought it was a special gift, and she should be given recognition for it.",
     "B: She thought it was normal and not something she should get praised for.",
     "C: She knew she was always right and was bothered others didn't listen to her."
    ],  // 16
    ["A: He couldn't find any hedgehogs, and he was getting tired.",
     "B: He was heading away from the sun, and he was getting thirsty.",
     "C: The sun was getting too hot for him, and it was a long way back."
    ],  // 17
    ["A: Why children should listen to their parents.",
     "B: Special abilities that certain people have.",
     "C: The relationship between man and nature."
    ],  // 18
    ["A: The government wouldn't let such things happen.",
     "B: Grandmother couldn't predict important things.",
     "C: Plagues like that don't happen in modern times."
    ], // 19
    ["A: Grandmother was the real head of the family, Henri thought his father was head, and Henri's father didn't care what Grandmother thought.",
     "B: Henri didn't follow family rules because his father didn't care, and his grandmother wasn't strong enough to keep things balanced.",
     "C: His father was a strong family head, Henri was an obedient son, and Grandmother kept the family balanced."
    ] // 20
]

let PAS4_QUESTION = [
    "1. Who sat down next to Nargus in her first class?",
    "2. What frustrated Nargus about being insulted?",
    "3. What in the story shows that Nargus was going to be fine in her new home?",
    "4. Why did Nargus feel it was especially unfair that the boys insulted her?",
    "5. What made Nargus and Navid different from the other students?",
    "6. Why did Nargus refuse Mr. Barker's offer to speak to the boys who insulted her?",
    "7. What first caused Doug to pay attention to what Nargus said to him?",
    "8. What did Nargus feel was lacking in Saratoga Springs?",
    "9. What did Nargus do before telling Doug how she felt about the morning's incident?",
    "10. What will Doug probably do over the course of the semester?",
    "11. Why did Nargus' family move to Saratoga Springs?",
    "12. What is probably the reason Doug become quiet when Nargus shook his hand?",
    "13. What was the main idea of this story?",
    "14. What did the teasing boys call Nargus?",
    "15. When did Nargus and Navid begin to feel disliked at the high school?",
    "16. What kind of person was Nargus?",
    "17. Why did the boys tease Navid and Nargus?",
    "18. What was the main problem in this story?",
    "19. Why was Nargus having such a hard time getting ready for school?",
    "20. Of all of Nargus' fears, which probably would be the biggest issue for her?"
]

let PAS4_CHOICE = [
    ["A: The new teacher she had just met.",
     "B: Two smiling girls who looked nice.",
     "C: A boy who had teased her outside."
    ], // 1
    ["A: The insult was unprovoked, so she couldn't prevent it.",
     "B: It was her first day there, and she wasn't given a chance.",
     "C: She felt she and the boys probably had a lot in common."
    ], // 2
    ["A: Her dad was a college professor there.",
     "B: She was in Honors History at school.",
     "C: She knew how to speak up for herself."
    ], // 3
    ["A: She was born in the United States.",
     "B: She didn't like being cast as an outsider.",
     "C: She didn't want to be stereotyped."
    ], // 4
    ["A: They were new to the high school there.",
     "B: They followed the teachings of the Koran.",
     "C: They didn't listen to really loud music."
    ], // 5
    ["A: She thought it was important to stick up for herself.",
     "B: She was embarrassed to draw more attention to herself.",
     "C: She didn't think it was important enough to bother a teacher."
    ], // 6
    ["A: He knew that the teacher was watching them.",
     "B: He decided that she was really quite pretty.",
     "C: He realized that what she was saying was true."
    ], // 7
    ["A: A lot of diversity.",
     "B: Good schools.",
     "C: Small neighborhoods."
    ], // 8
    ["A: She shook his hand despite how she felt about him.",
     "B: She recognized an opportunity and decided to seize it.",
     "C: She took a deep breath and reflected on what to say."
    ], // 9
    ["A: Try to figure out how to get Nargus to like him.",
     "B: Avoid sitting next to Nargus so he won't offend her again.",
     "C: Watch his behavior so he can go to the winter formal."
    ], // 10
    ["A: To be in a better school system.",
     "B: Because her dad got a new job.",
     "C: For better opportunities in life."
    ], // 11
    ["A: He was ashamed and shocked that he had to sit next to a Muslim.",
     "B: Her mature handshake showed how immature his actions had been.",
     "C: He didn't want to give her the satisfaction of a full response."
    ], // 12
    ["A: There are difficulties in moving to a new place and school.",
     "B: People who come from different backgrounds don't get along.",
     "C: People may not always fit your assumptions about them."
    ], // 13
    ["A: An evil foreigner.",
     "B: A dangerous terrorist.",
     "C: Saddam Hussein's wife."
    ], // 14
    ["A: When they were insulted by a group of boys.",
     "B: When they first walked up to the school.",
     "C: When their father first drove up to the school."
    ], // 15
    ["A: She was determined and able to take care of herself.",
     "B: She expected others to do the right thing always.",
     "C: She really didn't care what others thought about her."
    ],  // 16
    ["A: Because they knew they were Muslim and new to the school.",
     "B: Because they thought they were from Iraq and were scared.",
     "C: Because they looked different from the other students."
    ],  // 17
    ["A: Nargus and Navid were different from others at school.",
     "B: Nargus had difficulty in adjusting to a new school setting.",
     "C: Nargus needed students to see beyond the stereotypes."
    ],  // 18
    ["A: Her brother was making her nervous by rushing her.",
     "B: She didn't really want to attend a new school.",
     "C: Her uniform and hijab kept getting messed up."
    ], // 19
    ["A: She wouldn't make any friends.",
     "B: She would be getting into fights.",
     "C: She would get suspended."
    ] // 20
]
