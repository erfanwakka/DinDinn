//
//  CodeView.swift
//  DinDinn
//
//  Created by erfan on 9/28/1399 AP.
//

import Foundation


protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
