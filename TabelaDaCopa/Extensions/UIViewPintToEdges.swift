//
//  UIViewPintToEdges.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import Foundation
import UIKit

extension UIView {
    func pin(to superview: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
}
