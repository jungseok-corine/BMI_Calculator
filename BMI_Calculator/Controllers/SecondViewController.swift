//
//  SecondViewController.swift
//  BMI_Calculator
//
//  Created by 오정석 on 24/11/2023.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        //화면에 값넣기
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = "\(bmi.value)"
        bmiNumberLabel.backgroundColor = bmi.matchColor
        adviceLabel.text = bmi.advice
        
        
        
        
        
    }
    
    func makeUI(){
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        
        
        
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

}
