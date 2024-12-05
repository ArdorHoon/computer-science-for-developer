# Configuration

<mark><code>@Configuration</code>은 객체를 Bean 정의하는 소스임을 나타내는 클래스 수준의 어노테이션</mark></br> 

즉, 클래스에 <code>@Configuration</code>을 선언하고 내부에 <code>@Bean</code>어노테이션을 통해 해당 객체들을 Bean으로 정의할 수 있다.

보통 클래스마다 목적에 맞게 Configuration을 사용해서 Bean을 정의한다. (SecurityConfig, AppConfig 등등)

<code>@Bean</code> 어노테이션은 메서드가 Spring IoC 컨테이너에서 관리할 새 객체를 인스턴스화하고, 구성 및 초기화할 때 사용한다.

이를 통해 사용자는 new를 생성자를 통해 직접 관리하지 않고 Spring 컨테이너를 통해 해당 객체를 사용할 수 있다. 

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

</br>

## Bean 간 종속성 주입 (Injecting Inter-bean Dependencies)

beanOne은 생성자 주입을 통해서 beanTwo에 대한 챔조를 받는다.

```java
@Configuration
public class AppConfig {

	@Bean
	public BeanOne beanOne() {
		return new BeanOne(beanTwo());
	}

	@Bean
	public BeanTwo beanTwo() {
		return new BeanTwo();
	}
}

```


</br>


## Lookup Method Injection

아래는 Lookup Method injection의 예시이다. (직접 필요한 의존 관계를 주입하는 것을 의미) 해당 기능은 Singleton 범위의 Bean이 Prototype의 Bean에 종속되어 있는 경우에 유용하다.</br>


```java
public abstract class CommandManager {
	public Object process(Object commandState) {
		// grab a new instance of the appropriate Command interface
		Command command = createCommand();
		// set the state on the (hopefully brand new) Command instance
		command.setState(commandState);
		return command.execute();
	}

	// okay... but where is the implementation of this method?
	protected abstract Command createCommand();
}
```

하지만 <code>@Configuration</code>을 사용하면 추상 메서드인 createCommand()가 새로운 command 객체를 찾는 방식으로 재정의되는 CommandManager의 하위 클래스를 만들 수 있다. 아래가 그 예제이다.

```java

@Bean
@Scope("prototype")
public AsyncCommand asyncCommand() {
	AsyncCommand command = new AsyncCommand();
	// inject dependencies here as required
	return command;
}

@Bean
public CommandManager commandManager() {
	// return new anonymous implementation of CommandManager with createCommand()
	// overridden to return a new prototype Command object
	return new CommandManager() {
		protected Command createCommand() {
			return asyncCommand();
		}
	}
}
```

</br>

## Java-Based Configuration이 내부적으로 동작하는 방식

또 하나의 예시로 @Bean이 달린 메서드가 두 번 호출되었다고 했을 때, 우리는 ClientDao가 두 번 생성된걸로 보이겠지만 기본적으로 Spring에서 인스턴스화된 Bean은 기본적으로 Singleton 범위를 갖는다. 그래서 Spring에서는 <code>@Configuration</code>클래스 시작 시, CGLIB로 서브클래싱이 되고 새 인스턴스를 만들기 전에 먼전 컨테이너에 캐시된 Bean이 있는지 확인한다.

```java

@Configuration
public class AppConfig {

	@Bean
	public ClientService clientService1() {
		ClientServiceImpl clientService = new ClientServiceImpl();
		clientService.setClientDao(clientDao());
		return clientService;
	}

	@Bean
	public ClientService clientService2() {
		ClientServiceImpl clientService = new ClientServiceImpl();
		clientService.setClientDao(clientDao());
		return clientService;
	}

	@Bean
	public ClientDao clientDao() {
		return new ClientDaoImpl();
	}
}

```


