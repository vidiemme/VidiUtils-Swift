//
//  VidiUtils+Autolayout.swift
//  vidiutils
//
//  Created by Pasquale Ambrosini on 19/09/2018.
//

import Foundation
import UIKit

public extension UIView {
    
    internal func constraintWithAttribute(_ attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        return self.superview?.constraints.filter({ $0.firstAttribute == attribute && $0.firstItem != nil && $0.firstItem! as! NSObject == self }).first
    }
    
    internal func myConstraintWithAttribute(_ attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        return self.constraints.filter({ $0.firstAttribute == attribute && $0.firstItem != nil && $0.firstItem! as! NSObject == self }).first
    }
	
    var topConstraint: NSLayoutConstraint? {
        return self.constraintWithAttribute(.top)
    }
    
    var bottomConstraint: NSLayoutConstraint? {
        return self.constraintWithAttribute(.bottom)
    }
    
    var leadingConstraint: NSLayoutConstraint? {
        return self.constraintWithAttribute(.leading)
    }
    
    var trailingConstraint: NSLayoutConstraint? {
        return self.constraintWithAttribute(.trailing)
    }
    
    var widthConstraint: NSLayoutConstraint? {
        return self.myConstraintWithAttribute(.width)
    }
    
    var heightConstraint: NSLayoutConstraint? {
        return self.myConstraintWithAttribute(.height)
    }
    
    func attachOnTop(explicitHeight: CGFloat? = nil, topSpacing: CGFloat, topView: UIView? = nil, widthMultiplier: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        var margins: UILayoutGuide!
        let superview = topView ?? self.superview!
        if #available(iOS 11.0, *) {
            margins = superview.safeAreaLayoutGuide
        } else {
            margins = superview.layoutMarginsGuide
        }
        
        let attachOnBottom = topView != nil
        if let widthMultiplier = widthMultiplier {
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: widthMultiplier).isActive = true
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        } else {
            self.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
            self.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        }
        self.topAnchor.constraint(equalTo: attachOnBottom ? margins.bottomAnchor : margins.topAnchor, constant: topSpacing).isActive = true
        
        if let explicitHeight = explicitHeight {
            self.heightAnchor.constraint(equalToConstant: explicitHeight).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        }
    }
    
    func centerInSuperview() {
        guard let superview = self.superview else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    var updatedMargins: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide
        } else {
            return self.layoutMarginsGuide
        }
    }
	
    func fillSuperview() {
        var margins: UILayoutGuide!
        let superview = self.superview!
        if #available(iOS 11.0, *) {
            margins = superview.safeAreaLayoutGuide
        } else {
            margins = superview.layoutMarginsGuide
        }
        
        self.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
}
