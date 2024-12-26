# Spring JDBC


## 1️⃣ JDBC(Java Database Connectivity)란?
<mark>**자바에서 데이터베이스에 접속할 수 있도록 도와주는 API**</mark></br></br>


<p align="center">
<img src="https://github.com/user-attachments/assets/1a7bb8b1-27f2-44dc-a9e0-35407b52917e" width="40%" height="40%"></br>
JDBC 흐름도
</p></br></br>

* **JDBC API** : 데이터베이스 연동을 가능하게하는 JDBC 클래스는 자바 패키지 java.sql과 javax.sql에 포함
* **JDBC Driver Manager** : 애플리케이션이 요구하는 데이터베이스에 접근하기 위한 적절한 드라이버를 선택하여 데이터베이스와 연결

</br>

JDBC 동작 흐름은 다음과 같다.

1. JDBC Driver 로딩 후 DB 연결(JDBC Driver 구현체를 이용해 특정 Vendor DB에 접근)
3. JDBC Driver Manager가 드라이버들을 관리하고 Connection 획득하는 기능 제공
4. 개발자는 JDBC API를 통해서 DB에 SQL을 실행하고 결과를 응답 받음

</br>

JDBC는 3가지 기능을 표준 인터페이스로 정의하여 제공

* java.sql.Connection - 연결
* java.sql.Statement - SQL을 담은 내용
* java.sql.ResultSet - SQL 요청 응답

</br>

## 2️⃣ Spring JDBC의 특징
Spring JDBC는 Spring Framewor에서 제공하는 JDBC 기반의 데이터 액세스 기술

Spring JDBC를 통해 JDBC를 보다 쉽고 효율적으로 사용할 수 있도록 추상화된 기능을 제공한다. 


</br>

## 3️⃣ Spring JDBC 활용


</br>
