# Spring Logging

<mark>**Log란? 시스템에서 발생되는 모든 행위와 이벤트 정보를 시간에 따라 남겨둔 데이터를 지칭한다. 그러한 로그를 남기는 행위를 logging**</mark>이라고 한다. 

일반적으로 Log는 System.out.println()으로 남길 수 있지만 실제 실무에서는 Spring에서 logging 라이브러리를 통해 로그를 남긴다. (spring-boot-starter-logging)

Spring Boot에서는 내부 로깅에 Commons Logging을 사용 하지만 기본 로그 구현은 열어둔다. Java Util Logging, Log4j2 및 Logback에 대한 default 설정을 제공한다. 

</br>

## Sprin에서 Log 사용하기

스프링 부트 라이브러리를 사용하면 spring-boot-starter-logging가 포함되고 기본적으로 [Logback](https://logback.qos.ch/)과 [SLF4J](https://www.slf4j.org/)를 포함하고 있다. 추가적으로 SLF4J를 사용하기 위해 Lombok을 추가해준다.

</br>

### 🥎 로그출력 포맷
```gradle
//날짜       |시간             |로그레벨|프로세스ID | 쓰레드명          | 클래스명                                   |로그메세지
2024-12-23T16:35:44.300+09:00  INFO 17708 --- [p-nio-80-exec-2] c.example.securitysample.LogController   : info  log =Spring-SLf4j-test
2024-12-23T16:35:44.303+09:00  WARN 17708 --- [p-nio-80-exec-2] c.example.securitysample.LogController   : warn  log =Spring-SLf4j-test
```

### 🥎 Log Level
> LEVEL : TRACE > DEBUG > INFO > WARN > ERROR


개발 서버는 debug 출력
운영 서버는 info 출력

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


