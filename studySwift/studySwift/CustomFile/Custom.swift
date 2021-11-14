//
//  File.swift
//  studySwift
//
//  Created by fangbo on 2021/11/12.
//

import UIKit
import CommonCrypto

//屏幕宽高
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

//状态栏高度
func getStatusBarH() -> CGFloat {
    if #available(iOS 13.0, *) {
        let statusBarHeight = UIApplication.shared.windows.first?.windowScene?.statusBarManager
        return statusBarHeight?.statusBarFrame.height ?? 44
    } else {
        return UIApplication.shared.statusBarFrame.height
    }
}

func viewAnimation(view: UIView, backView: UIView, backViewAlpha: CGFloat, time: TimeInterval, y: CGFloat) {
    UIView.animate(withDuration: time) {
        view.frame = CGRect(x: 0, y: y, width: kScreenW, height: kScreenH)
        backView.alpha = backViewAlpha
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
}
extension String {
    var sha256: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02x", $1) }
    }
}
