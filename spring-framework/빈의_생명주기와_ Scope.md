# 빈의 생명주기와 Scope


## 1️⃣ 빈의 생명주기

Bean 객체들은 Spring IoC 컨테이너가 의존성을 관리한다.

객체 관리의 주체가 프레임워크(Container)가 되기 때문에 개발자는 로직에 집중할 수 있는 장점이 있다. 

</br>

### <mark>**Spring Bean 이벤트 생명주기**</mark>
> **Spring Container 생성 ➡️ Spring Bean 생성 ➡️ 의존관계 주입 ➡️ 초기화 콜백 메소드 호출 ➡️ 사용 ➡️ 소멸 전 콜백 메소드 호출 ➡️ Spring 종료**

</br>

### <mark>**Bean 생명주기 콜백 3가지**</mark>

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



</br>


## 2️⃣ 빈 Scope




</br>
