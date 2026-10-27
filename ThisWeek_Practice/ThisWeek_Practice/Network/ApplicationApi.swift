//
//  ApplicationApi.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

import Alamofire

struct ApplicationApi {
    static func getByUserAndWeek(
        userId: Int,
        week: Int,
        completion: @escaping (Application?) -> Void
    ) {
        AF.request(
            "\(ApiClient.baseURL)/api/applications",
            parameters: ["userId": userId, "week": week]
        )
        .responseDecodable(of: Application.self) { response in
            switch response.result {
            case .success(let app):
                completion(app)
            case .failure:
                completion(nil)
            }
        }
    }
    
    // Create DTO
    static func create(
        application: Application,
        completion: @escaping (Application?) -> Void
    ) {
        AF.request(
            "\(ApiClient.baseURL)/api/applications",
            method: .post,
            parameters: application,
            encoder: JSONParameterEncoder.default
        )
        .responseDecodable(of: Application.self) { response in
            switch response.result {
            case .success(let app):
                completion(app)
            case .failure:
                completion(nil)
            }
        }
    }
}
