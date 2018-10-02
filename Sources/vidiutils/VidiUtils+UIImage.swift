//
//  VidiUtils+UIImage.swift
//  vidiutils
//
//  Created by Pasquale Ambrosini on 19/09/2018.
//

import Foundation
import UIKit

extension UIView {
    
    func takeScreenshot() -> UIImage? {
        if #available(iOS 11.0, *) {
            var bounds = self.bounds
            bounds.origin = .zero
            UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
            UIColor.white.setFill()
            UIRectFill(bounds)
            drawHierarchy(in: bounds, afterScreenUpdates: true)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        } else {
            let bounds = self.bounds
            let format = UIGraphicsImageRendererFormat()
            format.opaque = true
            let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        }
    }
}

extension UIImageView {
    
    func adaptBackgroundColor() {
        guard let image = self.image else { return }
        let pixel = pixelColor(image, CGPoint(x: image.size.width-1, y: image.size.height-1))
        self.backgroundColor = pixel ?? .clear
    }
    
    func pixelColor(_ image: UIImage, _ point: CGPoint) -> UIColor? {
        guard let cgImage = image.cgImage, let pixelData = image.cgImage?.dataProvider?.data else { return nil }
        
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let bytesPerPixel = cgImage.bitsPerPixel / 8
        
        let pixelInfo: Int = ((cgImage.bytesPerRow * Int(point.y)) + (Int(point.x) * bytesPerPixel))
        
        let b = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let r = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIImage {
    static func mergeImages(top: UIImage, bottom: UIImage) -> UIImage? {
        let size = CGSize(width: top.size.width, height: top.size.height + bottom.size.height)
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        top.draw(in: CGRect(origin: .zero, size: top.size))
        bottom.draw(in: CGRect(origin: CGPoint(x: 0, y: top.size.height), size: bottom.size))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
    
    static func addBorder(to image: UIImage, border: CGFloat) -> UIImage! {
        var size = image.size
        size.width += border*2
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        UIColor.white.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        image.draw(in: CGRect(origin: CGPoint(x: border, y: 0), size: image.size))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}
