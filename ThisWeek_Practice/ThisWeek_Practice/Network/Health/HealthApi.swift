//
//  HealthApi.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/26/26.
//

import Alamofire

// Alamofire가 /api/health에 GET 요청을 보낸다.
// HTTP 응답이 정상인지 확인한다.
// 응답 JSON을 HealthResponse로 변환한다.
// 성공하면 Result.success, 실패하면 Result.failure를 호출한 쪽에 결과 전달한다.

struct HealthApi {
    static func checkServer(
        completion: @escaping (Result<HealthResponse, Error>) -> Void
    ) {
        AF.request("\(ApiClient.baseURL)/api/health")
            .validate()
            .responseDecodable(of: HealthResponse.self) { response in
                switch response.result {
                case .success(let result):
                    completion(.success(result))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
