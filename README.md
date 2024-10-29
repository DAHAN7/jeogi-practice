🧳 jeogi-practice: 국비 교육으로 완성한 여행 정보 플랫폼
jeogi-practice는 국비 지원 프로그램에서 쌓은 웹 개발 역량을 바탕으로 구축한 여행 정보 플랫폼입니다. ✈️ 사용자 친화적인 인터페이스와 풍부한 기능을 통해 여행 계획부터 예약, 커뮤니티 활동까지 seamless한 여행 경험을 제공합니다.

본 프로젝트는 Spring 프레임워크의 강력한 기능과 MyBatis의 효율적인 데이터베이스 연동을 통해 안정적인 시스템을 구현했습니다. 또한, 웹 소켓 기술을 활용하여 실시간 채팅 기능을 지원하여 사용자 간의 활발한 정보 교류를 가능하게 합니다.

✨ 주요 기능

🔎 숙박 시설 검색 및 예약: 지역, 가격, 유형, 편의 시설 등 다양한 조건으로 원하는 숙박 시설을 손쉽게 찾고 예약할 수 있습니다. 직관적인 UI를 통해 예약 현황을 확인하고 간편하게 예약을 진행할 수 있습니다.
🗺️ 여행지 정보 제공: 인기 여행지, 숨겨진 명소, 맛집, 축제 등 여행에 필요한 다채로운 정보를 제공합니다. 사용자 리뷰 시스템을 통해 생생한 경험담을 공유하고, 여행 계획에 도움을 받을 수 있습니다.
💬 실시간 채팅: 여행 정보를 공유하고, 궁금한 점을 해결하며, 다른 사용자들과 실시간으로 소통할 수 있는 채팅 기능을 제공합니다. 1:1 채팅, 그룹 채팅 등 다양한 채팅 방식을 지원합니다.
🙋 고객 지원: FAQ, 1:1 문의, 이메일 문의 등 다양한 채널을 통해 사용자 문의 사항을 신속하게 처리하고, 만족스러운 고객 지원 서비스를 제공합니다.
🔐 회원 관리: Spring Security를 기반으로 안전한 회원 인증 및 권한 관리 시스템을 구축했습니다. 회원 가입, 로그인, 정보 수정 등의 기능을 제공하며, 개인 정보 보호에 최선을 다합니다.
🚀 기술 스택

프레임워크: Spring Framework 5.x (Spring MVC, Spring Security)
데이터베이스: MySQL 8.0.30
ORM: MyBatis 3.x
웹 서버: Apache Tomcat 9.x
빌드 도구: Maven
형상 관리: Git
웹 소켓: Java WebSocket API
개발 도구: Eclipse
💻 설치 및 실행

이 저장소를 클론합니다: git clone https://github.com/사용자이름/jeogi-practice.git
Eclipse에서 프로젝트를 Import 합니다.
MySQL 서버를 설치하고, src/main/resources/prop/db.properties 파일의 데이터베이스 연결 정보를 설정합니다.
Maven을 사용하여 프로젝트를 빌드합니다: mvn clean install
Apache Tomcat 서버를 실행합니다.
웹 브라우저에서 http://localhost:8080/jeogi 에 접속합니다.
📁 프로젝트 구조

src/main/java/com/bitc/jeogi: 핵심 Java 코드 (컨트롤러, 서비스, DAO, VO)
src/main/resources: 설정 파일 (Spring, MyBatis, 로깅) 및 프로퍼티 파일
src/main/webapp: 웹 리소스 (JSP, CSS, JavaScript, 이미지)
target: 빌드 결과물
🤝 기여

프로젝트 개선에 기여하고 싶으신 분은 언제든지 이슈 제기 또는 풀 리퀘스트를 보내주세요!

📄 라이선스

MIT License
