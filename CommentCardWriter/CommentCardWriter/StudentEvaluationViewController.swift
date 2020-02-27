//
//  StudentEvaluationViewController.swift
//  CommentCardWriter
//
//  Created by Connolly, Patrick (IRG) on 25/02/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit
 
class StudentEvaluationViewController: UIViewController {

    @IBOutlet var textLabel: UINavigationItem!
    @IBOutlet var enjoymentSlider: UISlider!
    @IBOutlet var attainmentSlider: UISlider!
    @IBOutlet var difficultySlider: UISlider!
    @IBOutlet var generateButton: UIButton!
    
    var subject: String
    var dict: [String: String]
    var yearGroup: Int
   
    
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
        let enjoymentWords = ["hating ", "not really enjoying ", "OK with ", "enjoying ", "loving "]
        let attainmentWords = ["no progress ", "some progress ", "progress ", "good progress ", "great progress "]
        let difficultyWords = ["very hard ", "hard ", "alright ", "relatively easy ", "easy "]
        var characterCount: Int
        var content: String
        if yearGroup < 12 {
            characterCount = 400
            content = "At the moment, I am \(enjoymentWords[enjoymentSlider.Int])"
        } else {
            characterCount = 250
        }
        let comment = Comment(teacherName: dict[subject]!, subject: subject, characterCount: characterCount)
        
        
    }
}
