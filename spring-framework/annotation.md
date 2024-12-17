# Annotation (어노테이션)

<mark>**사전적 의미로는 주석이라는 뜻이지만, 자바에서 Annotaion(@)은 코드 사이에 특별한 의미, 기능을 수행하도록 하는 기술**</mark>

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


## Annotation 용도

1. 컴파일러에게 코드 작성 문법 에러를 체크하도록 정보 제공
2. 소프트웨어 개발 tool이나 배치시 코드를 자동으로 생성할 수 있도록 정보 제공
3. 실행 시, 특정 기능을 실행하도록 정보를 제공

</br>

## Annotation 사용 순서
1. Annotation 정의
2. 클래스에 Annotation 어노테이션을 배치
3. 코드가 실행되는 중에 [Reflaction](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/java/%EB%A6%AC%ED%94%8C%EB%A0%89%EC%85%98.md)을 이용하여 추가 정보를 획득하여 기능 실시 

</br>

## Spring에서 주로 사용하는 Annotation
