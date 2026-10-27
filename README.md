# Advanced_iOS (day4)

## 학습 내용

1. ViewModel 분리: UserVM (계정) / MatchVM (매칭)
2. 단일 책임 원칙: 각 ViewModel은 하나의 관심사만
3. enum + String rawValue: WeekPhase, MeetDay, Area
4. Codable + enum: 서버 문자열 ↔ 열거형 자동 변환
5. .environment 중첩: 여러 ViewModel 앱 전체 전달
6. switch 완전성 체크: default 없이 모든 케이스
7. DTO + JSONParameterEncoder: Encodable 구조체를 JSON body로
8. View가 ViewModel 조율: userVM의 id를 matchVM에 전달
9. ViewModel 내부 체이닝: onChange 대신 응집도 높은 패턴
10. AsyncImage: 서버 이미지 로딩
11. ProfileCard 리팩토링: 하드코딩 제거, User 주입
12. PATCH 메서드: 부분 업데이트 (만남 확인)

## Advancements

1. 신청하지 않았을 때 weekday 안내 다르게: `matchVM.application == nil`인 경우 "이번 주는 신청하지 않으셨어요"로 문구 변경
2. 매칭 실패 화면 이쁘게: 아이콘 + 두 줄 문구 + 이미지 등 추가
3. AppliedView에 실제 신청 정보 표시: 하드코딩 된 "토요일", "강남" 대신 `matchVM.application?.meetDay`, `.area`로 변경
4. 로딩 인디케이터 커스텀: `ProgressView()` 대신 앱 로고를 돌려주는 커스텀 로더 제작
