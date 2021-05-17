//
//  CustomTextField.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 26.04.21.
//

import UIKit

class CustomTextField: UITextField {
    
    
    override init(frame: CGRect) {
   
        super.init(frame: frame)
        setRadiusAndShadow()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadiusAndShadow()
    
    }
    
    func  setRadiusAndShadow() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9529411765, blue: 0.9607843137, alpha: 1)
    }
    
}
