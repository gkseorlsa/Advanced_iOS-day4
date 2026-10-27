//
//  PhaseResponse.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

nonisolated struct PhaseResponse: Codable, Sendable {
    let phase: WeekPhase
    let week: Int
}
