//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var formula: Formula = Formula()
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var reverseSignButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    
    
    @IBOutlet var operandButton: [UIButton]!
    @IBOutlet var operatorButton: [UIButton]!
    
    
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    
    
    //0. operand 누르면
    //1. 아래 stackView에 입력
    //2. operator 누르면
    //3. 왼쪽의 stackView 부호변경
    //4. 입력했던 operand가 UIScrollView로 이동 (만약 0이면 이동 x)
    //5. 입력했던 operator가 UIScrollView로 이동
    //6. 아래 stackView 숫자 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func clickOperandButton() {
        
    }


}

