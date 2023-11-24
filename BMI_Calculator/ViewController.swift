//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by 오정석 on 23/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        makeUI()
        
        
        
    }
    
    
    func makeUI() {
        //텍스트 필드 대리자 설정
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        //버튼 둥글게 설정
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        
    }
    
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        
        
        
    }
    
    
    
}

extension ViewController: UITextFieldDelegate{
    
}
