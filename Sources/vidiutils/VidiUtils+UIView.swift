//
//  VidiUtils+UIView.swift
//  vidiutils
//
//  Created by Boris Falcinelli  on 16/11/20.
//

import Foundation
import UIKit

extension UIView {
    
    /// Add a border with selected `width` and `color`.
    /// If the `animation` param is `true` the border is setted with 0.3 seconds animation.
    ///
    /// - Parameters:
    ///   - width: size of border
    ///   - color: color of border
    ///   - animate: animation for the border setting
    func border(width: CGFloat, color: UIColor, animate: Bool = true) {
        UIView.animate(withDuration: animate ? 0.3 : 0) {
            self.layer.borderWidth = width
            self.layer.borderColor = color.cgColor
        }
    }
}
