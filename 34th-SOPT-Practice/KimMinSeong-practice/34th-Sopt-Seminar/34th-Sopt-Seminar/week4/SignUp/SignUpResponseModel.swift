//
//  SignUpResponseModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/27/24.
//

import Foundation

// 서버에서 이런 형식으로 응답이 오고 이를 swift 언어로 바꿔주기 위해서 Codable이라는 프로토콜 사용
struct SignUpResponseModel: Codable {
    let code: Int
    let message: String
}
