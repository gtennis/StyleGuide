//
//  HTYBounceTextField.swift
//  HTYBounceTextFieldDemo
//
//  Created by  on 10/28/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

// Bouncy placeholder!!!

import UIKit

@IBDesignable
public class BouncyPlaceholderTextField: UITextField, StyleGuideHelper {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        /*_fakePlaceholderLabel = UILabel(frame: placeholderRect(forBounds: bounds))
        _fakePlaceholderLabel.font = font
        _fakePlaceholderLabel.text = placeholder
        _fakePlaceholderLabel.textColor = .white
        _fakePlaceholderLabel.alpha = 1.0
        addSubview(_fakePlaceholderLabel)*/
        
        _rightPlaceholderLabel = UILabel(frame: placeholderRect(forBounds: bounds))
        _rightPlaceholderLabel.font = font
        _rightPlaceholderLabel.backgroundColor = .clear
        _rightPlaceholderLabel.text = _rightPlaceholder
        _rightPlaceholderLabel.alpha = 0.0
        
        addSubview(_rightPlaceholderLabel)
        
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        
        self.setInspectableDefaults()
    }
    
    @IBInspectable var _bgColor: UIColor! {
        didSet {
            super.backgroundColor = _bgColor
        }
    }
    
    public override var backgroundColor: UIColor? {
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
    
    // Fix: need to add _ at the end because there might be some internal _text var used inside text field and by doing that text value is not persisted when navigating outside of the thext field
    @IBInspectable var _text_: String! {
        didSet {
            super.text = _text_
            
            self._rightPlaceholderLabel.transform = self._rightPlaceholderLabel.transform.translatedBy(x: self._translateX, y: 0.0)
            self._rightPlaceholderLabel.alpha = 1
        }
    }
    
    public override var text: String? {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _text_ = text
        }
    }
    
    @IBInspectable var _textFontName: String = "System" {
        didSet {
            self.commonUpdateFontIfNeeded()
        }
    }
    
    @IBInspectable var _textFontSize: CGFloat = 1 {
        didSet {
            self.commonUpdateFontIfNeeded()
        }
    }
    
    fileprivate func commonUpdateFontIfNeeded() {
        super.font = self.font(fontName: _textFontName, size: _textFontSize)
    }
    
    /*@IBInspectable var _textAlignment: String! {
     didSet {
     self.textAlignment = self.textAlignmentFromString(_textAlignment)
     }
     }*/
    
    @IBInspectable var _textColor: UIColor! {
        didSet {
            super.textColor = _textColor
        }
    }
    
    public override var textColor: UIColor? {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            if let color = textColor {
                _textColor = color
            } else {
                _textColor = .clear
            }
        }
    }
    
    override public var font: UIFont! {
        didSet {
            if !_isLoadedForInterfaceBuilder { return }
            
            _textFontName = font.fontName
            _textFontSize = font.pointSize
        }
    }
    
    @IBInspectable var _placeholder: String! {
        didSet {
            self._updatePlaceholder()
            self._updatePlaceholderBouncy()
        }
    }
    
    public override var placeholder: String? {
        didSet {
            #if TARGET_INTERFACE_BUILDER
                if !_isLoadedForInterfaceBuilder { return }
            #endif
            
            _placeholder = placeholder
            
            self._updatePlaceholder()
            
            //if !_willHidePlaceholder {
            self._updatePlaceholderBouncy()
            //}
        }
    }
    
    @IBInspectable var _placeholderColor: UIColor = UIColor.clear {
        didSet {
            self._updatePlaceholder()
        }
    }
    
    @IBInspectable var _placeholderFontName: String = "System" {
        didSet {
            self._updatePlaceholder()
        }
    }
    
    @IBInspectable var _placeholderFontSize: CGFloat = 1 {
        didSet {
            self._updatePlaceholder()
        }
    }
    
    @IBInspectable var _placeholderBouncyFontName: String = "System" {
        didSet {
            self._updatePlaceholderBouncy()
        }
    }
    
    @IBInspectable var _placeholderBouncyFontSize: CGFloat = 1 {
        didSet {
            self._updatePlaceholderBouncy()
        }
    }
    
    @IBInspectable var _placeholderBouncyColor: UIColor = UIColor.clear {
        
        didSet {
            
            self._updatePlaceholderBouncy()
        }
    }
    
    internal func _updatePlaceholder() {
        
        if let newValue = _placeholder {
            
            super.placeholder = nil
            
            let theFont = self.font(fontName: _placeholderFontName, size: _placeholderFontSize)
            
            self.attributedPlaceholder = NSAttributedString (
                string: newValue,
                attributes: [NSForegroundColorAttributeName: _placeholderColor, NSFontAttributeName: theFont]
            )            
        } else {
            
            super.attributedPlaceholder = nil
            super.placeholder = nil
        }
    }
    
    internal func _updatePlaceholderBouncy() {
        
        if _placeholder != nil {
            
            _rightPlaceholder = attributedPlaceholder != nil ? attributedPlaceholder!.string : " "
            let theFont = self.font(fontName: _placeholderBouncyFontName, size: _placeholderBouncyFontSize)
            _rightPlaceholderLabel.font = theFont
            _rightPlaceholderLabel.textColor = _placeholderBouncyColor
            _rightPlaceholderLabel.text = _rightPlaceholder
            let nsText: NSString = _rightPlaceholder as NSString
            _rightPlaceholderLabelSize = nsText.size(attributes: [NSFontAttributeName: _rightPlaceholderLabel.font!])
        }
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
    
    //fileprivate var _willHidePlaceholder: Bool = false
    fileprivate var _rightPlaceholder: String = ""
    fileprivate var _fakePlaceholderLabel: UILabel!
    fileprivate var _rightPlaceholderLabel: UILabel!
    fileprivate var _rightPlaceholderLabelSize: CGSize!
    fileprivate var _translateX: CGFloat!
    {
        get {
            let attributes = [NSFontAttributeName: font!]
            let rightPlaceholderTextSize = _rightPlaceholderLabel.text!.size(attributes: attributes)
            let rightPlaceholderTextWidth = rightPlaceholderTextSize.width
            let translateX = textRect(forBounds: bounds).width - rightPlaceholderTextWidth
            return translateX
        }
    }
    
    fileprivate var _isLoadedForInterfaceBuilder: Bool = false
    
    public override func prepareForInterfaceBuilder() {
        
        _isLoadedForInterfaceBuilder = true
        
        super.backgroundColor = _bgColor
        super.tintColor = _tintColor
        super.textColor = _textColor
        self._updatePlaceholder()
        self._updatePlaceholderBouncy()
        self.commonUpdateFontIfNeeded()
        super.layer.cornerRadius = _cornerRadius
        super.layer.borderWidth = _borderWidth
        super.layer.borderColor = _borderColor.cgColor
    }
    
    // MARK: - UITextField Observing
    
    override public func willMove(toSuperview newSuperview: UIView!) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(didBeginEditing(notification:)), name:NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(didEndEditing(notification:)), name:NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    func textFieldDidChange(_ textField: UITextField) {
        
        /*if let text = self.text, text.characters.count > 0 {
         
         if text.characters.count > 1 {
         
         let nsText: NSString = text as NSString
         let size: CGSize = nsText.size(attributes: [NSFontAttributeName: self.font!])
         let leftMargin: CGFloat = 10
         let rightMargin: CGFloat = 10
         
         if (textField.bounds.size.width - size.width) < (_rightPlaceholderLabelSize.width + leftMargin + rightMargin) {
         
         UIView.animate(withDuration: 0.5, animations: { [weak self] in
         self?._rightPlaceholderLabel.alpha = 0
         })
         
         } else {
         
         UIView.animate(withDuration: 0.5, animations: { [weak self] in
         self?._rightPlaceholderLabel.alpha = 1
         })
         }
         } else {
         
         self._rightPlaceholderLabel.alpha = 1
         }
         
         } else {
         
         self._rightPlaceholderLabel.alpha = 0
         /*UIView.animate(withDuration: 0.5, animations: { [weak self] in
         self?._rightPlaceholderLabel.alpha = 1
         })*/
         }*/
    }
    
    public func didBeginEditing(notification: NSNotification) {
        
        //_willHidePlaceholder = true
        placeholder = nil
        
        if let object = notification.object as? BouncyPlaceholderTextField, object == self {
            
            self.attributedPlaceholder = nil
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseIn, animations: { () -> Void in
                if self.text == nil || self.text!.isEmpty {
                    //self._fakePlaceholderLabel.transform = self._fakePlaceholderLabel.transform.translatedBy(x: self._translateX, y: 0.0)
                    //self._fakePlaceholderLabel.alpha = 0.0
                    
                    self._rightPlaceholderLabel.transform = self._rightPlaceholderLabel.transform.translatedBy(x: self._translateX, y: 0.0)
                    self._rightPlaceholderLabel.alpha = 1.0
                }
            }, completion: {(finished) in
                //self._willHidePlaceholder = false
            })
        }
    }
    
    public func didEndEditing(notification: NSNotification) {
        
        if let object = notification.object as? BouncyPlaceholderTextField, object == self {
            
            self._updatePlaceholder()
            
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseIn, animations: { () -> Void in
                if self.text == nil || self.text!.isEmpty {
                    //self._fakePlaceholderLabel.transform = self._fakePlaceholderLabel.transform.translatedBy(x: -self._translateX, y: 0.0)
                    //self._fakePlaceholderLabel.alpha = 1.0
                    
                    self._rightPlaceholderLabel.transform = self._rightPlaceholderLabel.transform.translatedBy(x: -self._translateX, y: 0.0)
                    self._rightPlaceholderLabel.alpha = 0.0
                    
                    self.placeholder = self._rightPlaceholder
                }
            }, completion: nil)
        }
    }
}

// MARK: Default configuration
extension BouncyPlaceholderTextField {
    
    func setInspectableDefaults() {
        
        assert(false, "Override and set values in child class")        
    }
}
