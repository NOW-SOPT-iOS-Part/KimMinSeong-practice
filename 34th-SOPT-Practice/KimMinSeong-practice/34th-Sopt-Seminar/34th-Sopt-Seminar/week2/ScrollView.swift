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
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var redView: UIView = {
        let myRedView = UIView()
        myRedView.backgroundColor = .red
        return myRedView
    }()
    
    private var orangeView: UIView = {
        let myOrangeView = UIView()
        myOrangeView.backgroundColor = .orange
        return myOrangeView
    }()
    
    private var yellowView: UIView = {
        let myYellowView = UIView()
        myYellowView.backgroundColor = .yellow
        return myYellowView
    }()
    
    private var greenView: UIView = {
        let myGreenView = UIView()
        myGreenView.backgroundColor = .green
        return myGreenView
    }()
    
    private var blueView: UIView = {
        let myBlueView = UIView()
        myBlueView.backgroundColor = .blue
        return myBlueView
    }()
    
    private var purpleView: UIView = {
        let myPurpleView = UIView()
        myPurpleView.backgroundColor = .purple
        return myPurpleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        setLayout()
        
    }
    
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low) // contentView의 height가 scrollView의 height보다 크거나 같도록 설정합니다. 우선순위는 낮습니다.
        }
        
        redView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalTo(contentView)
            $0.leading.equalToSuperview().offset(187)
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalToSuperview().offset(187)
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
            $0.bottom.equalTo(contentView)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalToSuperview().offset(188)
            $0.height.equalTo(337)
            $0.width.equalTo(187.5)
            $0.bottom.equalTo(contentView)
        }
    }
    
    
    

}
