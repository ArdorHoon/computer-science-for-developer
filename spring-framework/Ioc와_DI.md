# IoC와 DI

Spring의 IoC와 DI는 코드의 모듈화, 테스트 용이성, 유지보수성 등을 향상시키는 핵심 기능 중 하나이다.


## 1️⃣ IoC (Inversion of Control)
<mark>**IoC는 말 그대로 제어의 역전을 의미**</mark>  

전통적인 프로그래밍에서는 개발자가 프로그램의 흐름과 제어를 직접 다룬다. 
하지만 IoC는 프레임워크가 객체의 생성, 관리, 제어 흐름을 담당하도록 변경하는 개념이다.  

Spring은 이를 지원하기 위해 ApplicationContext 인터페이스를 통해 IoC 컨테이너를 구현한다. IoC 컨테이너 아래와 같은 역할을 한다. 

</br>

1. <mark>**객체의 생성 관리**</mark>
   - Bean을 생성 및 관리
3. <mark>**의존성 관리**</mark>
    - 객체 간의 의존성은 Spring이 주입
    - 객체가 필요로 하는 다른 객체를 직접 생성하거나 찾는 대신, Spring 컨테이너가 의존성 주입
5. <mark>**제어 흐름의 역전**</mark>
    - 개발자가 코드의 제어 흐름 결정하지 않고, Spring에서 객체의 라이프사이클 및 실행 흐름 관리

</br>

## 2️⃣ DI (Dependency Injection)

<mark>**객체를 직접 생성하는 게 아닌 외부(IOC 컨테이너)에서 생성한 후 주입**</mark>  

의존성 주입 방법을 3가지가 있다.

- 생성자 주입 (Constructor Injection)
- 수정자 주입 (Setter Injection)
- 필드 주입 (Field Injection)

</br>


### 🟥 생성자 주입 (Constructor Injection)
생성자를 통해 의존성을 주입하는 방식

```java
public class UserService {
    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    // ...
}
```

</br>


### 🟥 수정자 주입 (Setter Injection)

Setter 메서드를 통해 의존성을 주입하는 방식

```java

public class OrderService {
    private PaymentGateway paymentGateway;

    @Autowired
    public void setPaymentGateway(PaymentGateway paymentGateway) {
        this.paymentGateway = paymentGateway;
    }
    
    // ...
}

```

</br>

### 🟥 필드 주입 (Field Injection)
필드에 직접 의존성을 주입하는 방식

```java
@Service
public class CustomerService {
    @Autowired
    private CustomerRepository CustomerRepository;
    
    // ...
}

```


</br>
