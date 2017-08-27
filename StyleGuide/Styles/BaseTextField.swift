//
//  BaseTextField.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 18.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

class BaseTextField: BouncyPlaceholderTextField {

    
}

// MARK: Default configuration
extension BaseTextField {
    
    override func setInspectableDefaults() {

        _bgColor = UIColor.orange
        _tintColor = .white
        _textColor = .yellow
        _textFontName = "Glockenspiel"
        _textFontSize = 15
        //_textAlignment = "left"
        
        _cornerRadius = 10
        _borderWidth = 2
        _borderColor = UIColor.red
        
        _placeholder = "BaseTextField"
        _placeholderFontName = "Glockenspiel"
        _placeholderFontSize = 15
        _placeholderColor = .white
        
        _placeholderBouncyColor = UIColor.blue
        _placeholderBouncyFontName = "Glockenspiel"
        _placeholderBouncyFontSize = 15
    }
}
