//
//  MatchViewModel.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

import SwiftUI

@Observable
class MatchViewModel {
    var application: Application? = nil
    var currentPhase: PhaseResponse? = nil
    
    var matchResult: MatchResult? = nil
    var matchedUser: User? = nil
    
    func fetchPhase() {
        PhaseApi.get { phase in
            self.currentPhase = phase
        }
    }
    
    func fetchApplication(userId: Int) {
        guard let week = currentPhase?.week else { return }
        ApplicationApi.getByUserAndWeek(userId: userId, week: week) { app in
            self.application = app
        }
    }
    
    func apply(userId: Int, meetDay: MeetDay, area: Area) {
        guard let week = currentPhase?.week else { return }
        let newApp = Application(
            id: nil,
            userId: userId,
            weekNumber: week,
            meetDay: meetDay.rawValue,
            area: area.rawValue
        )
        
        ApplicationApi.create(application: newApp) { app in
            self.application = app
        }
    }
    
    // 매칭 결과가 오면 ViewModel 안에서 바로 상대 유저 조회
    func fetchMatch(userId: Int) {
        guard let week = currentPhase?.week else { return }
        MatchApi.getByUserAndWeek(userId: userId, week: week) { match in
            self.matchResult = match
            if match != nil {
                self.fetchMatchedUser(currentUserId: userId)
            }
        }
    }
    
    func fetchMatchedUser(currentUserId: Int) {
        guard let match = matchResult else { return }
        let otherId = match.user1Id == currentUserId ? match.user2Id : match.user1Id
        
        UserApi.getById(id: otherId) { user in
            self.matchedUser = user
        }
    }
}
