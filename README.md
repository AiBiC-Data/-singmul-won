# 작품소개
IoT와 앱을 통합한 반려 식물 맞춤형 관리 프로그램으로 아두이노를 이용해 온도센서, 습도센서, 조도센서를 설치하고 측정한 데이터 값을 앱으로 전송하여 그 값에 따라 식물 별 맞춤 관리 제공

# 개발 동기
![image](https://github.com/AiBiC-Data/-singmul-won/assets/76275193/5ae5faf7-264c-46cc-9e77-232c5fca0085)

# 작품의 기대효과 및 활동분야
- 식물 관리의 용이성을 높여 식물에 대한 접근성 증가
- 가정용 플랜테리어 산업의 발전 촉진 가능
- 커뮤니티 활성화 및 공유 기능 확대로 반려 식물의 관심도 증가
- 가정 내 식물 키우기 활성화로 미세먼지 저감 효과

# 작품의 장점
- 식물의 상태를 센서로 확인할 수 있고 그에 따라 알맞은 제어를 하여 최적의 관리 상태 유지
- AI를 접목하여 적정 센서의 데이터 분석이 가능하고 적정한 데이터값을 자동으로 찾아 주어 그 값으로 설정 가능
- 식물의 상태를 센서로 확인할 수 있고 그에 따라 알맞게 제어
- 식물 커뮤니티에서 사용자들끼리의 정보 공유가 가능하고, 식물일지를 작성하면서 반려 식물에 대한 관심도 증가 가능

# 시연 동영상
[![Video Label](https://img.youtube.com/vi/xsfDlEnk1cI/0.jpg)](https://www.youtube.com/watch?v=xsfDlEnk1cI)

# 구성도
![image](https://github.com/AiBiC-Data/-singmul-won/assets/76275193/54eacf9c-3eb6-4bbe-b361-810a36c5080c)


# 담당 역할 - 조권호
- AWS 클라우드 서버 대여 후 웹서버 설치
  - DB 생성 후 쿼리문 php 제작
  - 스크립트 호출로 데이터 관리
  - crontab을 활용한 파이썬 스크립트 스케줄링
![image](https://github.com/AiBiC-Data/-singmul-won/assets/76275193/ea0d21d2-4298-4f6b-a325-25282900afe1)

- Flutter를 이용한 앱 구현
  - 앱에서 사용자 로그인 기능과 식물 관리 페이지 구현
  - 로그인 정보는 DB 저장된 값과 비교 후 인증
  - 식물관리 부분은 서버에 저장된 정보와 실시간으로 화분의 센서 데이터들을 종합하여 화면에 출력 및 제어
![image](https://github.com/AiBiC-Data/-singmul-won/assets/76275193/f4666cde-4981-4331-a0db-8e8b9043b2e9)

- 아두이노를 이용한 IoT 화분 제작 전담
  - 많은 센서들을 사용함으로 인한 전력 부족 문제를 고려하여 외부 전원들을 사용하여 해결
  - 와이파이와 블루투스 모듈을 동시에 사용함으로 인한 시리얼통신 중복 문제를 순차적 통신 및 주기적 통신 변경 코드로 수정 후 해결
![image](https://github.com/AiBiC-Data/-singmul-won/assets/76275193/af91d268-fb6a-4a5d-bc81-578d21c0e79b)


# 발표 및 전시
- 작품 시현 및 11개월 간의 프로젝트 요약 발표
  - 질의 응답자 역할로 프로젝트와 관련된 질의응답 대응 
- 22.12.02 작품 전시 및 프로젝트 마무리
