# FlipLearn 플립런 - 플래시 카드 앱

## 설명

- 모바일 플래시 카드 앱

- 카드의 앞면과 뒷면을 번갈아 확인하며 효율적인 학습

## 데모

## 기능

- 학습 :
    - 작성된 일련의 카드들의 앞, 뒷면을 넘기며 학습

    - 작성된 순서, 랜덤 순서로 학습

- 카드 작성, 수정, 삭제 : 카드 앞면과 뒷면의 내용을 작성, 수정, 삭제

- 덱 구성, 수정, 삭제 : 여러 카드를 저장할 덱을 구성, 수정, 삭제

- 폴더 생성, 수정, 삭제 : 여러 덱을 저장할 폴더를 생성, 수정, 삭제

- 학습 기록 : 최근에 방문한 폴더 기록 표시, 삭제

- 로컬 데이터 저장, 삭제 : 폴더, 덱, 카드를 로컬에 저장, 삭제

- 외부 데이터 저장, 삭제 : 폴더, 덱, 카드를 Firestore database에 저장, 삭제

- 로그인, 로그아웃, 계정 탈퇴 : Firebase Authentication으로 구글 계정과 연동을 통한 로그인, 로그아웃, 계정 탈퇴

## 사용 방법

## 기술

- Language : Dart

- FrameWork : Flutter

- Libraries :
    - provider : 상태 관리
    - go_router : 라우팅
    - shared_preferences : 로컬 데이터 저장
    - firebase_core : firebase 연동
    - firebase_auth : 로그인 계정 인증
    - google_sign_in : 구글 계정 연동
    - cloud_firestore : 외부 데이터 저장
    - freezed : 모델 작성

- Database : Firestore

## 프로젝트 구조

<pre>
lib
    ├─ core
    │     └─ router
    ├─ data
    │     ├─ local
    │     ├─ mapper
    │     ├─ remote
    │     └─ repository_impl
    ├─ domain
    │     ├─ model
    │     ├─ repository
    │     └─ use_case
    └─ presentation
          ├─ components
          │     ├─ flash_card_app_bar
          │     └─ flash_card_bottom
          ├─ deck
          ├─ flip_card
          ├─ folder
          ├─ folder_list
          ├─ home
          ├─ my_info
          ├─ providers
          ├─ review_card
          ├─ sign_in
          └─ view_card
</pre>

## 업데이트