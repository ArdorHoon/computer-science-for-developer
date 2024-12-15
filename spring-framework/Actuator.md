# Spring Actuator

<mark>**Spring Boot에서 제공하는 기능으로 HTTP나 JMX를 이용해 지표 수집, 추척, 감사 등의 모니터링을 쉽게할 수 있게 해준다**</mark>

마이크로미터, 그라파나, 프로메테우스 같은 다양한 모니터링 시스템과 매우 쉽게 연동할 수 있는 기능도 제공한다. 보통은 해당 서비스가 살아있는지 **Health Check**하는 용도로  사용한다.

> Health Check : 서버의 상태를 주기적으로 확인하여 서버의 정상 동작 여부를 판단하는 과정, 일반적으로 REAT API 형태로 많이 사용한다.

</br>

## 사용법

우선적으로 actuator 사용을 위해 라이브러리 의존성을 추가해주어야 한다. 

```gradle

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-actuator'
}

```

의존성을 추가 후 앱을 동작 시키고 아래 url로 가면 actuator가 제공하는 서비스 목록을 확인할 수 있다. 

</br>

URL : <code>http://localhost:8080/actuator</code>

```xml
{
  "_links": {
    "self": {
      "href": "http://localhost:8080/actuator",
      "templated": false
    },
    "health": {
      "href": "http://localhost:8080/actuator/health",
      "templated": false
    },
    "health-path": {
      "href": "http://localhost:8080/actuator/health/{*path}",
      "templated": true
    }
  }
}

```

</br>

해당 서비스의 health 정보를 확인하기 위해 http://localhost:8080/actuator/health를 url창에 입력 해보면 정상적일 경우 UP을 나타낸다.
```json
{"status":"UP"}
```










</br>
