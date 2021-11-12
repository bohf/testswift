//
//  LoginViewController.swift
//  studySwift
//
//  Created by fangbo on 2021/11/3.
//

import UIKit

class LoginViewController: UIViewController {
    var isBool = false
    @IBOutlet weak var loginButton: UIButton!
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
    }
}
