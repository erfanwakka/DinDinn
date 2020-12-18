//
//  UIView+Layout.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

public class ShadowLayer: UIView {
    
    fileprivate var shadowView: UIView?
    
    public func setProperties(shadowColor: UIColor,
                              shadowOffset: CGSize,
                              shadowOpacity: Float,
                              shadowRadius: CGFloat,
                              cornerRadius: CGFloat = 4) {
        
        backgroundColor = UIColor.clear
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shouldRasterize = true
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        clipsToBounds = cornerRadius > 4 ? true : false
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayout()
    }
    
    public func updateLayout() {
        guard let superview = superview else {
            return
        }
        
        guard let shadowView = shadowView else {
            return
        }
        
        guard shadowView.constraints.count > 0 else {
            return
        }
        
        superview.removeConstraints(constraints)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    
    public func addShadowFrame(shadowColor: UIColor = UIColor.black,
                               shadowOffset: CGSize = CGSize(width: 2, height: 2),
                               shadowOpacity: Float = 0.5,
                               shadowRadius: CGFloat = 4,
                               cornerRadius: CGFloat? = nil,
                               shadowFrame: CGRect? = nil) {
        
        for subview in superview?.subviews ?? [] {
            if let _: ShadowLayer = subview as? ShadowLayer {
                return
            }
        }
        
        let shadowLayer = ShadowLayer(frame: shadowFrame ??
            CGRect(x: self.frame.origin.x + 10,
                   y: self.frame.origin.y + 24,
                   width: self.frame.width - 20,
                   height: self.frame.height - 12))
        shadowLayer.setProperties(shadowColor: shadowColor,
                                  shadowOffset: shadowOffset,
                                  shadowOpacity: shadowOpacity,
                                  shadowRadius: self.layer.cornerRadius > 0 ? self.layer.cornerRadius/2 : shadowRadius,
                                  cornerRadius: cornerRadius ?? 0)
        
        superview?.addSubview(shadowLayer)
        superview?.bringSubviewToFront(self)
        
        shadowLayer.updateLayout()
    }
    
    public func removeShadowLayer() {
        for subview in superview?.subviews ?? [] {
            if let subview: ShadowLayer = subview as? ShadowLayer {
                subview.removeFromSuperview()
            }
        }
    }
}
