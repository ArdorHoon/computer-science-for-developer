# Spring Logging

<mark>**Log란? 시스템에서 발생되는 모든 행위와 이벤트 정보를 시간에 따라 남겨둔 데이터를 지칭한다. 그러한 로그를 남기는 행위를 logging**</mark>이라고 한다. 

일반적으로 Log는 System.out.println()으로 남길 수 있지만 실제 실무에서는 Spring에서 logging 라이브러리를 통해 로그를 남긴다. (spring-boot-starter-logging)

Spring Boot에서는 내부 로깅에 Commons Logging을 사용 하지만 기본 로그 구현은 열어둔다. Java Util Logging, Log4j2 및 Logback에 대한 default 설정을 제공한다. 

## Logback & SLF4J

스프링에서 로깅 라이브러리를 사용하기 위해 아래 dependency를 추가해준다.

```gradle

```

로깅 라이브러리에 들어있는 [Logback](https://logback.qos.ch/)과 [SLF4J](https://www.slf4j.org/)를 통해 로그를 기록하는 방법을 확인해보자!



### Log Level
TRACE > DEBUG > INFO > WARN > ERROR
개발 서버는 debug 출력
운영 서버는 info 출력
