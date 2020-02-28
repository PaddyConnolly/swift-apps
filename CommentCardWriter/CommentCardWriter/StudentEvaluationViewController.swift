//
//  StudentEvaluationViewController.swift
//  CommentCardWriter
//
//  Created by Connolly, Patrick (IRG) on 25/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit
 
class StudentEvaluationViewController: UIViewController {
    @IBOutlet var topicToImprove2: UITextField!
    @IBOutlet var topicToImprove1: UITextField!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var textLabel: UINavigationItem!
    @IBOutlet var enjoymentSlider: UISlider!
    @IBOutlet var attainmentSlider: UISlider!
    @IBOutlet var difficultySlider: UISlider!
    @IBOutlet var generateButton: UIButton!
    @IBOutlet var characterCountLabel: UILabel!
    
    var subject: String
    var dict: [String: String]
    var yearGroup: Int
    var content: String = ""
    
    init?(coder: NSCoder, student: Student, subject: String) {
        self.subject = subject
        self.dict = student.subjectTeacherDict
        self.yearGroup = student.yearGroup
        super.init(coder: coder)

    }
    
    required init?(coder: NSCoder) {
        fatalError("Subject required when instantiating Student Evaluation View Controller")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = subject
 
    }

    @IBAction func generate(_ sender: Any) {
        
        let enjoymentWords = ["hating", "not really enjoying", "OK with", "enjoying", "loving"]
        let attainmentWords = ["no progress", "some progress", "progress", "good progress", "great progress"]
        let difficultyWords = ["very hard", "hard", "alright", "relatively easy", "easy"]
        let topics = [topicToImprove1.text, topicToImprove2.text]
        
        
        var maxCharacterCount: Int
        
        if yearGroup > 12 {
            maxCharacterCount = 400
            
        } else {
            maxCharacterCount = 250
            content = "At the moment, I am \(enjoymentWords[Int(enjoymentSlider.value)]) \(subject). I think that I am making \(attainmentWords[Int(attainmentSlider.value)]), and I'm finding the work \(difficultyWords[Int(difficultySlider.value)]). I feel like I could improve in the topics of \(topics[0]!) and \(topics[1]!). Overall I think that I am working hard in \(subject)"
            characterCountLabel.text = "Character Count: \(content.count)"
            if content.count > maxCharacterCount {
                content = "Comment too long, please enter less topics."
            }
        }
        
        let comment = Comment(teacherName: dict[subject]!, subject: subject, characterCount: maxCharacterCount, content: content)
        commentLabel.text = comment.content
        
    }
}
