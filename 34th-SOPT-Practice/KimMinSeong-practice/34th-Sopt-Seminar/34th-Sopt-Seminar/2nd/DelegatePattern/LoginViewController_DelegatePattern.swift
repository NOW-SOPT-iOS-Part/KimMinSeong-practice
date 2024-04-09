//
//  LoginViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

final class LoginViewController_DelegatePattern: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
//        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
//        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
//        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.delegate = self
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
        
//        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 161),
//                                     titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 69),
//                                     titleLabel.widthAnchor.constraint(equalToConstant: 236),
//                                     titleLabel.heightAnchor.constraint(equalToConstant: 44)])
//
//        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 276),
//                                     idTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//                                     idTextField.widthAnchor.constraint(equalToConstant: 335),
//                                     idTextField.heightAnchor.constraint(equalToConstant: 52)])
//
//        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
//                                     passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//                                     passwordTextField.widthAnchor.constraint(equalToConstant: 335),
//                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
//
//        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
//                                     loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//                                     loginButton.widthAnchor.constraint(equalToConstant: 335),
//                                     loginButton.heightAnchor.constraint(equalToConstant: 52)])

        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(161)
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().offset(-70) // inset(70)으로도 같음
//            make.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(276)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }
        
    }
}

extension LoginViewController_DelegatePattern: DataBindProtocol {
    func dataBind(id: String) {
        idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
    }
}
