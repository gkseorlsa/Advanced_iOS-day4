//
//  AppliedView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/27/26.
//

import SwiftUI

struct AppliedView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "checkmark.ciecle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.pink)
            
            Text("신청 완료!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("매칭이 완료되면 알려드릴게요")
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer()
            // 신청 정보 카드
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.pink)
                    Text("토요일")
                }
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.pink)
                    Text("강남")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    AppliedView()
}
