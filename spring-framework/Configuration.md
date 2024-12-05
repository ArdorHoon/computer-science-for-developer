# Configuration

<mark><code>@Configuration</code>은 객체를 Bean 정의하는 소스임을 나타내는 클래스 수준의 어노테이션</mark></br> 

즉, 클래스에 <code>@Configuration</code>을 선언하고 내부에 <code>@Bean</code>어노테이션을 통해 해당 객체들을 Bean으로 정의할 수 있다.

<code>@Bean</code> 어노테이션은 메서드가 Spring IoC 컨테이너에서 관리할 새 객체를 인스턴스화하고, 구성 및 초기화할 때 사용한다.

> 빈(Bean)은 Spring 컨테이너에 의해 관리되는 재사용 가능한 소프트웨어 컴포넌트

</br>

아래와 같이 사용할 수 있다.

```java
@Configuration
public class AppConfig {

	@Bean
	public MyServiceImpl myService() {
		return new MyServiceImpl();
	}
}

```
