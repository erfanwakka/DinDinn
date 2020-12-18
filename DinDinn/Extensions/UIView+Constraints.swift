//
//  UIView+Constraints.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import UIKit

extension UIView {
    func prepareForConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
//MARK: - Top Constraint -
extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    @discardableResult
    func pinTop(_ offset: CGFloat = 0.0, target: UIView? = nil) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        var constraint: NSLayoutConstraint?
        
        if let target = target {
            constraint = self.topAnchor.constraint(equalTo: target.bottomAnchor, constant: offset)
        } else {
            constraint = self.topAnchor.constraint(equalTo: superview.topAnchor, constant: offset)
        }
        
        constraint?.isActive = true
        return constraint
    }
    @discardableResult
    func pinSafeTop(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.topAnchor.constraint(equalTo: superview.safeTopAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
}
//MARK: - Left Constraint -
extension UIView {
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.leftAnchor
        }
    }
    @discardableResult
    func pinLeft(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func pinSafeLeft(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func pinfLeftInRelationTo(to anchor:NSLayoutXAxisAnchor, constant: CGFloat) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.leftAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return constraint
    }
}
//MARK: - Right Constraint -
extension UIView {
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.rightAnchor
        }
    }
    @discardableResult
    func pinRight(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func pinSafeRight(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func pinRightInRelation(to anchor: NSLayoutXAxisAnchor, constant: CGFloat) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.rightAnchor.constraint(equalTo: anchor, constant: -constant)
        constraint.isActive = true
        return constraint
    }
}

//MARK: - Bottom Constraint -
extension UIView {
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
    @discardableResult
    func pinBottom(_ offset: CGFloat = 0.0, target: UIView? = nil) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        
        guard let target = target else {
            let constraint = self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -offset)
            constraint.isActive = true
            return constraint
        }
        
        let constraint = self.bottomAnchor.constraint(equalTo: target.topAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func pinSafeBottom(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.bottomAnchor.constraint(equalTo: superview.safeBottomAnchor, constant: -offset)
        constraint.isActive = true
        return constraint
    }
}
//MARK: - Width Height Constraints -
extension UIView {
    @discardableResult
    func height(with size: CGFloat) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.heightAnchor.constraint(equalToConstant: size)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func width(with size: CGFloat) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.widthAnchor.constraint(equalToConstant: size)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func maxHeight(_ height: CGFloat) -> NSLayoutConstraint {
        self.prepareForConstraints()
        let constraint = self.heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func maxWidth(_ width: CGFloat) -> NSLayoutConstraint {
        self.prepareForConstraints()
        let constraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func minHeight(_ height: CGFloat) -> NSLayoutConstraint {
        self.prepareForConstraints()
        let constraint = self.heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func minWidth(_ width: CGFloat) -> NSLayoutConstraint {
        self.prepareForConstraints()
        let constraint = self.widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func constraintHeight(toAnchor: NSLayoutDimension, multiplier: CGFloat = 1) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.heightAnchor.constraint(equalTo: toAnchor, multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func constraintHeightLessThan(toAnchor: NSLayoutDimension, multiplier: CGFloat = 1) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.heightAnchor.constraint(lessThanOrEqualTo: toAnchor, multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func constraintWidth(toAnchor: NSLayoutDimension, multiplier: CGFloat = 1) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.widthAnchor.constraint(equalTo: toAnchor, multiplier: multiplier)
        constraint.isActive = true
        return constraint
    }
}
//MARK: - Other Constraints -
extension UIView {
    func pinEdgesToSuperview(_ offset: CGFloat = 0.0) {
        self.prepareForConstraints()
        self.pinTop(offset)
        self.pinBottom(offset)
        self.pinRight(offset)
        self.pinLeft(offset)
    }
    
    func pinEdgesHorizontallyToSuperview(_ offset: CGFloat = 0.0) {
        self.prepareForConstraints()
        self.pinRight(offset)
        self.pinLeft(offset)
    }
    
    func pinEdgesVerticallyToSuperview(_ offset: CGFloat = 0.0) {
        self.prepareForConstraints()
        self.pinTop(offset)
        self.pinBottom(offset)
    }
    @discardableResult
    func centerVertically(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        
        let constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func centerVertically(inRelationTo: UIView, _ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let superview = inRelationTo
        
        let constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func centerHorizontally(_ offset: CGFloat = 0.0) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        guard let superview = self.superview else {
            return nil
        }
        let constraint = self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset)
        constraint.isActive = true
        return constraint
        
    }
    @discardableResult
    func pinCenterVerticallyInRelation(to anchor:NSLayoutYAxisAnchor) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.centerYAnchor.constraint(equalTo: anchor)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func pinCenterHorizontallyInRelation(to anchor:NSLayoutXAxisAnchor) -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.centerXAnchor.constraint(equalTo: anchor)
        constraint.isActive = true
        return constraint
    }
    @discardableResult
    func squareViewConstraint() -> NSLayoutConstraint? {
        self.prepareForConstraints()
        let constraint = self.widthAnchor.constraint(equalTo: self.heightAnchor)
        constraint.isActive = true
        return constraint
    }
    func roundView(_ radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.height / 2.0
        self.clipsToBounds = true
    }
    func removeAllConstraints() {
        for subview in self.subviews {
            subview.removeAllConstraints()
        }
        self.removeConstraints(self.constraints)
    }
}
