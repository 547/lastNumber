//
//  ViewController.swift
//  lastNumberTest
//
//  Created by seven on 2018/3/27.
//  Copyright © 2018年 seven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func change(_ sender: UIButton) {
        guard let number = Decimal.init(string: textField.text ?? "") else { return }
        let result = NumberHandler.lastAdd(Decimal.init(-100), about: number)
        textField.text = result.description
    }

}

class NumberHandler {
    
}
extension NumberHandler {
    ///末位数 加 几
    static func lastAdd(_ addNumber:Decimal, about number:Decimal) -> Decimal {
        let numberString = number.description
        
        let pointIndex = numberString.reversed().index(of: ".") ?? 0
        let multiple = pow(Decimal.init(10), pointIndex)
        
        let largerNumber = number * multiple
        let changedNumber = largerNumber + addNumber
        let shrinkNumber = changedNumber / multiple
        return shrinkNumber
    }
}
