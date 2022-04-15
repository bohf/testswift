//
//  LoginViewController.swift
//  studySwift
//
//  Created by fangbo on 2021/11/3.
//

import UIKit

class LoginViewController: UIViewController {
    var isBool = false //user是否点击登录button
    // 记录滑动Y点的值
    var signUpViewOriginY: CGFloat!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var singInButton: UIButton!
    private lazy var signInView: UserSignInView = {
        let signV = UserSignInView.loadFromNib("View")
        signV.frame = CGRect(x: 0, y: kScreenH, width: kScreenW, height: kScreenH)
        let panView = UIPanGestureRecognizer.init(target: self, action: #selector(pan(panGuesture:)))
        signV.addGestureRecognizer(panView)
        return signV
    }()
    private lazy var grayView: UIView = {
        let gray = UIView.init(frame: self.view.bounds)
        gray.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.5)
        gray.alpha = 0
        return gray
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @IBAction func test(_ sender: Any) {
        isBool = true
        dismiss(animated: true, completion: nil)
    }
    
    func setUI() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.backgroundColor = UIColor(r: 223, g: 0, b: 23)
        singInButton.addTarget(self, action: #selector(singInClick), for: .touchUpInside)
        //加载注册页面
        signUpViewOriginY = getStatusBarH()
        view.addSubview(grayView)
        view.addSubview(signInView)
    }
    
    @objc func singInClick() {
        viewAnimation(view: signInView, backView: grayView, backViewAlpha: 1, time: 0.5, y: getStatusBarH()/2)
        self.perform(#selector(downMove), with: nil, afterDelay: 0.5)
    }
    
    @objc func downMove() {
        viewAnimation(view: signInView, backView: grayView, backViewAlpha: 1, time: 0.2, y: getStatusBarH())
    }
    
    @objc func pan(panGuesture: UIPanGestureRecognizer) {
        if panGuesture.state == .began {
            print("开始拖动")
        } else if panGuesture.state == .changed {
            let y = panGuesture.translation(in: self.view).y
            if y <= getStatusBarH() {
                signInView.frame = CGRect(x: 0, y: getStatusBarH(), width: kScreenW, height: kScreenH)
            } else {
                
                signInView.frame = CGRect(x: 0, y: signUpViewOriginY+y, width: kScreenW, height: kScreenH)
            }
            var scrolAlph = self.signInView.frame.origin.y/kScreenH/2
            if scrolAlph > 0.5 {
                scrolAlph = 0.5
            }
            self.grayView.alpha = 1-scrolAlph
        } else if panGuesture.state == .ended {
            if self.signInView.frame.origin.y <= kScreenH/2 {
                viewAnimation(view: signInView, backView: grayView, backViewAlpha: 1, time: 0.2, y: signUpViewOriginY)
            } else {
                viewAnimation(view: signInView, backView: grayView, backViewAlpha: 0, time: 0.2, y: kScreenH)
            }
            
        }
    }
}
