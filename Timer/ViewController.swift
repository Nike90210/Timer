//
//  ViewController.swift
//  Timer
//
//  Created by Jazzband on 15.04.2022.
//

import UIKit

class ViewController: UIViewController {

  
    @IBAction func sixteenHrs(_ sender: Any) {
    }
    
    @IBAction func twentyThreeHrs(_ sender: Any) {
    }
    
    @IBAction func thirtySixHrs(_ sender: Any) {
    }
    
    @IBAction func fourtySevenHrs(_ sender: Any) {
    }
    
    @IBAction func seventyOneHrs(_ sender: Any) {
    }
    
    @IBAction func CustomHrs(_ sender: Any) {
    }
    
    
    
    
    @IBOutlet var buttons :[UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 2
            button.layer.shadowOffset = CGSize.init(width: 3, height: 2)
        }
    }
    
    
    
    
}



