//
//  User.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

nonisolated struct User: Codable, Sendable {
    let id: Int
    var nickname: String
    var age: Int
    var gender: Gender
    var mbti: String
    var job: String
    var hobby: String
    var imagePath: String?
    var point: Int? = 0
}

enum Gender: String, CaseIterable, Codable, Sendable {
    case male = "MALE"
    case female = "FEMALE"
    
    var label: String {
        switch self {
        case .male: return "남자"
        case .female: return "여자"
        }
    }
}
