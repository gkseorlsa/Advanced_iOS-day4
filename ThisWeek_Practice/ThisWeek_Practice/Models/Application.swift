//
//  Application.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

nonisolated struct Application: Codable, Sendable {
    let id: Int?
    let userId: Int
    let weekNumber: Int
    let meetDay: String
    let area: String
}

