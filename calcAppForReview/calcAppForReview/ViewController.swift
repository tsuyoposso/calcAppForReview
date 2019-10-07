//
//  ViewController.swift
//  calcAppForReview
//
//  Created by 長坂豪士 on 2019/10/07.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, resultDelegate {

    @IBOutlet weak var firstNumTextField: UITextField!
    @IBOutlet weak var secondNumTextField: UITextField!
    @IBOutlet weak var beforeLabel: UILabel!
    @IBOutlet weak var beforeResultLabel: UILabel!
    
    var firstNum = Int()
    var secondNum = Int()
    var result = 0
    var symbol = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func calcButton(_ sender: Any) {
        
        if let num1 = firstNumTextField.text, let num2 = secondNumTextField.text {
            firstNum = Int(num1)!
            secondNum = Int(num2)!
            
            if (sender as AnyObject).tag == 0 {
                result = firstNum + secondNum
                symbol = "+"
                
            } else if (sender as AnyObject).tag == 1 {
                result = firstNum - secondNum
                symbol = "-"
                
            } else if (sender as AnyObject).tag == 2 {
                result = firstNum * secondNum
                symbol = "×"
                
            } else if (sender as AnyObject).tag == 3 {
                result = firstNum / secondNum
                symbol = "÷"
            } else {
            }
        }
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    func carryResult(carryResult: Int) {
        beforeResultLabel.text = String(carryResult)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! ResultViewController
        
        // 引き継ぎたい変数たち
        nextVC.result = result
        nextVC.firstNum = firstNum
        nextVC.secondNum = secondNum
        nextVC.symbol = symbol
        
        // 結果画面のresultはViewControllerで使う
        nextVC.delegate = self
    }
    

}

