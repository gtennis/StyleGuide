//
//  DemoColorView1.swift
//  styleguides
//
//  Created by Gytenis Mikulenas on 13.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit

class DemoColorView1: BaseButton {

    override func setInspectableDefaults() {
        
        super.setInspectableDefaults()
        
        self.bgColor = MyColors.grayLight2
        self.titleString = "MyColors.grayLight2"
    }
}
