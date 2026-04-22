
# ✈️ 프로젝트 이름 : 여기좋아

## 📝 프로젝트 소개
이 프로젝트는 사용자가 국내 여행 정보를 편리하게 확인할 수 있도록 돕는 서비스입니다.

## 🚀 주요 기능
- **로그인/회원가입**: JWT 기반의 인증 로직을 통해 사용자별 시스템 이용 권한을 분리하였습니다.
- **상품 조회 및 검색**: 숙소, 항공, 렌터카, 패키지 정보를 카테고리별로 제공하며,
  사용자가 원하는 상품을 손쉽게 찾을 수 있도록 검색 기능을 구현하였습니다.
    - **숙소**: (팀원 작성 예정)
    - **항공**: (팀원 작성 예정)
    - **렌터카**: (팀원 작성 예정)
    - **패키지**: 베스트, 특가, 시즌 한정 등 카테고리별 분류를 통해 사용자의 탐색 편의성을 높였습니다.
- **상세보기 및 예약**: 실시간 재고 확인 및 옵션 선택을 통한 간편 예약 시스템을 구현했습니다.
- **마이페이지**: 예약 내역 조회 및 상태별(결제 완료/취소) 관리가 가능합니다.


## 🛠 기술 스택
- Frontend**: Flutter
- Backend**: Spring Boot
- Architecture**: MVVM 패턴, Riverpod (상태 관리)

## 📸 미리보기
![메인 화면 UI](./assets/images/002main.png)


## ⚙️ 시작하기 (Getting Started)

- 사전 요구 사항 (Prerequisites): 이 프로젝트를 실행하려면 다음 환경이 필요합니다
* IntelliJ IDEA
* Docker Desktop(데이터베이스 및 백엔드 실행용)
* Flutter SDK (v3.x 이상)
* Dart SDK
* Android Studio 또는 VS Code

- 원격 저장소 클론하기(각각 프런트와 백엔드)
 ```bash
   git clone https://github.com/jsg213213-boop/second_trip_project
   git clone https://github.com/parkjihyo-808/second_trip_project_back
