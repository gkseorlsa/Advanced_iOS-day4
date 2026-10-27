//
//  MeetDay.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

enum MeetDay: String, CaseIterable {
    case saturday = "SATURDAY"
    case sunday = "SUNDAY"
    
    var label: String {
        switch self {
        case .saturday: return "토요일"
        case .sunday: return "일요일"
        }
    }
}
