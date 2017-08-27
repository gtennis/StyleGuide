//
//  DesignableLabel.swift
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

// https://github.com/yume190/CustomView/blob/master/LiveRender.md
//
// ********************************************
// ************* Live Render Flow *************
// ********************************************
//
//  APP running     Debug Selected Views
//                    (Live Rendering)
//
// initWithCoder:      initWithFrame:
//      ┋                    ┋
//      ┋                    ⬇︎
//      ┋          prepareForInterfaceBuilder
//      ┋                    ┋
//      ⬇︎                   ⬇︎
//  drawRect:            drawRect:

@IBDesignable
class DesignableLabel: UILabel, StyleGuideHelper {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate var _isLoadedForInterfaceBuilder: Bool = false
    
    public override func prepareForInterfaceBuilder() {
        
        _isLoadedForInterfaceBuilder = true
        
        super.backgroundColor = _bgColor
        super.numberOfLines = _numberOfLines
        super.text = _text
        super.textColor = _textColor
        self.commonUpdateFontIfNeeded()
        super.textAlignment = self.textAlignmentFromString(_textAlignment)
    }
    
    func commonInit() {
        
        self.setInspectableDefaults()
    }
    
    @IBInspectable var _bgColor: UIColor! {        
        didSet {
            super.backgroundColor = _bgColor
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            if let color = backgroundColor {
                _bgColor = color
            } else {
                _bgColor = .clear
            }
        }
    }
    
    @IBInspectable var _numberOfLines: Int! {
        didSet {
            super.numberOfLines = _numberOfLines
        }
    }
    
    override var numberOfLines: Int {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _numberOfLines = numberOfLines
        }
    }
    
    @IBInspectable var _text: String? {
        didSet {
            super.text = _text
        }
    }
    
    override var text: String? {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _text = text
        }
    }
    
    @IBInspectable public var _textColor: UIColor! {
        didSet {
            super.textColor = _textColor
        }
    }
    
    override var textColor: UIColor! {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _textColor = textColor
        }
    }
    
    @IBInspectable public var _textFontName: String! {
        didSet {
            self.commonUpdateFontIfNeeded()
        }
    }
    
    override var font: UIFont! {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _textFontName = font.fontName
            _textFontSize = font.pointSize
        }
    }
    
    @IBInspectable var _textFontSize: CGFloat = 17 {
        didSet {
            self.commonUpdateFontIfNeeded()
        }
    }
    
    @IBInspectable var _adjustsFontSizeToFitWidth: Bool = false {
        didSet {
            self.commonUpdateFontIfNeeded()
        }
    }
    
    override var adjustsFontSizeToFitWidth: Bool {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        }
    }
    
    @IBInspectable var _minimumScaleFactor: CGFloat = 0.5 {
        didSet {
            self.commonUpdateFontIfNeeded()
        }
    }
    
    
    override var minimumScaleFactor: CGFloat {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _minimumScaleFactor = minimumScaleFactor
        }
    }
    
    fileprivate func commonUpdateFontIfNeeded() {
        
        super.font = self.font(fontName: _textFontName, size: _textFontSize)
        super.adjustsFontSizeToFitWidth = _adjustsFontSizeToFitWidth
        super.minimumScaleFactor = _minimumScaleFactor
    }
    
    @IBInspectable var _textAlignment: String! {
        didSet {
            super.textAlignment  = self.textAlignmentFromString(_textAlignment)
        }
    }
    
    override var textAlignment: NSTextAlignment {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _textAlignment = self.textAlignmentFromEnum(textAlignment)
        }
    }
    
    
    // Dynamic Type (Automatically adjusts font)
    // Line break: Truncate Tail
    // Autoshrink: Fixed Font Size, Minimum font scale (0.5), Maximum font scale (0.5)
    // shadow
    // userInteraction, isEnabled
    // alpha
}

// MARK: Default configuration
extension DesignableLabel {
    
    func setInspectableDefaults() {
        
        assert(false, "Override and set values in child class")
    }
}

