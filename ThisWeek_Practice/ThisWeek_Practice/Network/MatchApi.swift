//
//  MatchApi.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

import Alamofire

struct MatchApi {
    static func getByUserAndWeek(
        userId: Int,
        week: Int,
        completion: @escaping (MatchResult?) -> Void
    ) {
        AF.request(
            "\(ApiClient.baseURL)/api/match",
            parameters: ["userId": userId, "week": week]
        )
        .responseDecodable(of: MatchResult.self) { response in
            switch response.result {
            case .success(let match):
                completion(match)
            case .failure:
                completion(nil)
            }
        }
    }
}
