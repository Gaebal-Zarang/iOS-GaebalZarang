//
//  UITextField +.swift
//  iOS-Gaebalzarang
//
//  Created by juntaek.oh on 2022/08/08.
//

import UIKit

extension UITextField {

    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}