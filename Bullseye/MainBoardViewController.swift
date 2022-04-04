//
//  ViewController.swift
//  Bullseye
//
//  Created by Jafar Asimov on 3/14/22.
//

import UIKit

class MainBoardViewController: UIViewController {
//
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //number that player need to guess
    var guessingNumber: Int = Int.random(in: 1...100)
    //total score
    var score: Int = 0
    
    var round = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let normalThumbImage = UIImage(named: "SliderThumb-Normal")
        let highlightedThumbImage = UIImage(named: "SliderThumb-Highlighted ")
        slider.setThumbImage(normalThumbImage, for: .normal)
        slider.setThumbImage(highlightedThumbImage, for: .highlighted)
        
        setUp()
    }

    @IBAction func didTapSelectButton(_ sender: Any) {
        //task
        //1. read the number from the slider(sliderValue)
        let sliderValue: Float = slider.value
        //2.perevesti eto chislo v Int(sliderValueInt), chtobi mozhno bilo sravnit' 2 celih chisla
        let sliderValueInt: Int = Int(sliderValue)
        //3.compare two numbers, if they are matching up, vivesti na konsol' info about it
        let isValuesEquals: Bool = sliderValueInt == guessingNumber
        if isValuesEquals  {
            print("You guessed the number")
            score = score + 1
            scoreLabel.text = "Score: " + String(score)
            print("You scored \(score)")
        } else {
            print("You chose a number \(sliderValueInt)")
        }
        
        print("the value of the slider: in Float", sliderValue)
        print("the value of the slider: in Int ", sliderValueInt)
        updateRound()
       }
    
    
    @IBAction func tapStartOverIcon(_ sender: Any) {
        print("Pressed restart button")
        setUp()
        
    }
    
    func setUp() {
        //settings of the game
        //1.set up the value of slider 50
            slider.value = 50
      
            //2.set up the number that need to be guessed
            guessingNumber = Int.random(in: 1...100)
            taskLabel.text = "Try to guess number: " + String(guessingNumber)
       //3.obnulit ochki
            score = 0
            scoreLabel.text = "Score: " + String(score)
    }
    
    //update
    func updateGuessingNumber() {
        guessingNumber = Int.random(in: 1...100)
        taskLabel.text = "Try to guess number: " + String(guessingNumber)
    }
    
    //add rounds; if you got wrong number 10 times restart game
    func updateRound() {
        roundLabel.text = "Round: " + String(round)
        if round >= 10 {
            round = 1
            print("Game over")
            setUp()
        } else {
            round = round + 1
            
        }
    }
}

