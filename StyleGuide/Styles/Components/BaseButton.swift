//
//  BaseButton.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 12.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit
import ActionKit

public class BaseButton: LGButton {

    /*override public var intrinsicContentSize: CGSize {
        return CGSize(width: 10, height: 10)
    }*/
        
    /*override public func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        
        self.bgColor = UIColor.yellow
        
        if self.isDefaultTitleColor {
            self.titleColor = UIColor.green
        }
        
        if self.titleString.characters.count == 0 {
            self.titleString = "jou hhih jhjgfhgfv"
        }
        
        if self.isDefaultTitleFontName {
            self.titleFontName = "Glockenspiel"
        }
        
        #if !TARGET_INTERFACE_BUILDER
            
            // code for runtime
            //...
            
        #endif
    }*/
    
    fileprivate var _onTappedCompletion: (()->())?
    
    func onTapped(completion: @escaping ()->()) {
        
        //Sound.category = .ambient
        
        _onTappedCompletion = completion
        
        let tapGR = UITapGestureRecognizer() { [weak self] in
            
            if let weakSelf = self, let completion = weakSelf._onTappedCompletion {
                
                // TODO: preload sound into static url and play from url
                //Sound.play(url: fileURL)
                //Sound.stopAll()
                //Sound.play(file: "digitTapSound.mp3")
                
                weakSelf.layer.removeAllAnimations()
                weakSelf.animate(view: weakSelf, duration: 0.5, delay: 0)
                completion()
            }
        }
        
        tapGR.cancelsTouchesInView = false
        self.addGestureRecognizer(tapGR)
    }
    
    func animate(view: UIView, duration: TimeInterval, delay: TimeInterval) {
        
        // Start
        view.transform = CGAffineTransform(scaleX: 1, y: 1)
        UIView.animate(withDuration: duration/4, delay: delay, options: [.allowUserInteraction], animations: {
            
            // End
            view.transform = CGAffineTransform(scaleX: 1, y: 1.2)
            
        }) { (isFinished) in
            
            UIView.animate(withDuration: duration/4, delay: delay, options: [.allowUserInteraction], animations: {
                
                // End
                view.transform = CGAffineTransform(scaleX: 1.2, y: 0.9);
                
            }) { (isFinished) in
                
                UIView.animate(withDuration: duration/4, delay: delay, options: [.allowUserInteraction], animations: {
                    
                    // End
                    view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
                    
                }) { (isFinished) in
                    
                    UIView.animate(withDuration: duration/4, delay: delay, options: [.allowUserInteraction], animations: {
                        
                        // End
                        view.transform = CGAffineTransform(scaleX: 1, y: 1);
                        
                    }) { (isFinished) in
                        //...
                    }
                }
            }
        }
    }
}

extension BaseButton {
    
    override func setInspectableDefaults() {

        bgColor = .brown
        
        titleColor = .green
        titleFontName = "Glockenspiel"
        titleFontSize = 14
        titleString = "jou hhih jhjgfhgfv"
        verticalOrientation = false
        
        showTouchFeedback = true
        
        cornerRadius = 5
        fullyRoundedCorners = false
        borderColor = .magenta
        borderWidth = 2
        
        spacingTitleIcon = 16
        spacingTop = 8
        spacingBottom = 8
        spacingLeading = 16
        spacingTrailing = 16
        
        gradientStartColor = nil
        gradientEndColor = nil
        gradientHorizontal = false
        gradientRotation = 0
        
        leftIconString = ""
        leftIconFontName = ""
        leftIconFontSize = 10
        leftIconColor = .black
        leftImageSrc = nil
        leftImageWidth = 10
        leftImageHeight = 10
        leftImageColor = .black
        rightIconString = ""
        rightIconFontName = ""
        rightIconFontSize = 14
        rightIconColor = .black
        rightImageSrc = nil
        rightImageWidth = 10
        rightImageHeight = 10
        rightImageColor = .black
        
        shadowOffset = CGSize(width:0, height:0)
        shadowRadius = 0
        shadowOpacity = 1
        shadowColor = .black
        loadingSpinnerColor = .white
        loadingColor = .white
        loadingString = ""
        loadingFontName = nil
        loadingFontSize = 14
    }
}


