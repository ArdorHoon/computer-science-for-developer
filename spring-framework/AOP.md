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

Spring AOP는 어노테이션을 통해 구현할 수 있다. 기본적으로 AOP를 구현하려면 해당 클래스에 @Aspect, @Component 어노테이션을 붙여야 한다. 

이후 추가적인 메서드에 적용할 추가적인 어노테이션은 아래와 같다.

|메서드|설명|
|------|---|
|@Before|대상 메서드가 실행되기 전에 Advice 실행|
|@After|대상 메서드가 실행된 후에 Advice 실행|
|@AfterReturning|대상 메서드가 정상적으로 실행되고 반환된 후에 Advice를 실행|
|@AfterThrowing|대상 메서드가 예외가 발생 했을 때 Advice를 실행|
|@Around|대상 메서드 실행 전, 후 또는 예외 발생 시에 Advice를 실행|

</br>

아래는 프로젝트의 모든 메소드의 호출 시간을 측정하고 싶어서 만든 AOP 하나의 예시다. AOP를 작성하고 @Configuration을 통해 컨테이너에 Bean을 등록해주면 사용할 수 있다. 

```java

/*TimeTraceAop.java*/

@Aspect
@Component
public class TimeTraceAop {

    @Around("execution(* com.hunmo.examplespring..*(..))")
    public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();

        System.out.println("START: " + joinPoint.toString());
        try {
            return joinPoint.proceed();
        } finally {
            long finish = System.currentTimeMillis();
            long timeMs = finish - start;
            System.out.println("END: " + joinPoint.toString()+ " " + timeMs + "ms");
        }
    }
}



/*SpringConfig.java*/
@Configuration
public class SpringConfig {

    @Bean
    public TimeTraceAop timeTraceAop() { return new TimeTraceAop();}
}


```


## 간단한 AOP 예제
Spring에서 로깅, 보안, 트랙잭션 관리, 캐싱 등 많은 곳에서 AOP를 사용하여 구현하는데 아래에서 예제 몇 개를 확인해보자.
</br>

### 로깅(Logging)
메서드의 호출과 반환 값을 로깅하는 작업
 
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
트랜잭션의 시작과 종료, 롤백 등을 처리

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
인증과 권한 부여와 같은 보안 관련 작업

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
메서드 결과를 캐시하여 성능을 향상시키는 작업

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

</br>
