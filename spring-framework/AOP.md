# AOP (Aspect Oriented Programming) 

<mark>**관점 지향 프로그래밍을 지원하는 기술, 메소드나 객체의 기능을 핵심 관심사와 공통 관심사로 나누어 프로그래밍 하는 것**</mark>

- 핵심 관심사(Core Concern) : 객체가 가져야 할 본래의 기능
- 공통 관심사(Cross-cutting Concer) : 여러 객체에서 공통적으로 사용되는 코드

Spring AOP를 통해서 로깅, 보안, 트랜잭션 관리 등과 같은 공통적인 관심사를 모듈화하여 코드 중복을 줄이고 유지 보수를 하는데 도움을 준다. 즉, 사용자 정의 Aspect를 구현하여 AOP로 OOP 사용을 보완하게 한다.

<br>

<p align="center">
<img src="https://github.com/user-attachments/assets/1e50d17a-cdc2-43f6-b31b-099ba6716e53" width="40%" height="40%"></br>
</p></br>


AOP는 위의 그림처럼 각 클래스에서 공통적으로 사용하는 관심사(주황색, 파란색, 빨간색 블럭)들을 모아서 모듈화시켜 코드의 재사용성과 유지 보수성을 강화한다. 

</br>

## Spring AOP 

앞서 말한 Spring에서 AOP를 쓰는 방법은 로깅, 보안, 트랙잭션 관리, 캐싱 등에서 어떤 방식으로 사용하는지 예시를 확인해 보자


### 로깅(Logging)

```java
@Aspect
@Component
public class LoggingAspect {

    @Before("execution(* com.example.service.UserService.getUser(..))")
    public void logBeforeUserGet() {
        System.out.println("Getting user...");
    }
}

```

</br>


### 트랜잭션 관리(Transaction Management)
```java
@Aspect
@Component
public class TransactionAspect {

    @AfterReturning("execution(* com.example.service.ProductService.*(..))")
    public void commitTransaction() {
        System.out.println("Committing transaction...");
    }

    @AfterThrowing("execution(* com.example.service.ProductService.*(..))")
    public void rollbackTransaction() {
        System.out.println("Rolling back transaction due to exception...");
    }
}


```

</br>

#### 보안 (Security)

```java
@Aspect
@Component
public class SecurityAspect {

    @Before("execution(* com.example.controller.AdminController.*(..))")
    public void checkAdminPermission() {
        System.out.println("Checking admin permission...");
    }
}


</br>

```

</br>

### 캐싱 (Caching)

```java
@Aspect
@Component
public class CachingAspect {

    @AfterReturning(pointcut = "execution(* com.example.service.CacheService.*(..))", returning = "result")
    public void cacheMethodResult(Object result) {
        // Cache the result...
        System.out.println("Caching method result...");
    }
}

```
