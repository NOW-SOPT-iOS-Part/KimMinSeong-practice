//
//  UserService.swift
//  34th-Sopt-Seminar
//
//  Created by 김민성 on 4/27/24.
//

import Foundation

import Moya

final class UserService {
    static let shared = UserService()
    private var userProvider = MoyaProvider<UserTargetType>(plugins: [MoyaLoggingPlugin()])
    
    private init() {}
}

extension UserService {
    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, UserInfoResponseModel.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // 응답이 왔는지 안왔는지에 대한 분기 처리
    func signUp(request: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: request)) { result in
            switch result {
            case .success(let response): // the response came back successfully
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")
                
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data, SignUpResponseModel.self)
                completion(networkResult)
                
            case .failure: // the response didn't come back
                completion(.networkFail)
            }
        }
    }
    
    
    
    // 상태 코드에 따른 분기처리
    // judgeStatus: 서버통신 자체는 성공을 해도 응답 실패로 우리가 원하는 데이터를 받지 못한 상태일 때를 분기처리하기 위한 메소드
    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200..<205: // Successful responses
            return isValidData(data: data, T.self)
        case 400..<500: // Client error responses
            return .requestErr
        case 500: // Internal server error response
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    // 디코딩에 성공 여부에 따른 분기 처리
    // isValidData: 통신이 성공하고 원하는 데이터가 올바르게 들어왔을 때 데이터 처리를 위한 메소드
    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> { // 제네릭 타입 파라미터 부분 보면 Codable 채택해서 해독이 가능한 모델 구조체로 데이터를 변환해서 넣은 모습을 볼 수 있어!
        let decoder = JSONDecoder() // JSONDecoder 클래스의 decoder 객체를 만들고 guard 문에서 decode 메소드를 이용을 해서 JSON 형식으로 decode한다.
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️") // decoding에 실패하면 이런식으로 에러 메세지 출력과 리턴
            return .pathErr }
        
        return .success(decodedData as Any) // decoding에 성공하면 이런식으로 그 데이터를 리턴을 한다.
    }
}
