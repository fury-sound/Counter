//
//  ViewController.swift
//  Counter
//
//  Created by Valery Zvonarev on 21.05.2024.
//

import UIKit

class ViewController: UIViewController {

    private var mainCounter = 0
    private var lineCounter = 0
    private let formatter = DateFormatter()
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var counterButton: UIButton!
    
    @IBOutlet private weak var counterButtonDown: UIButton!
    
    @IBAction private func counterButtonUp(_ sender: Any) {
        lineCounter += 1
        mainCounter += 1
        counterLabel.text = "Значение счетчика: \n \(mainCounter)"
        addingTextToTextView("\(lineCounter).\(getMyDate()): значение изменено на +1")
    }
    
    @IBAction private func counterDown(_ sender: Any) {
        lineCounter += 1
        if mainCounter > 0 {
            mainCounter -= 1
            addingTextToTextView("\(lineCounter).\(getMyDate()): значение изменено на -1")
        } else {
            addingTextToTextView("\(lineCounter).\(getMyDate()): попытка уменьшить значение счётчика ниже 0")
//            addingTextToTextView("\(getMyDate()): нельзя ниже 0")
        }
        counterLabel.text = "Значение счетчика: \n \(mainCounter)"
    }
    
    @IBAction private func counterReset(_ sender: Any) {
        lineCounter += 1
        mainCounter = 0
        counterLabel.text = "Значение счетчика: \n \(mainCounter)"
//        historyTextView.text = "История изменений\nСчетчик сброшен"
        addingTextToTextView("\(lineCounter).\(getMyDate()): значение сброшено")
    }
    
    private func addingTextToTextView(_ textString: String) {
        if let existingText = historyTextView.text {
            historyTextView.text = "\(existingText)\n\(textString)"
        } else {
            historyTextView.text = textString
        }
        
//        let range = NSMakeRange(historyTextView.text.count - 1, 0)
//        historyTextView.scrollRangeToVisible(range)
        let bottom = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    private func getMyDate() -> String {
        let currentDate = Date()
        let myDate = formatter.string(from: currentDate)
        return myDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        counterLabel.text = "Значение счетчика: \n \(mainCounter)"
        historyTextView.text = "История изменений\n"
        historyTextView.isScrollEnabled = true
    }
}

