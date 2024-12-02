# FlipLearn 플립런 - 플래시 카드 앱

<img width="256" alt="app_icon_image" src="https://github.com/0titanium/flutter_flash_card/blob/master/assets/images/flip_learn_icon.png" >

<br/>

## 목차

1. [설명](#설명)
2. [데모](#데모)
3. [기능](#기능)
4. [기술](#기술)
5. [프로젝트 구조](#프로젝트-구조)
6. [화면](#화면-이미지)
7. [업데이트](#업데이트)

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

- 카드 관리 : 카드 앞면과 뒷면의 내용을 작성, 수정, 삭제

- 덱 관리 : 여러 카드를 저장할 덱을 구성, 수정, 삭제

- 폴더 관리 : 여러 덱을 저장할 폴더를 생성, 수정, 삭제

- 학습 기록 : 최근에 방문한 폴더 기록 표시, 삭제

- 로컬 데이터 관리 : 폴더, 덱, 카드를 로컬에 저장, 삭제

- 외부 데이터 관리 : 폴더, 덱, 카드를 Firestore database에 업로드, 다운로드,  삭제

- 계정 관리 : Firebase Authentication으로 구글 계정과 연동을 통한 로그인, 로그아웃, 계정 탈퇴

<br/>

## 기술

- Language : Dart

- FrameWork : Flutter

- Libraries :
  - provider: ^6.1.2 - 상태 관리
  - go_router: ^14.2.7 - 라우팅
  - shared_preferences: ^2.3.2 - 로컬 데이터 저장
  - firebase_core: ^3.6.0 - firebase 연동
  - firebase_auth: ^5.3.1 - 로그인 계정 인증
  - google_sign_in: ^6.2.1 - 구글 계정 연동
  - cloud_firestore: ^5.4.4 - 외부 데이터 저장
  - freezed: ^2.5.7 - 모델 작성
  - flutter_native_splash: ^2.4.3 - 스플래시 화면
  - flutter_launcher_icons: ^0.14.1 - 앱 아이콘

- Database : Firestore

<br/>

## 프로젝트 구조

<pre>
lib
  ├─core
  │  └─router
  ├─data
  │  ├─data_source
  │  │  ├─local
  │  │  └─remote
  │  ├─mapper
  │  └─repository_impl
  ├─domain
  │  ├─model
  │  ├─repository
  │  └─use_case
  └─presentation
      ├─components
      │  ├─flash_card_app_bar
      │  └─flash_card_bottom
      ├─deck
      ├─flip_card
      ├─folder
      ├─folder_list
      ├─home
      ├─my_info
      ├─providers
      ├─review_card
      ├─sign_in
      └─view_card
</pre>

<br/>

## 화면 이미지

| 아이콘 | 스플래시 | 홈 화면 |
| --- | --- | --- |
| <img width="256" alt="flip_learn_icon" src="https://private-user-images.githubusercontent.com/38120056/391425137-b3c306bf-e010-4d50-b198-c9cc1046ed7b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUxMzctYjNjMzA2YmYtZTAxMC00ZDUwLWIxOTgtYzljYzEwNDZlZDdiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTJiNDM3MzY4YTM4ODFhOTRmYzZiOTRkOGRmNDM4NjA5MDZiNWYzMTIxOGRlNzQ5NjA0OGViZDhjYWE0MTI5MTgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.dkN9d3Xeqf1SnGt-05bN_7N8gA1TKUYrwyeIWW79XBc" /> | <img width="256" alt="flip_learn_splash" src="https://private-user-images.githubusercontent.com/38120056/391425315-b10201ff-3f73-49a4-8784-4489d2fedd95.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMTUtYjEwMjAxZmYtM2Y3My00OWE0LTg3ODQtNDQ4OWQyZmVkZDk1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTUyNmY0ZmUxYzc3ZTRmODRkMDBmZThiMGQzNzVlYTAwMDhiNTk0NDRkMzNlMTI5ZDA2MDYzYzE3OGFlNGFkMzcmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.KsFLnzTE55IdE3GBLuJGVlf7Ajf68UGK21aZC8ZdeJo" /> | <img width="256" alt="flip_learn_home" src="https://private-user-images.githubusercontent.com/38120056/391425319-4dd8f782-4b99-4bb1-b5de-532df5cbd656.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMTktNGRkOGY3ODItNGI5OS00YmIxLWI1ZGUtNTMyZGY1Y2JkNjU2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWJiMmY3OTk0NzA0MWYzNjJhNjliMmM1NDQ2YjRmYTU1NjA4MWU4M2FjZmY3MmQyYzIyNGZiNzk3NWFhY2UxN2QmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.WpzLM7V3m1iSdQbQUEek_aB5RYbyHiu36r6NfW3Yiig" /> |
| 폴더 목록 | 덱 목록 | 카드 목록 |
| <img width="256" alt="flip_learn_folder_list" src="https://private-user-images.githubusercontent.com/38120056/391425325-a03b34b0-a342-46ef-ba71-75abd1391d0b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMjUtYTAzYjM0YjAtYTM0Mi00NmVmLWJhNzEtNzVhYmQxMzkxZDBiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTM4ZDg4ZTRhZWExMThjOTVlNzIzNjg1NWJmNjczMTYwODBhZDY2YWUwN2U4NWJiNzFlMThlZjFiMTczYTJkNzAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.71axJWcZKQlLqo9udVGZFSL64vTxut8QvS-zYgmxEdg" /> | <img width="256" alt="flip_learn_deck_list" src="https://private-user-images.githubusercontent.com/38120056/391425329-4d1b45c4-79b8-4a0e-bf69-bb60ed678b8f.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMjktNGQxYjQ1YzQtNzliOC00YTBlLWJmNjktYmI2MGVkNjc4YjhmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBiNDE1OGEyYmE3ZWJmOWI2NjdjZmI2YjEwZmEwYzVlZDkzZGQzYThiZTYyYWNhZjdjMzZmMmNjMzJjYmM3NTImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.iTVj__4o351ORVLJgViDWfmOIcjjrDOAS1b8OjA7pPA" /> | <img width="256" alt="flip_learn_card_list" src="https://private-user-images.githubusercontent.com/38120056/391425333-9a9e78a2-1ee7-477d-9c69-9f085ec66682.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMzMtOWE5ZTc4YTItMWVlNy00NzdkLTljNjktOWYwODVlYzY2NjgyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTkwMmZmZjQwMmEzMjdlNzMxMzMzYjIzYjkyNjI3OWU4MTAxNTEzM2NjMjc1Y2NmOGQ3NjAyNmNhMjIxYzExNjQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.jbKevmFzVtkI2CsipWDuun0j9b6anldSjQzhldXarpA" /> |
| 카드 보기 | 카드 뒤집기 | 카드 보기 마지막 |
| <img width="256" alt="flip_learn_view_card" src="https://private-user-images.githubusercontent.com/38120056/391425335-c0578723-9439-4f1b-9f53-0940bbda08d7.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMzUtYzA1Nzg3MjMtOTQzOS00ZjFiLTlmNTMtMDk0MGJiZGEwOGQ3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTNiYmYyYWJhMTY4ZGQ0MzVmZjlhNDg1YzU5NzMxNTQxOWE0YWQxODUzMTQ3NjM0NWQwNzAzYmE1Y2U0Y2Y3OTkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.sYiAGVLa8O0QShJFUdbI___6EBwyssIjD0VsU4Iq5W8" /> | <img width="256" alt="flip_learn_flip_card" src="https://private-user-images.githubusercontent.com/38120056/391425338-6c3d4c77-84b3-48a3-9d92-97bd233f4d0f.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMzgtNmMzZDRjNzctODRiMy00OGEzLTlkOTItOTdiZDIzM2Y0ZDBmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTNiZDdkYWQyMGI4MzA1OGRmZjNhZmRkZmNlMjBiODA2ZDRmZjhhM2IxNzY1NzVjMmI5NjgyM2M0ZGMwOTMxNTYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.1-8dcEcPJmcucn4GNZQzsJg4h0Co_A1QwfLOWW2aPpM" /> | <img width="256" alt="flip_learn_after_last_card" src="https://private-user-images.githubusercontent.com/38120056/391425343-b9b1e766-58e8-47ec-922d-a570c33f0e58.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzNDMtYjliMWU3NjYtNThlOC00N2VjLTkyMmQtYTU3MGMzM2YwZTU4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWZhMGMxNzdmNTM2MDZkNGM4MTMyM2RhMTJjMjg1Y2M3OWM4N2IwMzViMWFiZTRkNzAxMTc1NjY3NThmOGJmMzAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.4ndI3eH99mnBf7QYkaFOsvuFwtMB1FVvtv6fJFK2AjU" /> |
| 모르는 카드 다시 보기 | 내 정보 | |
| <img width="256" alt="flip_learn_review_didnt_know_cards" src="https://private-user-images.githubusercontent.com/38120056/391425347-6dd8e44a-897c-43ca-b7f3-6d7a2e930e1a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzNDctNmRkOGU0NGEtODk3Yy00M2NhLWI3ZjMtNmQ3YTJlOTMwZTFhLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWVhZTE2MGI1MjllYzFlYmY4YmNiZjkwMWQ0NDA3NDFiYjhjYjBiZjYxY2E1MGM1ZmRhODIzZjc4MGFkZjc3MGMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.NYgLDmX-p8gryPdCJdzr54hwm02IsS_a1XjgfR_OH-U" /> | <img width="256" alt="flip_learn_my_page" src="https://private-user-images.githubusercontent.com/38120056/391425353-5afd9f85-f84e-4a61-a175-c474bc27e488.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzMxMTk2MTQsIm5iZiI6MTczMzExOTMxNCwicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzNTMtNWFmZDlmODUtZjg0ZS00YTYxLWExNzUtYzQ3NGJjMjdlNDg4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNDEyMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjQxMjAyVDA2MDE1NFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWRlN2E5ZGFkYTY1NDZjZTk5YzYwMzY3OGVkN2I5ZjU3NTIzZDNjMjRiZGI2ZjhjNjY5MmNlNDg1MTZlNWM1NWImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.lMl3DOS8WPID_3uIej6rWkrreDcjXvsGbEsjQYKiLKg" /> | |

<br/>

## 업데이트

<br/>
