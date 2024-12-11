# 빈의 생명주기와 Scope


## 1️⃣ 빈의 생명주기

Bean 객체들은 Spring IoC 컨테이너가 의존성을 관리한다.

객체 관리의 주체가 프레임워크(Container)가 되기 때문에 개발자는 로직에 집중할 수 있는 장점이 있다. 

</br>

### <mark>**🔶 Spring Bean 이벤트 생명주기**</mark>
> **Spring Container 생성 ➡️ Spring Bean 생성 ➡️ 의존관계 주입 ➡️ 초기화 콜백 메소드 호출 ➡️ 사용 ➡️ 소멸 전 콜백 메소드 호출 ➡️ Spring 종료**

</br>

### <mark>**🔶 Bean 생명주기 콜백 3가지**</mark>

#### 1. 인터페이스 (InitializingBean, DisposableBean)
```java
      public class ExampleBean implements InitializingBean, DisposableBean {   
  	    
        @Override    
	      public void afterPropertiesSet() throws Exception {        
		      // 초기화 콜백 (의존관계 주입이 끝나면 호출)   
	      }    
	
    	  @Override    
	      public void destroy() throws Exception {       
                      // 소멸 전 콜백 (메모리 반납, 연결 종료와 같은 과정)    
	      }
}

```

* InitalizingBean은 afterPropertiesSet() 메소드로 초기화를 지원(의존관계 주입이 끝난 후에 초기화 진행)
* DisposableBean은 destroy() 메소드로 소멸을 지원 (Bean 종료 전에 마무리 작업, 예를 들면 자원 - close()등)

</br>

##### 🔹 이 방식의 단점
* InitalizingBean, DisposableBean 인터페이스는 스프링 전용 인터페이스이다. 해당 코드가 인터페이스에 의존
* 코드를 커스터마이징 할 수 없는 외부 라이브러리에 적용 불가능
* 초기화, 소멸 메소드를 오버라이드 하기 때문에 메소드명을 변경할 수 없음  


</br>


#### 2. 설정 정보에 초기화 메소드, 종료 메소드 지정
```java
public class ExampleBean {     

	public void initialize() throws Exception {       
		 // 초기화 콜백 (의존관계 주입이 끝나면 호출)   
	 }    

	 public void close() throws Exception {      
		  // 소멸 전 콜백 (메모리 반납, 연결 종료와 같은 과정)    
	}
}

@Configuration
class LifeCycleConfig {     

	@Bean(initMethod = "initialize", destroyMethod = "close")    
	public ExampleBean exampleBean() {       
		 // 생략   
	 }
}


```

* 메소드명을 자유롭게 부여 가능
* 스프링 코드에 의존하지 않음
* 설정 정보를 사용하기 때문에 코드를 커스터마이징 할 수 없는 외부라이브러리에서도 적용 가능

</br>


##### 🔹 이 방식의 단점
* Bean 지정시 initMethod와 destoryMethod를 직접 지정해야 하기에 번거롭다.



</br>

#### 3. <code>@PostConstruct</code>,<code>@PreDestroy</code> 어노테이션 지원
```java
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy; 

public class ExampleBean {     

	@PostConstruct   
	 public void initialize() throws Exception {       
		 // 초기화 콜백 (의존관계 주입이 끝나면 호출)   
	 }     

	@PreDestroy    
	public void close() throws Exception {       
		 // 소멸 전 콜백 (메모리 반납, 연결 종료와 같은 과정)    
	}
}


```
* <mark>**최신 스프링에서 가장 권장하는 방법**</mark>
* 어노테이션 하나만 붙이면 되므로 매우 편리함
* 스프링이 아닌 다른 컨테이너에서도 동작(스프링에 종속적인 기술이 아닌 JSR-250이라는 자바 표준)
* 컴포넌트 스캔과 잘 어울림

</br>


##### 🔹 이 방식의 단점
* 커스터마이징이 불가능한 외부 라이브러리에서 적용이 불가능 (외부 라이브러리에서 초기화, 종료를 해야하는 경우 2번째 방법을 사용)


</br>


## 2️⃣ 빈 Scope

<mark>**빈 Scope는 Bean 생성 시 Bean이 존재할 수 있는 범위를 의미**</mark>

**Spring에서 Bean은 기본적으로 Singleton Scope로 생성된다.** Spring에서는 아래와 같은 다양한 Scope를 지원한다.


1. 싱글톤(Singleton)
2. 프로토타입(Prototype)
3. 웹 관련 스코프
   * request
   * session
   * application


### 싱글톤(Singleton)
<mark>**스프링 컨테이너의 시작과 종료까지 유지되는 가장 넓은 범위의 스코프**</mark>


</br>

### 프로토타입(Prototype)
<mark>**스프링 컨테이너는 프로토타입 빈의 생성과 의존관계 주입까지만 관여하고 더는 관리하지 않는 매우 짧은 범위의 스코프**</mark>

</br>

### 웹 관련 스코프

1. request : 웹 요청이 들어오고 나갈 때까지 유지되는 스코프
2. session : 웹 세션이 생성되고 종료될 때까지 유지되는 스코프
3. application : 웹의 서블릿 컨텍스트와 같은 범위로 유지되는 스코프

</br>
