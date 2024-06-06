//
//  LoginViewController_MVVMObservable.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 6/7/24.
//

import UIKit
import SnapKit

final class LoginViewController_MVVMObservable: UIViewController {

    private let rootView = LoginView()
    private let viewModel = LoginViewModel_Observable()

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        setTarget()
        bindViewModel()
    }

    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.backgroundSwitch.addTarget(self, action: #selector(backgroundChanged), for: .valueChanged)
    }

    private func bindViewModel() {
        viewModel.isValid.bind { [weak self] isValid in
            guard let isValid else { return }
            if isValid { self?.pushToWelcomeVC() }
        }

        viewModel.errMessage.bind { [weak self] err in
            guard let err else { return }
            self?.showToast(err)
        }
    }


    @objc private func loginButtonDidTap() {
        viewModel.checkValid(
            id: rootView.idTextField.text,
            password: rootView.passwordTextField.text
        )
    }

    @objc
    private func backgroundChanged(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 35/255, alpha: 1)
            rootView.titleLabel.textColor = .white
        } else {
            self.view.backgroundColor = .white
            rootView.titleLabel.textColor = .black
        }
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}
