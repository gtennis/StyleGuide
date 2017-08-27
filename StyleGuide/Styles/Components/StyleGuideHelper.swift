//
//  StyleGuideHelper.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 21.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

protocol StyleGuideHelper {

}

extension StyleGuideHelper where Self: UIView {
    
    func loadViewFromNib() -> UILabel {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "BaseLabel", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UILabel
        
        return view
    }
    
    func font(fontName: String, size: CGFloat) -> UIFont {
        
        var result: UIFont?
        
        if fontName != "System"  {
            result = UIFont(name:fontName, size:size)
        }
        
        if result == nil {
            result = UIFont.systemFont(ofSize: size)
        }
        
        return result!
    }
    
    func isEqualColor(_ color1: UIColor, _ color2: UIColor) -> Bool{
        // some kind of weird rounding made the colors unequal so had to compare like this
        
        var red:CGFloat = 0
        var green:CGFloat  = 0
        var blue:CGFloat = 0
        var alpha:CGFloat  = 0
        color1.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var red2:CGFloat = 0
        var green2:CGFloat  = 0
        var blue2:CGFloat = 0
        var alpha2:CGFloat  = 0
        color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        let isRedEqual = Int(red*255) == Int(red2*255)
        let isGreenEqual = Int(green*255) == Int(green2*255)
        let isBlueEqual = Int(blue*255) == Int(blue2*255)
        let isAlphaEqual = alpha == alpha2
        
        return (isRedEqual && isGreenEqual && isBlueEqual && isAlphaEqual)
    }
    
    func textAlignmentFromString(_ string: String) -> NSTextAlignment {
        
        switch string {
        case "left":
            return .left
        case "right":
            return .right
        case "center":
            return .center
        case "justified":
            return .justified
        default:
            return .left
        }
    }
    
    func textAlignmentFromEnum(_ alignment: NSTextAlignment)->String {
        
        switch alignment {
        case .left:
            return "left"
        case .right:
            return "right"
        case .center:
            return "center"
        case .justified:
            return "justified"
        default:
            return "unknown"
        }
    }
}
