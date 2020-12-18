//
//  UIView+Layer.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

extension UIView {
    
    // MARK: - Associations
    
    private static let borderColorAssociation = ObjectAssociation<NSObject>()
    private static let borderWidthAssociation = ObjectAssociation<NSObject>()
    private static let cornerRadiusAssociation = ObjectAssociation<NSObject>()
    
    // MARK: - Inspectables
    
    @IBInspectable
    public var borderColor: UIColor {
        get {
            return UIView.borderColorAssociation[self] as? UIColor ?? .clear
        }
        set (borderColor) {
            UIView.borderColorAssociation[self] = borderColor as NSObject
            
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return UIView.borderWidthAssociation[self] as? CGFloat ?? 0
        }
        set (borderWidth) {
            UIView.borderWidthAssociation[self] = borderWidth as NSObject
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return UIView.cornerRadiusAssociation[self] as? CGFloat ?? 0
        }
        set (cornerRadius) {
            UIView.cornerRadiusAssociation[self] = cornerRadius as NSObject
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
}
extension UIView {
    func setCornerRadius(forCorners corners: UIRectCorner, withRadius radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
