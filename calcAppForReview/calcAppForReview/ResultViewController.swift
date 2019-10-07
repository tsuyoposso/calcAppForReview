//
//  ResultViewController.swift
//  calcAppForReview
//
//  Created by 長坂豪士 on 2019/10/07.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

protocol resultDelegate {
    func carryResult(carryResult:Int)
}

class ResultViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNum = Int()
    var secondNum = Int()
    var symbol = String()
    var result = Int()
    var delegate:resultDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "\(String(firstNum)) \(symbol) \(String(secondNum))  は..."
        resultLabel.text = String(result)
    }
    
    @IBAction func back(_ sender: Any) {
        
        delegate?.carryResult(carryResult: result)
        dismiss(animated: true, completion: nil)
    }
    
}
