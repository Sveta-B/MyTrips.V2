//
//  CustomView.swift
//  MyTrips.V2
//
//  Created by Света Брасс on 2.04.21.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
            super.init(frame: frame)
    setRadiusAndShadow()
        }
        
        required init?(coder eDecoder: NSCoder) {
            super.init(coder: eDecoder)
            setRadiusAndShadow()
            
        }
        
        func setRadiusAndShadow()  {
            layer.cornerRadius =  10
            clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowRadius = 10
            layer.shadowOpacity = 1
            layer.shadowOffset = CGSize(width: 3, height: 3)
            layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
        }
}
