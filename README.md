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
| <img width="256" alt="flip_learn_icon" src="https://private-user-images.githubusercontent.com/38120056/391425137-b3c306bf-e010-4d50-b198-c9cc1046ed7b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUxMzctYjNjMzA2YmYtZTAxMC00ZDUwLWIxOTgtYzljYzEwNDZlZDdiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTdmOTI1Njk5YWVhZDFhZDc1MjVjMWU0MDUwYmMxMjA2Y2FmZmYxMDllZDczOGQzYWRhNzZmN2IyYTY3ZmU5OTMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.b7q-g97BYQKgmhPmszdALWJk3KerUYpSI53mQdmkXN8" /> | <img width="256" alt="flip_learn_splash" src="https://private-user-images.githubusercontent.com/38120056/391425315-b10201ff-3f73-49a4-8784-4489d2fedd95.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMTUtYjEwMjAxZmYtM2Y3My00OWE0LTg3ODQtNDQ4OWQyZmVkZDk1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWFkODUzYjViZTk0N2ViMjFiM2RmNjRiMGU2NDJmMzRmYjRlMGVjODMzN2U2OTAxYTA3OGI3ZDYwZGMxYzAwYzImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.sq_Ev06H451-RYp4GyzGFgBRpc8ag-PzoCOGlj92jTQ" /> | <img width="256" alt="flip_learn_home" src="https://private-user-images.githubusercontent.com/38120056/391425319-4dd8f782-4b99-4bb1-b5de-532df5cbd656.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMTktNGRkOGY3ODItNGI5OS00YmIxLWI1ZGUtNTMyZGY1Y2JkNjU2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTA4MGFiOWQwOWFiZmYyOGYzYjc5OWI4ZTAyN2Q2MWNhYWEyZDAxODY4ZTQ4ZTZlZTRmMmFmZGI0YzkzNDBjYTEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.GeO0VeAZSwgWLao16DR9xRKCevNclbIwljFDhnwCcdA" /> |
| 폴더 목록 | 덱 목록 | 카드 목록 |
| <img width="256" alt="flip_learn_folder_list" src="https://private-user-images.githubusercontent.com/38120056/391425325-a03b34b0-a342-46ef-ba71-75abd1391d0b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMjUtYTAzYjM0YjAtYTM0Mi00NmVmLWJhNzEtNzVhYmQxMzkxZDBiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTRjZjhiY2UxODM0OTA0NzZmODE4YWY4Mjc5NTQ1YTBjYThjYjI3ZmQyNDI3ZGMyMjNlNjY1OGMxNzg3ZWY4YTkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.7LcOFUOoT2G8Hz8EUYVvmGS3JL5LHZnpfWgf7i-vWWc" /> | <img width="256" alt="flip_learn_deck_list" src="https://private-user-images.githubusercontent.com/38120056/391425329-4d1b45c4-79b8-4a0e-bf69-bb60ed678b8f.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMjktNGQxYjQ1YzQtNzliOC00YTBlLWJmNjktYmI2MGVkNjc4YjhmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWM0YWMyNjZiYzc5YzZmNTJmMzZjOTdjNjQxYzc3NWY2MTMwYmQ5YjVlOGZhZjBmYjg5ZGViMTc4ODExNDUyYjkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.pdHxX1wY-DeASs_K8DSOIa5O1abx2Ff1FCXPFtR9-ZY" /> | <img width="256" alt="flip_learn_card_list" src="https://private-user-images.githubusercontent.com/38120056/391425333-9a9e78a2-1ee7-477d-9c69-9f085ec66682.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMzMtOWE5ZTc4YTItMWVlNy00NzdkLTljNjktOWYwODVlYzY2NjgyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBlOGFlNDhjMzE5NzNkYjE1MzdjODVkNGQ1NzFkYjA3NGY2MDU5MmJlMGQ0OGM1NDRkZTY5ZjUwOTJhMDdjNTEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.lc73UQvHYtR20B_SUnLvpi-lDZ_WSoMRWhffdPdNQKk" /> |
| 카드 보기 | 카드 뒤집기 | 카드 보기 마지막 |
| <img width="256" alt="flip_learn_view_card" src="https://private-user-images.githubusercontent.com/38120056/391425335-c0578723-9439-4f1b-9f53-0940bbda08d7.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMzUtYzA1Nzg3MjMtOTQzOS00ZjFiLTlmNTMtMDk0MGJiZGEwOGQ3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTcwYTJiMWQ3ZWIzOWNiZDE5NmNhMGU1NTczMmNiMDlmNmQ1MDNlMmNlMjRhZGQwYjNkMGU2OTBkMTY2MmE2NTImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.nwkYRM5oMbnqCitF2f9MOmCS-gf5yvJsXLgmusQ41OE" /> | <img width="256" alt="flip_learn_flip_card" src="https://private-user-images.githubusercontent.com/38120056/391425338-6c3d4c77-84b3-48a3-9d92-97bd233f4d0f.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzMzgtNmMzZDRjNzctODRiMy00OGEzLTlkOTItOTdiZDIzM2Y0ZDBmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTVmN2U5YTYxMzBiZTc0YmQxZjIyMjlkZTU5NzFkYzU4MTU0MmEzOTQ5MWM1ZDMwZTE0NmYxZTUyYjhhNzA2NTQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.7O9W2U-ZIhdXIIfvzp6LuXsWELKSE4Vqvb5Y61EIII8" /> | <img width="256" alt="flip_learn_after_last_card" src="https://private-user-images.githubusercontent.com/38120056/391425343-b9b1e766-58e8-47ec-922d-a570c33f0e58.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzNDMtYjliMWU3NjYtNThlOC00N2VjLTkyMmQtYTU3MGMzM2YwZTU4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTk4Y2Y1YWQ1OWFlMTUyMzRkNjVjNjJkN2MwYjEzMGM0YzUxZDRmZTc4MTgyYmViYmU2NzIxNzUwMTY3ODk4NjAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.c9IWZZu_nMCCUCqJ0b9bZ_oYF3nfBYu0af0mOSoi_C0" /> |
| 모르는 카드 다시 보기 | 내 정보 | |
| <img width="256" alt="flip_learn_review_didnt_know_cards" src="https://private-user-images.githubusercontent.com/38120056/391425347-6dd8e44a-897c-43ca-b7f3-6d7a2e930e1a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzNDctNmRkOGU0NGEtODk3Yy00M2NhLWI3ZjMtNmQ3YTJlOTMwZTFhLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTIyZmY3NTI1NDk0YWQyMjBjNWFhMmQ2Y2I5ZTFlN2I1MDU5ZDg1ZGQzMDgyM2M0YzhmZmMxMjY2OTliNTdiYzkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.-QkoMNS1gH4LpixYEkgzUW0fvFk3aSrdehv10OiDCZs" /> | <img width="256" alt="flip_learn_my_page" src="https://private-user-images.githubusercontent.com/38120056/391425353-5afd9f85-f84e-4a61-a175-c474bc27e488.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MzU3OTcxMDMsIm5iZiI6MTczNTc5NjgwMywicGF0aCI6Ii8zODEyMDA1Ni8zOTE0MjUzNTMtNWFmZDlmODUtZjg0ZS00YTYxLWExNzUtYzQ3NGJjMjdlNDg4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAxMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMTAyVDA1NDY0M1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTUzZTk2ODE2MGM4MjFiMGZiMTEwYWNjZGI0MmMyODNlZGU5NWE5MTMzYTMzNGI3ZWEyMTZiYmU1NWFhNzg3MjMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.TsqOnWc589teDHmYHbsSbbB-_FIH2Q006KUpuMbLyuc" /> | |

<br/>

## 업데이트

<br/>
