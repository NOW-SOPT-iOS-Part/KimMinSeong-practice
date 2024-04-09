//
//  ScrollView.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/6/24.
//

import Foundation
import UIKit
import SnapKit

private let scrollView = UIScrollView()
private var contentView = UIView()

class ScrollView: UIViewController {
    private var redView: UIView = {
        let myRedView = UIView()
        myRedView.backgroundColor = .red
        return myRedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [redView].forEach {
            self.view.addSubview($0)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(44)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
        }
    }
    
    
    

}
