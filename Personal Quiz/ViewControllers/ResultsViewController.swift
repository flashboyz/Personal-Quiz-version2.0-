//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    //MARK: - IB Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var shortResultEmojiLabel: UILabel!
    
    var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        var catCount = 0
        var dogCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        for answerChoosen in answersChoosen {
            if String(answerChoosen.type.rawValue) == "🐶" {
                dogCount += 1
            } else if String(answerChoosen.type.rawValue) == "🐱" {
                catCount += 1
            } else if String(answerChoosen.type.rawValue) == "🐰" {
                rabbitCount += 1
            } else {
                turtleCount += 1
            }
            
        }
        
        // MARK: result output
        let answersResultCount = ["Dog": dogCount, "Cat": catCount, "Rabbit": rabbitCount, "Turtle": turtleCount]
        let sortedResult = answersResultCount.sorted {$0.value > $1.value}
        
        let result = sortedResult.first
        
        if result?.key == "Dog" {
            resultLabel.text = AnimalType.dog.definition
        } else if result?.key == "Cat" {
            resultLabel.text = AnimalType.cat.definition
        } else if result?.key == "Rabbit" {
            resultLabel.text = AnimalType.rabbit.definition
        } else {
            resultLabel.text = AnimalType.turtle.definition
        }
 
        
        if result?.key == "Dog" {
            shortResultEmojiLabel.text = "Вы \(AnimalType.dog.rawValue)"
        } else if result?.key == "Cat" {
            shortResultEmojiLabel.text = "Вы \(AnimalType.cat.rawValue)"
        } else if result?.key == "Rabbit" {
            shortResultEmojiLabel.text = "Вы \(AnimalType.rabbit.rawValue)"
        } else {
            shortResultEmojiLabel.text = "Вы \(AnimalType.turtle.rawValue)"
        }
        
    }
}
