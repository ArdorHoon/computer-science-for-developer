# Spring Logging

<mark>**Log란? 시스템에서 발생되는 모든 행위와 이벤트 정보를 시간에 따라 남겨둔 데이터를 지칭한다. 그러한 로그를 남기는 행위를 logging**</mark>이라고 한다. 

일반적으로 Log는 System.out.println()으로 남길 수 있지만 실제 실무에서는 Spring에서 logging 라이브러리를 통해 로그를 남긴다.

Spring Boot에서는 내부 로깅에 Commons Logging을 사용 하지만 기본 로그 구현은 열어둔다. Java Util Logging, Log4j2 및 Logback에 대한 default 설정을 제공한다. 

</br>

## 🟥 Sprin에서 Log 사용하기

스프링 부트 라이브러리를 사용하면 spring-boot-starter-logging가 포함되고 기본적으로 [Logback](https://logback.qos.ch/)과 [SLF4J](https://www.slf4j.org/)를 포함하고 있다. 추가적으로 SLF4J를 사용하기 위해 Lombok을 추가해준다.

로그 설정 시, 불필요한 문자 연산이 발생하지 않게 아래와 같이 사용해준다.

```java
log.debug("data={}", data) 
```
</br>

### 🥎 로그출력 포맷
```gradle
//날짜       |시간             |로그레벨|프로세스ID | 쓰레드명          | 클래스명                                   |로그메세지
2024-12-23T16:35:44.300+09:00  INFO 17708 --- [p-nio-80-exec-2] c.example.securitysample.LogController   : info  log =Spring-SLf4j-test
2024-12-23T16:35:44.303+09:00  WARN 17708 --- [p-nio-80-exec-2] c.example.securitysample.LogController   : warn  log =Spring-SLf4j-test
```

</br>

### 🥎 Log Level

> LEVEL : TRACE > DEBUG > INFO > WARN > ERROR

로그 레벨 설정을 변경해서 출력 결과를 다르게 할 수 있다. 
(보통 개발 서버는 debug, 운영 서버는 info를 사용)

</br>

### 🥎 Application 단위에서 로그 레벨 설정

<code>application.properties</code>나 <code>application.yml</code>에서 로그 레벨을 설정할 수 있다. (기본은 INFO) 

```properties

#전체 로그 레벨 설정(info)
logging.level.root=info

#hello.test 패키지와 그 하위 로그 레벨 설정
logging.level.hello.test =debug

```

</br>


### 🥎 Logback & SLF4J으로 로그 구현하기

#### 🔵 Logback

``` java
@RestController
public class LogController {

    private final Logger log = LoggerFactory.getLogger(LogController.class);

    @RequestMapping("log-logback")
    private String logTest(){
        String name = "Spring-logback-test";

        System.out.println("name : " + name);

        log.trace("trace log = {}", name);
        log.debug("debug log = {}", name);
        log.info("info log = {}", name);
        log.warn("warn log = {}", name);
        log.error("error log = {}", name);

        return "ok";
    }

}


```
</br>

#### 🔵 SLF4J

```java

@RestController
@Slf4j
public class LogController {


    @RequestMapping("log-slf4j")
    private String logTest(){
        String name = "Spring-SLf4j-test";

        System.out.println("name : " + name);

        log.trace("trace log ={}", name);
        log.debug("debug log ={}", name);
        log.info("info  log ={}", name);
        log.warn("warn  log ={}", name);
        log.error("error log ={}", name);

        return "ok";
    }

}


```

</br>

#### 🔵 Log 결과
![log](https://github.com/user-attachments/assets/e04f1c22-dc5c-44fb-b526-90017f33e702)


</br>


### 🥎 logback-spring.xml로 설정하기

resources 폴더 아래에 <code>logback-spring.xml</code>를 만들어서 더 상세하게 설정할 수 있다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>

        <property name="CONSOLE_PATTERN" value="%d{yyyy-MM-dd HH:mm:ss.SSS} %magenta([%thread]) %highlight([%-3level]) %logger{5} - %msg %n" />
        <property name="ROLLING_PATTERN" value="%d{yyyy-MM-dd HH:mm:ss.SSS}  %logger{5} - %msg %n" />
        <property name="FILE_NAME" value="/Users/hunmoyang/Desktop/security-sample/logs/application.log" />
        <property name="LOG_NAME_PATTERN" value="./logs/application-%d{yyyy-MM-dd-HH-mm}.%i.log" />
        <property name="MAX_FILE_SIZE" value="10MB" />
        <property name="TOTAL_SIZE" value="30MB" />
        <property name="MAX_HISTORY" value="2" />


        <!-- Console appender 설정 -->
        <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
            <encoder>
                <Pattern>${CONSOLE_PATTERN}</Pattern>
            </encoder>
        </appender>


        <appender name="ROLLING_LOG_FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
            <encoder>
                <pattern>${ROLLING_PATTERN}</pattern>
            </encoder>
            <file>${FILE_NAME}</file>
            <rollingPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedRollingPolicy">
                <fileNamePattern>${LOG_NAME_PATTERN}</fileNamePattern>
                <maxHistory>${MAX_HISTORY}</maxHistory>
                <maxFileSize>${MAX_FILE_SIZE}</maxFileSize>
                <totalSizeCap>${TOTAL_SIZE}</totalSizeCap>
            </rollingPolicy>
        </appender>



    <logger name="jdbc" level="OFF" />
    <logger name="jdbc.sqlonly" level="OFF" />
    <logger name="jdbc.sqltiming" level="OFF" />
    <logger name="jdbc.audit" level="OFF" />
    <logger name="jdbc.resultset" level="OFF" />
    <logger name="jdbc.resultsettable" level="OFF" />
    <logger name="jdbc.connection" level="OFF" />
    <logger name="com.example.securitysample" level="DEBUG" additive="false" >
        <appender-ref ref="STDOUT"/>
        <appender-ref ref="ROLLING_LOG_FILE"/>
    </logger>


    <root level="ERROR">
        <appender-ref ref="STDOUT" />
        <appender-ref ref="error" />
    </root>
</configuration>

```

위와 같이 설정하면 실행 시, 아래와 같이 로그 파일을 남길 수 있다.

<img width="1394" alt="logxml" src="https://github.com/user-attachments/assets/d0ef28f6-b86f-45a3-9c1e-c0a585d27d5f" />
