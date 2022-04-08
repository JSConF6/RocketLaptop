# RocketLaptop Project :rocket:

RocketLaptop 개인 프로젝트 입니다.

## :book: 프로젝트 기능

- 회원가입 & 로그인
- 아이디 비밀번호 찾기
- 상품주문 및 결제
- 장바구니 기능
- 회원정보 수정, 배송지 관리, 주문목록, 나의활동
- 관리자 페이지 공지, 문의, 주문, 상품, 회원 관리

## :books: 기술스택

#### :blue_book: 프론트엔드

- HTML
- CSS
- JavaScript(JQuery)
- JSP
- Bootstrap5

#### :green_book: 백엔드

- Java 11
- Spring Boot 2.6.4
- MyBatis
- Spring Security
- MySQL

## :package: 개발환경

- STS4
- VS Code
- DBeaver

## :computer: 구동화면

### 🔍 (메인페이지) 메인화면

- 신규, 베스트상품을 swiper 라이브러리를 통해 보여주도록 구현. 상품 사진이나 상세보기 클릭 시 해당 상품의 상세 페이지로 이동.
- 맨 위쪽 헤더를 통해 어디서든 로그인이 가능하도록 구현
- 관리자 아이디로 로그인 시 관리자 페이지로 접근이 가능한 버튼이 등장
- 상품명, 카테고리명으로 검색이 가능하도록 구현

