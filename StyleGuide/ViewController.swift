//
//  ViewController.swift
//  StyleGuide
//
//  Created by Gytenis Mikulenas on 12.08.17.
//  Copyright © 2017 Gytenis Mikulenas. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GrowingTextView
import SkyFloatingLabelTextField

class ViewController: UIViewController, GrowingTextViewDelegate {
    
    @IBOutlet weak var button: BaseButton!    
    @IBOutlet weak var button2: BaseButton!
    
    @IBOutlet weak var baseLabel: NormalLabel!
    @IBOutlet weak var normalLabel: PriceLabel!
    
    @IBOutlet weak var textView: GrowingTextView!
    private var isBlue = true
    
    @IBOutlet weak var textField0: SkyFloatingLabelTextField!
    @IBOutlet weak var textField1: NormalTextField!    
    
    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    fileprivate var returnKeyHandler : IQKeyboardReturnKeyHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.button.isEnabled = false
        
        self.button.onTapped {
            
            //NSLog("tapped")
        }
        
        //self.button2.backgroundColor = .white
        
        //self.baseLabel.text = "First sentence. Second sentence. Third sentence. Fourth sentence. Fifth sentence. Yo"
        self.baseLabel.backgroundColor = .red
        
        //self.baseLabel.backgroundColor = UIColor.brown
        //self.baseLabel.textColor = UIColor.white
        //self.normalLabel.font = UIFont.systemFont(ofSize: 30)
        
        //let color =  self.baseLabel.backgroundColor?.rgb()
        //self.normalLabel.textAlignment = .center
        
        //self.normalLabel.adjustsFontSizeToFitWidth = true
        //self.normalLabel.minimumScaleFactor = 0.5
        
        self.normalLabel.text = "Override"
        
        //self.normalLabel.backgroundColor = .yellow
        //self.normalLabel.font = UIFont(name: "Glockenspiel", size: 40)
                
        //returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        //returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyType.done
        //self.textView.returnKeyType = .default
        
        /*textInputs[0].accessibilityLabel = "standard_text_input"
        textInputs[0].placeHolderText = "Normal text"
        
        textInputs[1].placeHolderText = "Password"
        textInputs[1].type = .password
        
        textInputs[2].placeHolderText = "Numeric"
        textInputs[2].type = .numeric
        
        textInputs[3].placeHolderText = "Selection"
        textInputs[3].type = .selection
        textInputs[3].tapAction = { [weak self] in
            guard let strongself = self else { return }
            strongself.tap()
        }
        
        textInputs[4].placeHolderText = "Multiline"
        textInputs[4].type = .multiline
        textInputs[4].showCharacterCounterLabel(with: 160)*/
        
        //automaticallyAdjustsScrollViewInsets = false
        
        //textView.minHeight = 100
        //textView.maxHeight = 100
        
        textView.minHeight = 40
        textView.maxHeight = 300
        //textView.isScrollEnabled = false
    
        self.textView.delegate = self
        self.textView.placeHolderColor = .brown
        
        self.textField1.placeholder = "some placeholder"
        //self.textField1.text = "testas"
        //self.textField1.backgroundColor = .brown
        self.textField1.textColor = .white
        self.textField1.backgroundColor = .green
        
        // Placeholder
        self.textField0.placeholderFont = UIFont(name: "Glockenspiel", size: 17)
        self.textField0.titleFont = UIFont(name: "Glockenspiel", size: 12)!
        self.textField0.tintColor = UIColor.green
        self.textField0.clearButtonMode = .whileEditing
        self.textField0.autocorrectionType = .no
        self.textField0.spellCheckingType = .no
    }

    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
                
        //self.bottomSpaceConstraint.constant = height
        
        //let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height)
        //self.scrollView.setContentOffset(bottomOffset, animated: true)
        
        var point = self.scrollView.contentOffset
        point.y = point.y + 18
        self.scrollView.setContentOffset(point, animated: true)
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

