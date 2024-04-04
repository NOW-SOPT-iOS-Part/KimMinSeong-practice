//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 2024/03/30.
//

import Foundation
import UIKit
// 아래의 코드를 처음 실행하면 아무것도 뜨지 않는데 그 이유는 컴포넌트를 구성해 놨지만 어디에 띄울지에 대해서는 결정하지 않았기 때문

class LoginViewController: UIViewController {
    
    // UILabel 구현하기
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    
    }()
    
    // UITextField 구현하기
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "이메일을 입력해주세요."
        textField.font = UIFont(name: "Pretendard-SemiBold.otf", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1) // alpha값은 선명도
        textField.clearButtonMode = .whileEditing // clear button 추가
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요."
        textField.font = UIFont(name: "Pretendard-SemiBold.otf", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1) // alpha값은 선명도
        return textField
    }()
    
    // UIButton 구현하기
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold.otf", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 10 // 로그인 버튼에 곡률 추가
        return button
    }()
    
    private lazy var hiddenSwitch: UISwitch = {
        let mySwitch = UISwitch(frame: CGRect(x: 90, y: 600, width: 20, height: 20))
        mySwitch.onTintColor = .green
        mySwitch.thumbTintColor = .gray
        return mySwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        [titleLabel, idTextField, passwordTextField, loginButton, hiddenSwitch].forEach {
            self.view.addSubview($0)
        }
    }
    
    @objc func loginButtonDidTap() {
       presentToWelcomeVC()
//        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
//        welcomeViewController.modalTransitionStyle = .flipHorizontal
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = idTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        self.navigationController?
            .pushViewController(welcomeViewController, animated: true)
    }
}
