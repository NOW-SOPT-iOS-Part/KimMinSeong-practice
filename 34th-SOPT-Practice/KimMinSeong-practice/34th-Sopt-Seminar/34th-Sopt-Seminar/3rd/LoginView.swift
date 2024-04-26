//
//  LoginView.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/26/24.
//

import Foundation
import UIKit

final class LoginView: UIView {
    
    override init(frame: CGRect) { // UIView를 상속받은 Custom Class를 코드로 구현할 때 사용하는 생성자.
        super.init(frame: frame)
        
        setLayout()
    }
    
    // 이 코드가 없다면 required init? 메소드는 런타임 시에 호출이 된다. 런타임에 호출이 된다? -> 실제 사용자가 사용하다가 앱이 꺼질 수도 있다는 의미
    // 이렇게 비가용성 정의를 함으로써 컴파일 타임에 에러를 발생시켜서 개발자가 미리 체크할 수 있도록 한다.
    @available(*, unavailable)
    // UIView랑 UIViewController는 NSCoding 프로토콜을 채택하고 있는데 NSCoding에 명시된 init함수가 init(coder: _) 이기 때문이다.
    // 생성자 재정의를 해줘야 한다는 것을 알려주기 위해서 required 키워드를 사용.
    required init?(coder: NSCoder) {
        fatalError("SecondView Error")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(161)
            make.width.equalTo(236)
            make.height.equalTo(44)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(71)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.left.right.equalTo(idTextField)
            make.height.equalTo(58)
        }
    }
}

final class LoginViewController_CustomView: UIViewController {
    
    private let rootView = LoginView()
    
    override func loadView() { // 컨트롤러가 관리하는 뷰를 만든다. 
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setTarget()
    }
    
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_SnapKit()
        welcomeViewController.delegate = self
        welcomeViewController.setLabelText(id: rootView.idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    
}

extension LoginViewController_CustomView: DataBindProtocol {
    func dataBind(id: String) {
        rootView.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
    }
}

