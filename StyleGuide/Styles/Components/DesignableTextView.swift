//
//  DesignableTextView.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 24.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit
import GrowingTextView

class DesignableTextView: GrowingTextView, StyleGuideHelper {
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        self.setInspectableDefaults()
        
        self.autocorrectionType = .no
        self.spellCheckingType = .no
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
    
    @IBInspectable var _textFontName: String = "System" {
        didSet {
            self.commonUpdateTextFontIfNeeded()
        }
    }
    
    @IBInspectable var _textFontSize: CGFloat = 1 {
        didSet {
            self.commonUpdateTextFontIfNeeded()
        }
    }
    
    fileprivate func commonUpdateTextFontIfNeeded() {
        super.font = self.font(fontName: _textFontName, size: _textFontSize)
    }
    
    @IBInspectable var _tintColor: UIColor! {
        didSet {
            super.tintColor = _tintColor
        }
    }
    
    public override var tintColor: UIColor! {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _tintColor = tintColor
        }
    }
    
    @IBInspectable var _fullyRoundedCorners: Bool = false
    
    @IBInspectable var _cornerRadius: CGFloat! {
        didSet {
            if _fullyRoundedCorners {
                layer.cornerRadius = frame.size.height/2
            }else{
                layer.cornerRadius = _cornerRadius
            }
        }
    }
    
    @IBInspectable var _borderWidth: CGFloat! {
        didSet {
            layer.borderWidth = _borderWidth
        }
    }
    
    @IBInspectable var _borderColor: UIColor! {
        didSet {
            layer.borderColor = _borderColor.cgColor
        }
    }
    
    @IBInspectable var _placeHolder: String? {
        didSet {
            super.placeHolder = _placeHolder
        }
    }
    
    override var placeHolder: String? {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            self.commonUpdatePlaceholderFontIfNeeded()
        }
    }
    
    @IBInspectable var _placeholderColor: UIColor = UIColor.clear {
        didSet {
            self.commonUpdatePlaceholderFontIfNeeded()
        }
    }
    
    override var placeHolderColor: UIColor {
        didSet {
            _placeholderColor = placeHolderColor            
        }        
    }
    
    @IBInspectable var _placeholderFontName: String = "System" {
        didSet {
            self.commonUpdatePlaceholderFontIfNeeded()
        }
    }
    
    @IBInspectable var _placeholderFontSize: CGFloat = 1 {
        didSet {
            self.commonUpdatePlaceholderFontIfNeeded()
        }
    }
    
    fileprivate func commonUpdatePlaceholderFontIfNeeded() {
        
        if let newValue = placeHolder {
            let theFont = self.font(fontName: _placeholderFontName, size: _placeholderFontSize)
            
            //super.placeHolderColor = _placeholderColor
            
            super.attributedPlaceHolder = NSAttributedString (
                string: newValue,
                attributes: [NSForegroundColorAttributeName: self._placeholderColor, NSFontAttributeName: theFont]
            )
        }
    }
    
    fileprivate var _isLoadedForInterfaceBuilder: Bool = false
    
    public override func prepareForInterfaceBuilder() {
        
        _isLoadedForInterfaceBuilder = true
        
        super.backgroundColor = _bgColor
        super.tintColor = _tintColor
        super.textColor = _textColor
        super.tintColor = .red
        super.placeHolder = _placeHolder
        self.commonUpdateTextFontIfNeeded()
        self.commonUpdatePlaceholderFontIfNeeded()
        super.layer.cornerRadius = _cornerRadius
        super.layer.borderWidth = _borderWidth
        super.layer.borderColor = _borderColor.cgColor
    }
}

// MARK: Default configuration
extension DesignableTextView {
    
    func setInspectableDefaults() {
        
        assert(false, "Override and set values in child class")
    }
}

