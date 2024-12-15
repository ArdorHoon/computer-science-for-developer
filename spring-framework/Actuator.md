# Spring Actuator

<mark>**Spring Boot에서 제공하는 기능으로 HTTP나 JMX를 이용해 지표 수집, 추척, 감사 등의 모니터링을 쉽게할 수 있게 해준다**</mark>

마이크로미터, 그라파나, 프로메테우스 같은 다양한 모니터링 시스템과 매우 쉽게 연동할 수 있는 기능도 제공한다. 보통은 해당 서비스가 살아있는지 **Health Check**하는 용도로  사용한다.

> Health Check : 서버의 상태를 주기적으로 확인하여 서버의 정상 동작 여부를 판단하는 과정, 일반적으로 REAT API 형태로 많이 사용한다.

</br>

## 1️⃣ 사용법

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


## 2️⃣ 다양한 EndPoint

일반적으로 application.yml에서 management를 통해 노출할 엔드포인트를 제한할 수 있다. 보안 문제 때문에 health나 info같은 기본적인 것들만 노출하길 권장한다. 

```yml
// env, info, health만 노출
management.endpoints.web.exposure.include=env,info,health

// 전체 엔드포인트 모두 노출 
management.endpoints.web.exposure.include=*
```

엔드 포인트 전체 노출 시, 아래와 같이 나온다. 

```json
{
  "_links": {
    "self": {
      "href": "http://localhost:8080/actuator",
      "templated": false
    },
    "beans": {
      "href": "http://localhost:8080/actuator/beans",
      "templated": false
    },
    "caches-cache": {
      "href": "http://localhost:8080/actuator/caches/{cache}",
      "templated": true
    },
    "caches": {
      "href": "http://localhost:8080/actuator/caches",
      "templated": false
    },
    "health": {
      "href": "http://localhost:8080/actuator/health",
      "templated": false
    },
    "health-path": {
      "href": "http://localhost:8080/actuator/health/{*path}",
      "templated": true
    },
    "info": {
      "href": "http://localhost:8080/actuator/info",
      "templated": false
    },
    "conditions": {
      "href": "http://localhost:8080/actuator/conditions",
      "templated": false
    },
    "configprops-prefix": {
      "href": "http://localhost:8080/actuator/configprops/{prefix}",
      "templated": true
    },
    "configprops": {
      "href": "http://localhost:8080/actuator/configprops",
      "templated": false
    },
    "env": {
      "href": "http://localhost:8080/actuator/env",
      "templated": false
    },
    "env-toMatch": {
      "href": "http://localhost:8080/actuator/env/{toMatch}",
      "templated": true
    },
    "loggers": {
      "href": "http://localhost:8080/actuator/loggers",
      "templated": false
    },
    "loggers-name": {
      "href": "http://localhost:8080/actuator/loggers/{name}",
      "templated": true
    },
    "heapdump": {
      "href": "http://localhost:8080/actuator/heapdump",
      "templated": false
    },
    "threaddump": {
      "href": "http://localhost:8080/actuator/threaddump",
      "templated": false
    },
    "metrics-requiredMetricName": {
      "href": "http://localhost:8080/actuator/metrics/{requiredMetricName}",
      "templated": true
    },
    "metrics": {
      "href": "http://localhost:8080/actuator/metrics",
      "templated": false
    },
    "sbom": {
      "href": "http://localhost:8080/actuator/sbom",
      "templated": false
    },
    "sbom-id": {
      "href": "http://localhost:8080/actuator/sbom/{id}",
      "templated": true
    },
    "scheduledtasks": {
      "href": "http://localhost:8080/actuator/scheduledtasks",
      "templated": false
    },
    "mappings": {
      "href": "http://localhost:8080/actuator/mappings",
      "templated": false
    }
  }
}


```

저 중 주로 사용할 만한 것에 대해 확인해 보면 아래와 같다.

* beans : 스프링 컨테이너에 등뢱된 빈을 보여줌
* env : Envrionment 정보 보여줌
* info : application 정보를 보여줌
* health : application 상태 정보 보여줌
* metrics : application metric 정보를 보여줌
* loggers : application logger 설정을 보여주고 변경 가능

다른 엔드포인트에 대한 설명은 [공식 사이트](https://docs.spring.io/spring-boot/reference/actuator/endpoints.html#actuator.endpoints)를 참조하면 된다. 

</br>
