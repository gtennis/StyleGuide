//
//  BaseLabel.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 23.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

class BaseLabel: DesignableLabel {
    
    
}

// MARK: Default configuration
extension BaseLabel {

    override func setInspectableDefaults() {
        
        _bgColor = UIColor.lightGray
        _text = "NormalLabel"
        _textColor = UIColor.green
        _numberOfLines = 1
        _textFontName = "Glockenspiel"
        _textFontSize = 12
        _textAlignment = "center"
        _adjustsFontSizeToFitWidth = false
        _minimumScaleFactor = 0.5
    }
}
