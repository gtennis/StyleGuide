//
//  BaseTextView.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 18.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

class BaseTextView: DesignableTextView {
    
    
}

// MARK: Default configuration
extension BaseTextView {

    override func setInspectableDefaults() {
        
        _bgColor = .magenta
        _tintColor = .white
        _textColor = .yellow
        _textFontName = "Glockenspiel"
        _textFontSize = 15
        _placeHolder = "BaseTextView"
        _placeholderFontName = "System"
        _placeholderFontSize = 15
        _placeholderColor = .blue
        
        _cornerRadius = 10
        _borderWidth = 2
        _borderColor = UIColor.brown
        
        /*
         _placeholder = "BaseTextField"
         _placeholderFontName = "Glockenspiel"
         _placeholderFontSize = 15
         _placeholderColor_ = .white*/
        
        //_placeholderBouncyColor = UIColor.blue
        //_placeholderBouncyFontName = "Glockenspiel"
        //_placeholderBouncyFontSize = 15
    }
}
