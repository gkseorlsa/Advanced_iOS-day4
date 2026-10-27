//
//  UserApi.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/26/26.
//

import Alamofire
import UIKit

struct UserApi {
    static func register(
        nickname: String,
        password: String,
        age: Int,
        gender: String,
        mbti: String,
        job: String,
        hobby: String,
        image: UIImage,
        completion: @escaping (User) -> Void        // 생성 실패 시 서버 에러 (not optional)
    ) {
        AF.upload(
            multipartFormData: { formData in
                formData.append(Data(nickname.utf8), withName: "nickname")
                formData.append(Data(password.utf8), withName: "password")
                formData.append(Data("\(age)".utf8), withName: "age")
                formData.append(Data(gender.utf8), withName: "gender")
                formData.append(Data(mbti.utf8), withName: "mbti")
                formData.append(Data(job.utf8), withName: "job")
                formData.append(Data(hobby.utf8), withName: "hobby")
                
                // image.jpegData(compressionQuality: 0.8): UIImage를 JPEG로 변환, 80% 품질
                if let imageData = image.jpegData(compressionQuality: 0.8) {
                    formData.append(
                        imageData,
                        withName: "image",
                        fileName: "profile.jpg",
                        mimeType: "image/jpeg"      // 파일 형식 지정
                    )
                }
            },
            to: "\(ApiClient.baseURL)/api/users",
            method: .post
        )
//        .responseDecodable(of: User.self) { response in     // 응답 JSON을 User로 파싱
//            switch response.result {
//            case .success(let user):
//                completion(user)
//            case .failure(let error):
//                print(error)
//            }
//        }
        .response { response in
            print("HTTP 상태 코드: ", response.response?.statusCode as Any)
            print("응답 데이터: ", String(
                data: response.data ?? Data(),
                encoding: .utf8
            ) as Any)
            print("요청 오류: ", response.error as Any)
        }
    }
    
    static func login(
        nickname: String,
        password: String,
        completion: @escaping (User?) -> Void       // 옵셔널 타입: register와 달리, 로그인 실패 시 nil 반환.
    ) {
        AF.request(
            "\(ApiClient.baseURL)/api/users/login",
            method: .post,
            parameters: [
                "nickname": nickname,
                "password": password
            ],
//            encoding: URLEncoding.queryString       // ?nickname=...&password=...
            encoding: JSONEncoding.default
        )
        .responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let user):
                print("로그인 성공: ", user)
                completion(user)
                
            case .failure(let error):
                print("로그인 요청 실패: ", error)
                print("HTTP 상태 코드: ", response.response?.statusCode as Any)
                
                if let data = response.data {
                    print("서버 응답: ", String(data: data, encoding: .utf8) ?? "문자열 변환 실패")
                }
                completion(nil)
            }
        }
    }
    
    static func getById(
        id: Int,
        completion: @escaping (User?) -> Void
    ) {
        AF.request("\(ApiClient.baseURL)/api/users/\(id)")
            .responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                case .failure:
                    completion(nil)
                }
            }
    }
}
