# 🚆 Flutter Train Booking App

Flutter로 제작된 기차 예매 앱입니다.  
출발역/도착역 선택, 좌석 선택, 예매 기능을 직관적으로 구현한 프로젝트입니다.

---

## 📱 주요 기능

| 기능 | 설명 |
|------|------|
| 출발역/도착역 선택 | 기차역 목록에서 출발/도착지를 선택할 수 있습니다. |
| 선택 결과 반영 | 선택된 역 이름이 HomePage에 즉시 반영됩니다. |
| 좌석 선택 | ABCD열로 구성된 좌석을 탭하여 선택할 수 있습니다. |
| 좌석 상태 시각화 | 회색(미선택), 보라색(선택)으로 상태를 구분합니다. |
| 예매하기 기능 | 선택된 좌석 정보를 확인 후 예매를 진행할 수 있습니다. |
| 확인 Dialog | 예매 시 다이얼로그를 통해 확인하고 HomePage로 이동합니다. |

---

## 🎨 UI 디자인 명세

- **HomePage**
  - `Scaffold background`: `Colors.grey[200]`
  - 출발/도착역 선택 영역: 높이 200, 둥근 흰색 박스
  - `좌석 선택` 버튼: 보라색, 둥글게, 굵은 텍스트
  - 레이아웃: `세로 중앙 정렬`, `패딩: 20`

- **StationListPage**
  - 기차역 리스트를 `ListView`로 구성
  - 각 항목에 `Divider`로 구분선 표시

- **SeatPage**
  - 좌석: A–D 열 × 20행 구성
  - 각 좌석 너비/높이: 50
  - ABCD 라벨: 좌석 바로 위 정렬
  - 행 번호: 가운데 정렬
  - 좌석 터치 시 보라색으로 선택 상태 표현
  - 예매 버튼 터치 시 Dialog → 확인 → `뒤로가기 2번`

---

## 📂 디렉토리 구조

lib/
├── config/
│ └── theme.dart
├── pages/
│ ├── home/
│ │ └── home_page.dart
│ ├── seat/
│ │ └── seat_page.dart
│ └── station_list/
│ └── station_list_page.dart
├── widgets/
│ └── station_box.dart
└── main.dart

yaml
복사
편집

---

## 🛠 트러블 슈팅

### 1️⃣ ABCD 라벨 정렬이 어긋남

- **상황 인지**: 초기 버전에서 `ABCD 라벨`이 좌석과 맞지 않게 우측으로 밀려 있음  
- **고민**: 좌석 열과 라벨의 정렬 기준이 달라 생긴 문제로 판단  
- **적용**: `Row`의 정렬 기준, 여백, `Padding` 조정  
- **결과**: 라벨이 좌석과 정확히 정렬되어 사용자 혼동 최소화  
→ 📌 **레이아웃 정렬은 내부 Padding/Spacing 관리가 핵심임을 학습**

---

### 2️⃣ 좌석 선택 시 예매 버튼 반응 없음

- **상황 인지**: 좌석을 선택해도 예매 버튼에 아무 반응이 없음  
- **고민**: 조건문이 `null` 상태만 체크했는지, 리스트의 `isEmpty` 여부 확인 안 함  
- **적용**: `selectedSeats.isNotEmpty` 조건으로 버튼 작동 로직 추가  
- **결과**: 선택된 좌석 있을 때만 버튼 반응 → UX 향상  
→ 🧠 **정확한 조건 체크는 앱의 UX를 크게 개선할 수 있음을 학습**

---

## 💻 실행 방법

```bash
flutter pub get
flutter run
Android/iOS 시뮬레이터 및 실기기에서 모두 동작합니다.

📸 주요 화면 캡처

<img width="1179" height="2556" alt="simulator_screenshot_944D57B3-07AC-41A7-896D-1D104CB280FD" src="https://github.com/user-attachments/assets/41417375-64a4-421e-aded-dd8cb1372bce" />
<img width="1179" height="2556" alt="simulator_screenshot_B4F39EE6-BA01-471E-B982-12E27F5BE26B" src="https://github.com/user-attachments/assets/1741d794-8e41-41cb-8c60-033ff5e505fc" />
<img width="1179" height="2556" alt="simulator_screenshot_0DB31401-34E5-4B0E-9E41-ED7E54D40313" src="https://github.com/user-attachments/assets/8c9fd863-2e3a-43f9-86cd-7f136ca3d41c" />

📌 프로젝트 개요
이 앱은 Flutter를 사용하여 제작한 기차 예매 애플리케이션입니다.
사용자가 출발역과 도착역을 선택하고, 좌석을 직접 선택해 예매까지 완료할 수 있도록 직관적인 UI와 기능을 제공합니다.
Flutter의 상태 관리, 화면 간 데이터 전달, 위젯 트리 구성, 커스텀 위젯 설계 등을 실습하며 앱 구조화 및 컴포넌트화 능력을 키우는 데 중점을 두었습니다.

💡 기획 의도
기차 예매의 과정을 앱으로 직관적으로 구현
터치 기반 좌석 선택 기능 실습
Flutter 라우팅과 위젯 간 데이터 전달 경험
실제 앱처럼 동작하는 UI/UX 구성

⚙️ 기술 및 구현 포인트
기술 요소	설명
Navigator.pushNamed()	페이지 이동 및 매개변수 전달에 사용
StatefulWidget	좌석 선택 및 상태 변경 시 UI 갱신
ListView.builder()	좌석 리스트 동적 렌더링 (20개 행)
CupertinoAlertDialog	예매 확인 다이얼로그
Custom Widget (StationBox)	코드 재사용성과 유지보수성 향상

🎨 UI/UX 설계 포인트
역 선택 박스: 모서리 둥글고 그림자 없는 디자인, 유저가 바로 터치 가능하도록 구성
좌석 선택 UI: ABCD 좌석, 행 번호, 좌석 상태 박스로 실제 예매와 유사한 흐름 제공
예매 버튼 UX 개선: 좌석 선택 전에는 아무 반응 없도록 제한 → 사용성 명확하게 유도


🧠 학습 및 개선 포인트
**Flutter의 레이아웃 정렬 원리 (Row, Column, Spacer, Padding)**를 직접 조정하며 실전 감각 획득
상태 관리 (setState) 를 적절히 사용하여 UI ↔ 데이터 동기화 학습
조건부 렌더링 및 예외 처리 UX 구현 경험
깃허브 업로드 및 README 문서화 능력 강화


🧑‍💻 개발자 정보
이름: 김지아

GitHub: github.com/JiaKim3
