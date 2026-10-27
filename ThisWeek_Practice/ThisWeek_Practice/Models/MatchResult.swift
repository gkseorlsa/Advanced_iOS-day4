//
//  MatchResult.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

import SwiftUI

nonisolated struct MatchResult: Codable, Equatable, Sendable {
    let id: Int
    let user1Id: Int
    let user2Id: Int
    let weekNumber: Int
    let meetDay: String
    let area: String
    let user1Met: Bool
    let user2Met: Bool
}

