# 객체 지향 프로그래밍(Object Oriented Programming)

<mark>객체 지향의 핵심은 적절한 책임을 수행하는 역할 간의 유연하고 견고한 협력 관계를 구축하는 것</mark>


## OOP의 핵심 객체와 클래스
- 객체 : 클래스의 인스턴스 / 속성(Field)과 행위(Method)로 구성되어 있음
- 클래스 : 객체에 대한 템플릿


</br>

## OOP의 4가지 주요 개념

### 캡슐화(Encapsulation)



</br>




### 상속(Inheritance)
하나의 클래스가 부모클래스의 속성과 핻동을 얻게 되는 방법

```java

public class Vehicle {

    public void moveForward(){
          System.out.println("이동 수단이 앞으로 갑니다.");
    }
}


public class Car extends Vehicle {

}


public class main {
	public void main(String[]args){
		Vehicle vehicle=new Vehicle();
		Car car=new Car();

		vehicle.print();     // 결과 : 이동 수단이 앞으로 갑니다.
		Car.print();     // 결과 : 이동 수단이 앞으로 갑니다.
	}
}


```

</br>

### 다형성(Polymorphism)
<mark>**어떤 객체의 속성이나 기능이 상황에 따라 여러 가지 형태를 가질 수 있는 성질**</mark>

#### Overloading (오버로딩)
같은 이름의 메소드가 매개변수의 타입, 개수, 순서 등의 차이로 인해 다른 동작을 수행할 수 있도록 할 수 있다.

```java

public int add(int a, int b){
  return a+b;
}


public int add(int a, int b), int c{
  return a+b+c;
}

```

#### Overriding (오버라이딩)
부모 클래스에서 정의된 메소드를 자식 클래스에서 재정의 하여 사용하는 것

```java

public class Vehicle {

    public void moveForward(){
          System.out.println("이동 수단이 앞으로 갑니다.");
    }
}


public class Car extends Vehicle {

    @Override
    public void moveForward(){
          System.out.println("자동차가 앞으로 갑니다.");
    }
}

```


</br>


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

</br>


## OOP의 장점

