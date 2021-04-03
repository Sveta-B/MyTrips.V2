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
            layer.cornerRadius = frame.height / 2
            clipsToBounds = true
            layer.masksToBounds = false
            layer.shadowRadius = 10
            layer.shadowOpacity = 1
            layer.shadowOffset = CGSize(width: 3, height: 3)
            layer.shadowColor = #colorLiteral(red: 0.4669386148, green: 0.7963046432, blue: 0.9300357699, alpha: 1)
            
        }
}
