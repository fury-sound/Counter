//
//  ViewController.swift
//  Counter
//
//  Created by Valery Zvonarev on 21.05.2024.
//

import UIKit

class ViewController: UIViewController {

    private var counter = 0
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var counterButton: UIButton!
    
    @IBAction func counterUp(_ sender: Any) {
//        print("Pressed!")
        counter += 1
        counterLabel.text = "Значение счетчика: \n \(counter)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счетчика: \n \(counter)"
        // Do any additional setup after loading the view.
    }


}

