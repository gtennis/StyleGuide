//
//  GlobalStyles.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 13.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit
import FontBlaster

// https://stablekernel.com/how-to-keep-your-style-code-clean-in-swift/
struct MyAppStyle {
    
    // MARK: Default colors for all UI elements
    static var textColorDefault: UIColor {return MyColors.blue}
    static var backgroundColorDefault: UIColor {return MyColors.yellow}
    
    static var gradientStartColorDefault: UIColor? {return nil}
    static var gradientEndColorDefault: UIColor? {return nil}
    
    static var borderColorDefault: UIColor {return MyColors.black}
    
    // MARK: Default text sizes for all UI elements
    static var textFontSizeDefault: CGFloat {return 14.0}
    static var textFontNameDefault: String {return "System"}
}

// Global colors
struct MyColors {
    
    static var grayLight: UIColor = UIColor(rgbValue: 0x999999)
    static var grayLight1: UIColor = UIColor(rgbValue: 0xDDDDDD)
    static var grayLight2: UIColor = UIColor(rgbValue: 0xF1F1F1)
    static var grayDark: UIColor = UIColor(rgbValue: 0x363636)
    static var gray: UIColor = UIColor(rgbValue: 0x606060)
    
    static var black: UIColor = UIColor(rgbValue: 0x000000)
    
    static var redLight: UIColor = UIColor(rgbValue: 0xFD4545)
    static var red: UIColor = UIColor(rgbValue: 0xFF0000)
    static var redDark: UIColor = UIColor(rgbValue: 0x9C0707)
    
    static var blue: UIColor = UIColor(rgbValue: 0x0000FF)
    
    static var white: UIColor = UIColor(rgbValue: 0xFFFFFF)
    
    static var yellow: UIColor = UIColor(rgbValue: 0xFFFF00)
    
    static var green: UIColor = UIColor(rgbValue: 0x46AF65)
}

class GlobalStyles {

    static func initialize() {
        
        // Load fonts which will be globaly available
        // PS: when adding/dragging font to the project, please make sure to check "Add to target" checkbox 
        FontBlaster.debugEnabled = true
        FontBlaster.blast { (fonts) -> Void in
            print("Loaded Fonts", fonts)
        }
    }
}

extension UIColor {
    
    convenience init(rgbValue: UInt) {
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    convenience init(rgbValue: UInt, alpha: Float) {
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
