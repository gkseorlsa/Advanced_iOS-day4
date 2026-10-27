//
//  MatchView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

struct MatchView: View {
    @Environment(MatchViewModel.self) var matchVM
    @Environment(UserViewModel.self) var userVM
    
    var body: some View {
        if let phase = matchVM.currentPhase {
            switch phase.phase {
            case .monday:
                Group {
                    if matchVM.application != nil {
                        AppliedView()
                    } else {
                        ApplicationView()
                    }
                }
                .onAppear {
                    if let userId = userVM.currentUser?.id {
                        matchVM.fetchApplication(userId: userId)
                    }
                }
                
            case .weekday:
                Group {
                    if matchVM.matchResult == nil {
                        VStack {
                            Image(systemName: "heart.slash")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                            
                            Text("이번 주는 매칭되지 않았어요.")
                                .font(.title2)
                        }
                    } else {
                        MatchedView()
                    }
                }
                .onAppear {
                    if let userId = userVM.currentUser?.id {
                        matchVM.fetchMatch(userId: userId)
                    }
                }
            }
        } else {
            ProgressView()
        }
    }
}

#Preview {
    MatchView()
}
