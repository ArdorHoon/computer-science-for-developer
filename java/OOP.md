# 객체 지향 프로그래밍(Object Oriented Programming)

객체 지향 프로그래밍(Object-Oriented Programming, OOP)은 컴퓨터 프로그래밍의 패러다임 중 하나로, 프로그램을 객체들의 집합으로 모델링하여 개발하는 방법론</br>

<mark>객체 지향의 핵심은 적절한 책임을 수행하는 역할 간의 유연하고 견고한 협력 관계를 구축하는 것</mark>


</br>


## OOP의 핵심 객체와 클래스
- 객체 : 클래스의 인스턴스 / 속성(Field)과 행위(Method)로 구성되어 있음
- 클래스 : 객체에 대한 템플릿


</br>

## OOP의 4가지 주요 개념

### 캡슐화(Encapsulation)

<mark>객체의 속성(Field)과 행위(Method)를 하나로 묶고, 외부로 부터 내부를 감싸 숨기는 것</mark></br>

보통 외부의 잘못된 접근을 막기 위해 클래스 내의 변수나 함수를 감추거나 드러내는 은닉성을 가지고 있다. 

```java
public class Car {
	private String model;
	private int speed;
	
	
	public void setModel(String model) {
		this.model = model;
	}
	
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	public void getModel() {
		return model;
	 }
	
	public void getSpeed() {
		return speed;
	 }

}
public class Main {
	public static void main(String[] args) {
		Car car = new Car();
		car.setModel("Kia");
		car.setSpeed(200);

		System.out.println("모델 :" +student.getModel());
		System.out.println("속도 :" +student.getSpeed());
	}
}

```

차의 변수에 직접 접근을 못하도록 변수에 private 접근 제한자를 사용하였고 method를 통해 get/set을 할 수 있게 캡슐화 하였다. 


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
<mark>**어떤 객체의 속성이나 기능이 상황에 따라 여러 가지 형태를 가질 수 있는 성질**</mark></br>

다형성의 대표적인 예로 Overloading과 Overriding이 있다. 

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
- 코드의 재사용성, 확장성, 유지보수성을 향상
- 개발자가 보다 직관적으로 프로그램을 이해하고 설계 가능
- 개발 시간과 비용을 절약, 특히 대규모 소프트웨어 개발 프로젝트에 유용

</br>

## OOP의 단점
- 실행 속도가 절차지향보다 상대적으로 느림
- 설계 시, 많은 시간과 노력이 필요

</br>
