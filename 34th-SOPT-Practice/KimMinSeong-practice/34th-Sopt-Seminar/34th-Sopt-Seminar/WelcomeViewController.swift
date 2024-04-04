//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 2024/03/30.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        [logoImage, WelcomeLabel, mainButton, reLoginButton].forEach {
            self.view.addSubview($0)
        }
        bindID()
    }
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 122, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let WelcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold.otf", size: 18)
            return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold.otf", size: 18)
//        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 10 // 메인으로 돌아가기 버튼에 곡률 추가
            return button
    }()
    
    private lazy var reLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold.otf", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 10 // 다시 로그인하기 버튼에 곡률 추가
        return button
    }()
    
    @objc func backToLoginButtonDidTap() {
        // modal로 넘어갔을 때와 push방식으로 넘어갔을 때 돌아오는 방법이 다르다.
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func bindID() {
//        guard let idText = id else { return }
        if let idText = id {
            self.WelcomeLabel.text = "\(idText)님 \n반가워요"
        } else {
            print("id값이 없습니다.")
        }
        
    }
    
}
