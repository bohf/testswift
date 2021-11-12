//
//  File.swift
//  studySwift
//
//  Created by fangbo on 2021/11/12.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
}
