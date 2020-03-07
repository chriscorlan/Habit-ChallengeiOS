//
//  Extensions.swift
//  Habit Challenge
//
//  Created by Chad Wiedemann on 11/23/17.
//  Copyright © 2017 Chad Wiedemann LLC. All rights reserved.
//

import UIKit

extension UIViewController{
    //hides the keyboard when user presses on the main view
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //dismisses keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIPickerView{
    //hides the keyboard when user presses on the main view
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    //dismisses keyboard
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

@IBDesignable class BorderView : UITextView {
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}

