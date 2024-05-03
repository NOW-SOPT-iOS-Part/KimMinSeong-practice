//
//  SignUpRequestModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/27/24.
//

import Foundation

// MARK: 요청 모델 만들기
// 이 모델이 데이터 모델이고 이 모델을 encode해서 JSON 형식으로 서버에 넘겨줘야함. -> Codable 프로토콜의 존재이유
struct SignUpRequestModel: Codable {
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}
