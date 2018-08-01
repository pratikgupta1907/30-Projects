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
    var round = 1
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert(){
        let differnce = abs(currentValue - targetValue)
        let points = 100 - differnce
        score += points
        let message = "you scored \(points) points"
        let Alert = UIAlertController(title: "HEllo World!", message: message , preferredStyle: .alert)
        let action = UIAlertAction(title: "exit", style: .default, handler: nil)
        Alert.addAction(action)
        present(Alert, animated: true, completion: nil)
        startNewRound()
    }
    
}

