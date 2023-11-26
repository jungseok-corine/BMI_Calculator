//
//  BMICaclculatorManager.swift
//  BMI_Calculator
//
//  Created by 오정석 on 25/11/2023.
//

import Foundation
import UIKit

struct BMICaclculatorManager{
    
    //BMI계산 결과값 보관위한 변수
    var bmi: BMI?
    
    //BMI얻기 메서드
    mutating func getBMI(height: String, weight: String) -> BMI {
        //BMI만들기 메서드 호출
        calculateBMI(height: height, weight:weight)
        //BMI리턴
        return bmi ?? BMI(value: 0.0, advice: "문제발생", matchColor: .white)
    }
    
    //BMI만들기 메서드(BMI수치 계산 - BMI구조체 인스턴스 만드는 메서드)
    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else{
            bmi = BMI(value: 0.0, advice: "문제발생", matchColor: .white)
            return
        }
        
        //반올림
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        //BMI계산값으로 advice, color 값 받기
        switch bmiNum{
        case ..<18.6:
            let color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "저체중", matchColor: color)
        case 18.6..<23.0:
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 207/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "표준", matchColor: color)
        case 23.0..<25.0:
            let color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "과체중", matchColor: color)
        case 25.0..<30.0:
            let color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "중도비만", matchColor: color)
        case 30.0...:
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            bmi = BMI(value: bmiNum, advice: "고도비만", matchColor: color)
        default:
            bmi = BMI(value: 0.0, advice: "문제발생", matchColor: .white)
        }
    }
    
    
    
}
