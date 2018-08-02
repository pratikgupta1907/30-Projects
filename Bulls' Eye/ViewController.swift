//
//  ViewController.swift
//  Bulls' Eye
//
//  Created by Pratik Gupta on 01/08/18.
//  Copyright © 2018 Pratik Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    var targetValue = 0
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
    }
    
    @IBAction func startOver(){
        score = 0
        round = 0
        startNewRound()
    }
   
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = 50
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert(){
        let differnce = abs(currentValue - targetValue)
        var points = 100 - differnce
        
        let title: String
        if differnce == 0 {
            title = "Perfect! You Scored Perfect Bonus"
            points += 100
        } else if differnce < 5 {
            title = "Excellent!"
            if differnce == 1 {
                points += 50
            }
        } else if differnce < 10 {
            title = "preety good"
        } else {
            title = "not even close"
        }
        score += points
        
        let message = "you scored \(points) points"
        let Alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
    }
    
}

