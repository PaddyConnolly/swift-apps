//
//  CustomButton.swift
//  CourseworkTest
//
//  Created by Connolly, Patrick (IRG) on 30/03/2020.
//  Copyright © 2020 Connolly, Patrick (IRG). All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    let size = CGFloat(175) // Diameter
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupButton() {
        setTitleColor(.black, for: .normal)
        backgroundColor                                         = UIColor.white
        titleLabel?.font                                        = UIFont(name: "Consolas", size: 16)
        titleLabel?.numberOfLines                               = 0
        titleLabel?.textAlignment                               = .center
        bounds.size.width                                       = size
        bounds.size.height                                      = size
        layer.cornerRadius                                      = 0.5 * bounds.size.width
        layer.borderWidth                                       = 3.0
        layer.borderColor                                       = UIColor.orange.cgColor
        heightAnchor.constraint(equalToConstant: size).isActive = true
        widthAnchor.constraint(equalToConstant: size).isActive  = true
        clipsToBounds                                           = true
        setShadow()
    }
    
 
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.6)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
}
