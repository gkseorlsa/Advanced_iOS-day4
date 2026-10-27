//
//  MatchedView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

struct MatchedView: View {
    @Environment(UserViewModel.self) var userVM
    @Environment(MatchViewModel.self) var matchVM
    @State private var isBlurred = true
    
    var body: some View {
        Group {
            // 상대 유저가 있으면 ProfileCard, 없으면 로딩 표시
            if let user = matchVM.matchedUser {
                ScrollView {
                    VStack {
                        Spacer().frame(height: 40)
                        ProfileCard(user: user, isBlurred: $isBlurred)
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        // fetchMatch를 호출함으로써 ViewModel 안에서 상대 유저까지 자동 조회
        .onAppear {
            guard let userId = userVM.currentUser?.id else { return }
            matchVM.fetchMatch(userId: userId)
        }
    }
}

#Preview {
    MatchedView()
}
