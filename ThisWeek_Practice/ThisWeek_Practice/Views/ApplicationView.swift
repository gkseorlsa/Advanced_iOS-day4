//
//  ApplicationView.swift
//  ThisWeek_Practice
//
//  Created by Admin on 10/22/26.
//

import SwiftUI

struct ApplicationView: View {
    @Environment(UserViewModel.self) var userVM
    @Environment(MatchViewModel.self) var matchVM
    
    @State private var selectedDay: MeetDay = .saturday
    @State private var selectedArea: Area = .gangnam
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Spacer()
            
            Text("""
                월요일은
                소개팅 신청하는 날!
                """)
            .font(.custom("NotoSerifKR-Regular", size: 30))
            
            Spacer()
            
            // 요일 선택
            VStack(alignment: .leading, spacing: 8) {
                Text("만남 요일")
                    .font(.subheadline)
                HStack(spacing: 12) {
                    ForEach(MeetDay.allCases, id: \.self) { day in
                        selectButton(
                            title: day.label,
                            isSelected: selectedDay == day
                        ) {
                            selectedDay = day
                        }
                    }
                }
            }
            
            // 지역 선택
            VStack(alignment: .leading, spacing: 8) {
                Text("만남 지역")
                    .font(.subheadline)
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 12) {
                    ForEach(Area.allCases, id: \.self) { area in
                        selectButton(
                            title: area.label,
                            isSelected: selectedArea == area
                        ) {
                            selectedArea = area
                        }
                    }
                }
            }
            
            // 신청 버튼
            Button {
                if let userId = userVM.currentUser?.id {
                    matchVM.apply(
                        userId: userId,
                        meetDay: selectedDay,
                        area: selectedArea
                    )
                }
            } label: {
                Text("신청하기")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Spacer()
        }
        .padding()
    }
    
    func selectButton(
        title: String,
        isSelected: Bool,
        action: @escaping () -> Void
    ) -> some View {
        Text(title)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isSelected ? Color.pink : Color.clear)
            .foregroundColor(isSelected ? .white : .primary)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.pink, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onTapGesture { action() }
    }
}

//#Preview {
//    ApplicationView()
//}
