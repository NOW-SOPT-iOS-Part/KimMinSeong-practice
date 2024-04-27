//
//  AddTargetType.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/27/24.
//

import Foundation

import Moya


enum UserTargetType {
    case getUserInfo(memberId: String)
    case signUp(request: SignUpRequestModel)
}

extension UserTargetType: TargetType {
    // Base URL 이 저장되는 부분
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
            // signUp 이던 getUserInfo던 경로가 같기 때문에 똑같이 설정
        case .signUp:
            return "/member/join"
        case .getUserInfo(memberId: let memberId):
            return "/member/info"
        }
    }
    
    // http method를 적는 부분으로 명세서에 따라서 post냐 get이냐가 달라짐.
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        case .getUserInfo:
            return .get
        }
    }
    
    // 어떻게 서버와 통신할 것인지를 정해주는 부분
    var task: Moya.Task {
        switch self {
        case .signUp(let request): // signUp에 대한 request
            return .requestJSONEncodable(request) // request body에는 Encodable한 body가 있을 것 이기 때문에 requestJSONEncodable로 해준 것임.
        case .getUserInfo: // getUserInfo에 대한 request -> 이 경우 body 내용이 필요가 없는게 정보를 받아오는 것이기 때문에 그럼
            return .requestPlain // 그래서 Plain으로 보낸다는 의미에서 .requestPlain을 return함.
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case.signUp:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId] // UserInfo를 request하려면 Id값이 필요하니까(postman에서 했던 거 생각하면) memberId 값도 return 해서 요청서에 보내주는 것임.
        }
        
    }
}

