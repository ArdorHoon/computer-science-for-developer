# 객체 지향 프로그래밍(Object Oriented Programming)

<mark>객체 지향의 핵심은 적절한 책임을 수행하는 역할 간의 유연하고 견고한 협력 관계를 구축하는 것</mark>


## 객체와 클래스
- 객체 : 클래스의 인스턴스 / 속성(Field)과 행위(Method)로 구성되어 있음
- 클래스 : 객체에 대한 템플릿


## OOP의 4가지 주요 개념

### 캡슐화(Encapsulation)


### 상속(Inheritance)



### 다형성(Polymorphism)


### 추상화(Abstraction)
<mark>**객체의 공통적인 속성과 기능을 추출하여 정의하는것**</mark>

예를 들어 자동차와 오토바이 등 다양한 이동 수단을 하나의 interface를 정의할 수 있다.

```java
public interface Vehicle{
  public abstract void start()
  public abstarct void moveForward()
  public abstract void moveBackward()
}

```

이를 통해서 우리는 자동차를 구현할 수 있다.

```java
public class Car implements Vehicle{

  @Override
  public void moveForward(){
    //필요 내용 작성 
  }


  @Override
  public void moveForward(){
    //필요 내용 작성
  }
}
```




## OOP의 장점

