//
//  PhaseApi.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

import Alamofire

struct PhaseApi {
    static func get(completion: @escaping (PhaseResponse?) -> Void) {
        AF.request("\(ApiClient.baseURL)/api/phase")
            .responseDecodable(of: PhaseResponse.self) { response in
                switch response.result {
                case .success(let phase):
                    completion(phase)
                case .failure:
                    completion(nil)
                }
            }
    }
}

