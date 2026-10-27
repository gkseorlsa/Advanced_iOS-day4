//
//  HealthTestView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/26/26.
//

import SwiftUI

struct HealthTestView: View {
    @State private var resultMessage = "아직 서버를 호출하지 않았어요."
    
    var body: some View {
        VStack(spacing: 20) {
            Text(resultMessage)
                .multilineTextAlignment(.center)
            
            Button("서버 연결 테스트") {
                HealthApi.checkServer { result in
                    switch result {
                    case .success(let response):
                        resultMessage = "\(response.status): \(response.message)"
                    case .failure(let error):
                        resultMessage = "요청 실패: \(error.localizedDescription)"
                    }
                }
            }
        }
    }
}

#Preview {
    HealthTestView()
}
