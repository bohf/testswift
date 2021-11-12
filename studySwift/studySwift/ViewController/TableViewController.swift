//
//  TableViewController.swift
//  studySwift
//
//  Created by fangbo on 2021/11/1.
//

import UIKit

@available(iOS 15.0, *)
class TableViewController: UITabBarController {
    var indexFlag = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        addControllers()
        // Do any additional setup after loading the view.
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance;

    }
    
    private func addControllers() {
        addChildControllers(HomeViewController(), title: "首页", image: "pura", selectImg: "prua_select")
        addChildControllers(ProductViewController(), title: "商品", image: "oran", selectImg: "oran_select")
        addChildControllers(NewsViewController(), title: "消息", image: "bruce", selectImg: "bruce_select")
        addChildControllers(ShoppingViewController(), title: "购物车", image: "walt", selectImg: "walt_select")
        addChildControllers(MyAccountViewController(), title: "我的", image: "gren", selectImg: "gren_select")
    }

    private func addChildControllers(_ childVC: UIViewController, title: String, image: String, selectImg: String) {
        childVC.tabBarItem.title = title
        childVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)], for: .normal)
        childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImg)?.withRenderingMode(.alwaysOriginal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(r: 245, g: 90, b: 93)], for: .selected)
        let nav = UINavigationController(rootViewController: childVC)
        //self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance;
        nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        
        addChild(nav)
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            if indexFlag != index {
                animationWithIndex(index: index)
            }
        }
    }
    
    private func animationWithIndex(index: Int) {
        var arrViews = [UIView]()
        for tabBarButton in tabBar.subviews {
            if tabBarButton.isKind(of: NSClassFromString("UITabBarButton")!) {
                arrViews.append(tabBarButton)
            }
        }
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulse.duration = 0.1
        pulse.repeatCount = 1
        pulse.autoreverses = true
        pulse.fromValue = NSNumber(value: 0.7)
        pulse.toValue = NSNumber(value: 1.1)
        arrViews[index].layer.add(pulse, forKey: nil)
        indexFlag = index
    }
}
