//
//  FloatingLabelTextField.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 22.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

//
//  BaseTextField.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 18.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class FloatingLabelTextField: SkyFloatingLabelTextField {
    
    // override to change the bounds of the top title placeholder view
    override func titleLabelRectForBounds(_ bounds: CGRect, editing: Bool) -> CGRect {
        
        let bounds = super.titleLabelRectForBounds(bounds, editing: editing)
        return self.adjustedTopPlaceholderBounds(bounds)
    }
    
    // override to change the bounds of the placeholder view
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        return self.adjustedTextBounds(bounds)
    }
    
    // override to change the bounds of the control (inherited from UITextField)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return self.adjustedTextBounds(bounds)
    }
    
    // override to change the bounds of the control when editing / selected (inherited from UITextField)
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return self.adjustedTextBounds(bounds)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        
        var bounds = super.clearButtonRect(forBounds: bounds)
        bounds.origin.y = bounds.origin.y + 6
        
        return bounds
    }
    
    // lineViewRectForBounds
    /*override func lineViewRectForBounds(_ bounds: CGRect, editing: Bool) -> CGRect {
     
     }*/
}

// MARK: Config
extension FloatingLabelTextField {
    
    internal func adjustedTopPlaceholderBounds(_ bounds: CGRect) -> CGRect {
        
        let leftOffset: CGFloat = 2
        let topOffset: CGFloat = 2
        
        var bounds = bounds
        
        bounds.origin.x = bounds.origin.x + leftOffset
        bounds.size.width = bounds.size.width - (leftOffset * 2)
        bounds.origin.y = bounds.origin.y + topOffset
        
        return bounds
    }
    
    internal func adjustedTextBounds(_ bounds: CGRect) -> CGRect {
        
        let leftOffset: CGFloat = 10
        let rightOffset: CGFloat = 10
        let topOffset: CGFloat = 20
        let bottomOffset: CGFloat = 4
        
        var bounds = bounds
        
        bounds.origin.x = bounds.origin.x + leftOffset
        bounds.size.width = bounds.size.width - (leftOffset + rightOffset)
        bounds.origin.y = bounds.origin.y + topOffset
        bounds.size.height = bounds.size.height - (topOffset + bottomOffset)
        
        return bounds
    }
}
