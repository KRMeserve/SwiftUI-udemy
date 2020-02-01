//
//  ViewController.swift
//  Swift-TimerProject
//
//  Created by Kyle Meserve on 2/1/20.
//  Copyright © 2020 Norien Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var timer = Timer()
  var counter = 0
  @IBOutlet weak var timeLabel: UILabel!
  @IBAction func buttonClicked(_ sender: Any) {
   print("button clicked")
  }
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    counter = 10
    timeLabel.text = "Time: \(counter)"
    
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    
    }
  
  @objc func timerFunction() {
    
    timeLabel.text = "Time: \(counter)"
    counter -= 1
    
    if counter == 0 {
      timer.invalidate()
      timeLabel.text = "Time's Up!"
    }
  }
    
}

