# FlipLearn 플립런 - 플래시 카드 앱

<img width="256" alt="app_icon_image" src="https://github.com/0titanium/flutter_flash_card/blob/master/assets/images/flip_learn_icon.png" >

<br/>

## 설명

- 모바일 플래시 카드 앱

- 카드의 앞면과 뒷면을 번갈아 확인하며 효율적인 학습

<br/>

## 데모

| 시작 화면                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | 카드 보기                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <video src="https://private-user-images.githubusercontent.com/38120056/389894854-78da8f26-ec8c-4916-aa52-1b702f84329c.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzI2MTUzMzksIm5iZiI6MTczMjYxNTAzOSwicGF0aCI6Ii8zODEyMDA1Ni8zODk4OTQ4NTQtNzhkYThmMjYtZWM4Yy00OTE2LWFhNTItMWI3MDJmODQzMjljLm1wND9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDExMjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMTI2VDA5NTcxOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWM1ZmNiZTgyYzc1YzUyMjY4YTMyNmI2YjQ3ODI3MGE5MTJiYWY3ZmY5ODgxN2ZlNzY2MjBkNzc2NzAxNDhkZmImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.7WzcJ0Yf61-pyyWP-OGEohhquvTbciqzbfv12GuXGCY" width="400"></video> | <video src="https://private-user-images.githubusercontent.com/38120056/389865623-d49f10ee-0711-490d-b516-684858e6082e.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzI2MTA5NDQsIm5iZiI6MTczMjYxMDY0NCwicGF0aCI6Ii8zODEyMDA1Ni8zODk4NjU2MjMtZDQ5ZjEwZWUtMDcxMS00OTBkLWI1MTYtNjg0ODU4ZTYwODJlLm1wND9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDExMjYlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMTI2VDA4NDQwNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTFjMDk0MDhjZjc5MjFlZjE0N2FjMGM0YWIxYmZmY2RiYzE5MTA2Nzk1NDVmZTM1YzQwZDgzM2I4ZDg1NWE1ZjImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Cm3Vk268VPB90cExNnKTxOqw3FS92JJcJN2UWabDXIk" width="400"></video> |

<br/>

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

<br/>

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

<br/>

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

<br/>

## 업데이트

<br/>