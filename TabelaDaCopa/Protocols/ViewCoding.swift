//
//  ViewCoding.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 27/09/22.
//

import Foundation

public protocol ViewCoding {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCoding {
    public func buildLayout() {
        self.setupView()
        self.setupHierarchy()
        self.setupConstraints()
    }
}
