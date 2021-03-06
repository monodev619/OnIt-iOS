//
//  HTYBounceTextField.swift
//  HTYBounceTextFieldDemo
//
//  Created by  on 10/28/15.
//  Copyright © 2015 Hanton. All rights reserved.
//

// From https://github.com/hanton/HTYTextField

import UIKit

open class KUITextField: UITextField {
    
    open var rightPlaceholder: String = "" {
        didSet {
            rightPlaceholderLabel.text = rightPlaceholder
        }
    }
    
    fileprivate var fakePlaceholderLabel: UILabel!
    fileprivate var rightPlaceholderLabel: UILabel!
    fileprivate var translateX: CGFloat!
        {
        get {
            let attributes = [NSFontAttributeName: font!]
            let rightPlaceholderTextSize = rightPlaceholderLabel.text!.size(attributes: attributes)
            let rightPlaceholderTextWidth = rightPlaceholderTextSize.width
            let translateX = textRect(forBounds: bounds).width - rightPlaceholderTextWidth
            return translateX
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fakePlaceholderLabel = UILabel(frame: placeholderRect(forBounds: bounds))
        fakePlaceholderLabel.font = font
        fakePlaceholderLabel.text = placeholder
        fakePlaceholderLabel.textColor = UIColor.lightGray
        fakePlaceholderLabel.alpha = 1.0
        addSubview(fakePlaceholderLabel)
        
        rightPlaceholderLabel = UILabel(frame: placeholderRect(forBounds: bounds))
        rightPlaceholderLabel.font = font
        rightPlaceholderLabel.text = rightPlaceholder
        rightPlaceholderLabel.textColor = UIColor.lightGray
        rightPlaceholderLabel.alpha = 0.0
        addSubview(rightPlaceholderLabel)
    }
    
    // MARK: - UITextField Observing
    
    override open func willMove(toSuperview newSuperview: UIView!) {
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(KUITextField.didBeginEditing(_:)), name:NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(KUITextField.didEndEditing(_:)), name:NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    open func didBeginEditing(_ notification: Notification) {
        placeholder = nil
        
        if notification.object as AnyObject === self {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseIn, animations: { () -> Void in
                if self.text!.isEmpty {
                    self.fakePlaceholderLabel.transform = self.fakePlaceholderLabel.transform.translatedBy(x: self.translateX, y: 0.0)
                    self.fakePlaceholderLabel.alpha = 0.0
                    
                    self.rightPlaceholderLabel.transform = self.rightPlaceholderLabel.transform.translatedBy(x: self.translateX, y: 0.0)
                    self.rightPlaceholderLabel.alpha = 1.0
                }
                }, completion: nil)
            
        }
    }
    
    open func didEndEditing(_ notification: Notification) {
        if notification.object as AnyObject === self {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseIn, animations: { () -> Void in
                if self.text!.isEmpty {
                    self.fakePlaceholderLabel.transform = self.fakePlaceholderLabel.transform.translatedBy(x: -self.translateX, y: 0.0)
                    self.fakePlaceholderLabel.alpha = 1.0
                    
                    self.rightPlaceholderLabel.transform = self.rightPlaceholderLabel.transform.translatedBy(x: -self.translateX, y: 0.0)
                    self.rightPlaceholderLabel.alpha = 0.0
                }
                }, completion: nil)
        }
    }
    
}