![메인화면](https://user-images.githubusercontent.com/41312091/162463528-d5ce2d71-f13d-478b-b2fd-681db87585dc.gif)

### 🔍 (메인페이지) 로그인

- 로그인 기능(Spring Security 적용)

![로그인](https://user-images.githubusercontent.com/41312091/162463492-f0871b16-4e84-4096-9f40-800e11dc9a4d.gif)

### 🔍 (메인페이지) 회원가입

- 정규식과 ajax를 이용한 회원가입 유효성검사

![회원가입](https://user-images.githubusercontent.com/41312091/162463685-ceb9b5db-b2ac-4aa6-94ad-7605b2d73106.gif)

### 🔍 (메인페이지) 아이디 찾기

- 이름과 이메일로 DB에 검색해서 아이디가 있는지 찾도록 구현

![아이디 찾기](https://user-images.githubusercontent.com/41312091/162491200-8e232e02-0f0d-43d5-bb05-60702c4fa8e3.gif)

### 🔍 (메인페이지) 비밀번호 찾기

- JavaMail을 통해 비밀번호 찾기 구현

![비밀번호 찾기](https://user-images.githubusercontent.com/41312091/162491452-94e0c67a-8847-4879-820d-b8a582fa07b2.gif)

### 🔍 (메인페이지) 카테고리, 베스트, 새로운 상품 화면

- 카테고리, 베스트, 새로운 상품 리스트

![카테고리, 베스트, 새로운 상품](https://user-images.githubusercontent.com/41312091/162464276-66dd5d7f-2279-4a91-a2cd-e326ecbfd038.gif)

### 🔍 (메인페이지) 공지사항 화면

- 관리자가 등록한 공지사항 목록

![공지사항](https://user-images.githubusercontent.com/41312091/162448650-dc73d310-74be-4cb0-939c-cc4fd68901f1.gif)

### 🔍 (메인페이지) 상품 상세 화면

- 상품 이미지나 이름 클릭 시 상세 페이지로 이동
- 상품 문의사항을 등록 할 수 있고 상품 리뷰를 볼 수 있다.

![상품 상세, 문의, 리뷰](https://user-images.githubusercontent.com/41312091/162464869-5ae36bc4-7ba9-4bfb-87e1-7bf1fddd400b.gif)

### 🔍 (메인페이지) 상품 주문

- Iamport API를 통해 결제 시스템을 구현 결제가 완료 되면 결제 완료 페이지로 이동

![상품주문](https://user-images.githubusercontent.com/41312091/162445783-fda7ed38-ef62-4afd-9b64-205abb3db1cb.gif)

### 🔍 (메인페이지) 장바구니

- 상품 삭제, 전체삭제 기능(Ajax)
- 상품을 선택하고 주문을 클릭하면 결제페이지로 이동

![장바구니](https://user-images.githubusercontent.com/41312091/162464357-90039439-46fc-4204-ba81-463f3d9693fd.gif)

### 🔍 (메인페이지) 장바구니 상품주문

- Iamport API를 통해 결제 시스템을 구현 결제가 완료 되면 결제 완료 페이지로 이동

![장바구니 상품주문](https://user-images.githubusercontent.com/41312091/162464368-db3b3c8e-4d4b-4b3f-999b-f621a38976d0.gif)

### 🔍 (메인페이지) 마이페이지

- 배송상태 확인 / 주문목록, 회원정보 수정, 배송지 관리, 나의 활동 페이지로 이동 가능한 링크 제공

![마이페이지](https://user-images.githubusercontent.com/41312091/162445884-c1b8cfb7-4509-4348-95fd-603e2f3adfb1.gif)

### 🔍 (메인페이지) 마이페이지 회원정보 수정

- 회원탈퇴, 비밀번호 변경, 회원정보 수정 기능 제공

![회원정보수정](https://user-images.githubusercontent.com/41312091/162464480-f45587f1-5084-4ac2-afad-0351188c4c4d.gif)

### 🔍 (메인페이지) 마이페이지 주문목록

- 회원이 주문한 상품의 목록을 보여주고 Ajax를 통해 배송상태 필터를 제공

![마이페이지 주문목록](https://user-images.githubusercontent.com/41312091/162445895-39aa2925-9a0a-4ddc-8cdb-74717df4b126.gif)

### 🔍 (메인페이지) 마이페이지 나의활동

- 내가 쓴 리뷰, 내가 쓴 문의사항 페이지를 제공

![마이페이지 나의활동](https://user-images.githubusercontent.com/41312091/162445911-ef878cba-bdf7-4a18-9c66-4f290c199eb7.gif)

### 🔍 (메인페이지) 마이페이지 배송지관리

- 배송지 등록, 수정, 삭제

![마이페이지 배송지](https://user-images.githubusercontent.com/41312091/162445901-1d816af9-ca09-41a8-9b41-f319df00deb2.gif)

### 🔍 (메인페이지) 회원탈퇴

- 회원 탈퇴

![회원탈퇴](https://user-images.githubusercontent.com/41312091/161190444-23ec41e6-559d-447c-88f3-9f2234921c0b.gif)

### 🔍 (관리자페이지) 관리자 페이지 메인 화면

- 각 데이터의 갯수 및 관리 현황 출력

![관리자 페이지 메인](https://user-images.githubusercontent.com/41312091/160993756-d2d14072-fe3c-479c-9ceb-2dda51527c81.gif)

### 🔍 (관리자페이지) 관리자 페이지 공지사항 목록

- 공지사항 목록, 등록
- 공지사항 상세보기, 수정, 삭제

![관리자 페이지 공지사항](https://user-images.githubusercontent.com/41312091/160993765-4ee8249b-e225-4bdd-8ad0-14ef821caa18.gif)

### 🔍 (관리자페이지) 관리자 페이지 문의사항 목록

- 문의사항 목록, 페이징
- 문의사항 상세보기, 답변달기, 삭제 기능 제공

![관리자 페이지 문의사항](https://user-images.githubusercontent.com/41312091/160993772-13ae22ee-9c2f-4484-8269-9c49b7f2c6c3.gif)

### 🔍 (관리자페이지) 관리자 페이지 주문 목록

- 회원들이 주문 목록 페이지
- 배송상태 변경 기능

![관리자 페이지 주문목록](https://user-images.githubusercontent.com/41312091/160993803-271b7737-6d9c-4fbc-943f-fe43acb124f0.gif)

### 🔍 (관리자페이지) 관리자 페이지 상품 목록

- 상품 목록, 등록
- 상품 수정, 삭제

![관리자 페이지 상품목록1](https://user-images.githubusercontent.com/41312091/160993779-17ce8aa7-32bb-4f8f-8852-807e49adf8b2.gif)
![관리자 페이지 상품목록2](https://user-images.githubusercontent.com/41312091/160993786-3594326d-acac-4a94-a3a1-3ae0b001793c.gif)

### 🔍 (관리자페이지) 관리자 페이지 유저 목록

- 회원 목록, 상세보기

![관리자 페이지 유저목록](https://user-images.githubusercontent.com/41312091/160993796-9da75c40-5cbf-4097-a213-ce4806c116a2.gif)
