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
    
    var bmiManager = BMICaclculatorManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
    }
    
    func makeUI() {
        //텍스트 필드 대리자 설정
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        
        //버튼 둥글게 설정
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }
    
    //버튼누르면 다음화면으로 넘어가는 과정 segue 실행
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
    //다음화면으로 넘어갈지 말지 허락(조건)⭐️
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == ""{
            mainLabel.text = "키와 몸무게를 입력하서야만 합니다!!"
            mainLabel.textColor = UIColor.red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    //데이터 전달⭐️
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            
            let secondVC = segue.destination as! SecondViewController
            
            //계산된 결과값을 다음화면 변수로 전달
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        // 다음화면으로 가기전에 텍스트 필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
        
    }
    
    
    
    
    
    
    
}


extension ViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == ""{
            return true  //글자 입력을 허용
        }
        return false  //글자 입력을 허용하지 않음
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //두개의 텍스트 필드를 모두 종료 (키보드 내리기)
        if heightTextField.text != "", weightTextField.text != ""{
            weightTextField.resignFirstResponder()
            return true
        //두번째 텍스트필드로 넘어가도록
        }else if heightTextField.text != ""{
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //다른 영역을 눌렀을때 키보드 내리기
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}
