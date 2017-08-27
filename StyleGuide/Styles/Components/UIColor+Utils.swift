//
//  UIColor+Utils.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 13.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

// https://stackoverflow.com/a/38435309
extension UIColor {
    
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        }else{
            return nil
        }
    }
}

extension UIColor {
    
    func isEqualColor(_ color: UIColor) -> Bool{
        // some kind of weird rounding made the colors unequal so had to compare like this
        
        var red:CGFloat = 0
        var green:CGFloat  = 0
        var blue:CGFloat = 0
        var alpha:CGFloat  = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var red2:CGFloat = 0
        var green2:CGFloat  = 0
        var blue2:CGFloat = 0
        var alpha2:CGFloat  = 0
        color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        let isRedEqual = Int(red*255) == Int(red2*255)
        let isGreenEqual = Int(green*255) == Int(green2*255)
        let isBlueEqual = Int(blue*255) == Int(blue2*255)
        let isAlphaEqual = alpha == alpha2
        
        return (isRedEqual && isGreenEqual && isBlueEqual && isAlphaEqual)
    }
    
    // https://stackoverflow.com/a/28645384
    func rgb() -> String? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int64(fRed * 255.0)
            let iGreen = Int64(fGreen * 255.0)
            let iBlue = Int64(fBlue * 255.0)
            let iAlpha = Int64(fAlpha * 255.0)
            
            //  (Bits 24-31 are alpha, 16-23 are red, 8-15 are green, 0-7 are blue).
            let rgb = (iAlpha << 24) + (iRed << 16) + (iGreen << 8) + iBlue
            
            let rgbString = String(format:"%2X", rgb)
            
            return rgbString
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}
