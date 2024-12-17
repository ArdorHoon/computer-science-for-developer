# Annotation (어노테이션)

<mark>**사전적 의미로는 주석이라는 뜻이지만, 자바에서 Annotaion(@)은 코드 사이에 특별한 의미, 기능을 수행하도록 하는 기술**</mark></br>

어노테이션은 메타데이터의 한 형태로, 컴파일 타임, 로드 타임, 런타임에 해석될 수 있다. 왜냐하면 어노테이션은 프로그램 동작에 직접적인 영향을 주지 않으면서, 코드에 대한 데이터 제공, 코드를 어떻게 사용할지에 대한 지침을 제공하기 때문이다.

아래는 하나의 Annotation을 사용하는 예이다.

```java
@RestController
public class TestController {

    @GetMapping("/test")
    public String testGet(@RequestParam String name, @RequestParam String id){
        return name +": "+ id;
    }
}

```

여기서 @가 붙은 친구들이 전부 어노테이션이다. 

</br>


## 1️⃣ Annotation 용도

1. 컴파일러에게 코드 작성 문법 에러를 체크하도록 정보 제공
2. 소프트웨어 개발 tool이나 배치시 코드를 자동으로 생성할 수 있도록 정보 제공
3. 실행 시, 특정 기능을 실행하도록 정보를 제공

</br>

## 2️⃣ Annotation 사용 순서
1. Annotation 정의
2. 클래스에 Annotation 어노테이션을 배치
3. 코드가 실행되는 중에 [Reflaction](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/java/%EB%A6%AC%ED%94%8C%EB%A0%89%EC%85%98.md)을 이용하여 추가 정보를 획득하여 기능 실시 

</br>

## 3️⃣ Spring에서 주로 사용하는 Annotation


* <code>@Configuration</code> : Spring IoC Container에게 해당 클래스가 Bean 구성 Class임을 알려주는 어노테이션
* <code>@Component</code> : 개발자가 직접 작성한 Class를 Bean으로 등록하기 위한 어노테이션
* <code>@Autowired</code> : 속성(field), setter method, constructor(생성자)에서 사용하며 Type에 따라 알아서 Bean을 주입
* <code>@Controller</code> : Spring MVC에서 Controller클래스에 쓰임
* <code>@Service</code> : Service class에서 쓰이는 어노테이션으로, 비즈니스 로직을 수행하는 Class라는 것을 나타내는 용도
* <code>@Repository</code> : DAO class에서 쓰이는 어노테이션(DB에 접근하는 method를 가지고 있는 class에서 사용) 

</br> 

이 외에도 다양한 Annotation이 있는데 [사이트](https://docs.spring.io/spring-framework/reference/testing/annotations.html)를 참고하자
