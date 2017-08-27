//
//  DesignableView.swift
//  MySavings
//
//  Created by Gytenis Mikulenas on 01.08.17.
//  Copyright © 2017 Gytenis Mikulėnas 
//  https://github.com/GitTennis/SuccessFramework
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE. All rights reserved.
//

import UIKit

@IBDesignable
public class DesignableView: UIView {

    @IBInspectable public var borderColorIB: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColorIB.cgColor
        }
    }
    
    @IBInspectable public var borderWidthIB: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidthIB
        }
    }
    
    @IBInspectable public var cornerRadiusIB: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadiusIB
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable public var shadowColorIB: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColorIB.cgColor
        }
    }
    
    @IBInspectable public var shadowRadiusIB: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadiusIB
        }
    }
    
    @IBInspectable public var shadowOpacityIB: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacityIB)
        }
    }
    
    @IBInspectable public var shadowOffsetYIB: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetYIB
        }
    }
}
