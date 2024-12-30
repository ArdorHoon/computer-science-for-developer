# 디자인 패턴

<mark>**"기존 환경 내에서 반복적으로 일어나는 문제들을 어떻게 풀어나갈 것인가?"에 대한 일종의 솔루션**</mark>

디자인 패턴은 디자인 패턴의 교과서인 [GoF의 디자인패턴]에서는  <code>**생성 패턴**</code>, <code>**구조 패턴**</code>, <code>**핻동 패턴**</code> 3가지로 구분하고 있다. 


</br>


## 1️⃣ Adapter Pattern

<mark>**어댑터 패턴은 서로 호환되지 않는 인터페이스를 가진 객체들이 서로 협업할 수 있도록 하는 구조적 디자인 패턴**</mark>

### 🏷️ 문제

이미 구축된 것을 어떠한 새로운 것을 사용할 때 양 쪽 간의 호환성을 유지해 주기 위해 사용한다. 예를 들어 기존 시스템에 타사의 새로운 라이브러리를 통합하여 시스템을 개선하려고 한다. 기존 시스템은 XML 형식으로 데이터를 처리하는 반면, 새로운 라이브러리는 JSON 형태로 데이터를 처리한다. 이 간극으로 인해 라이브러리를 있는 그대로 사용할 수 없다.

</br>

### 🏷️ 해법 및 구현
이 때 시스템과 라이브러리 사이에 XML과 JSON을 서로 변환시켜주는 어댑터가 필요하게 된다. 어댑터 패턴 구조는 크게 2가지로 나누어 진다.
</br>

#### ♦️ 객체 어댑터 (Object Adaptor)

* 합성(Composition)된 맴버에게 위임을 이용한 어댑터 패턴
* 위임 : 자기가 해야 할 일을 클래스 맴버 객체의 메소드에게 다시 시킴으로써 목적을 달성하는 것
* 합성을 활용하기ㅣ 때문에 런타임 중에 Adaptee가 결정되어 유연
* 그러나 Adaptee 객체를 필드 변수로 저장해야하기 때문에 공간 차지 비용 든다.

</br>

<p align="center">
<img src="https://github.com/user-attachments/assets/97108023-92ab-41df-9c28-94516a0a0fbc" width="70%" height="70%">
</p></br>



1. Adaptee(Service) : 어댑터 대상 객체, 기존 시스템/ 외부 시스템/ 써드파티 라이브러리
2. Target(Client Inteface) : Adapter가 구현하는 인터페이스
3. Adapter : Client와 Adaptee 중간에서 호환성이 없는 둘을 연결시켜주는 역할을 담당(핵심)
4. Client : 기존 시스템을 어댑터를 통해 이용하려는 쪽, Client interface를 통하여 Service 이용

</br>

```java

// Adaptee : 클라이언트에서 사용하고 싶은 기존의 서비스 (하지만 호환이 안되서 바로 사용 불가능)
class NewService{
    void specificMethod(int specialData){
        System.out.println("Call Client Service Feature + " + specialData);
    }
}


// Client Interface : 클라이언트가 접근해서 사용할 고수준의 어댑터 모듈
interface Target {
    void method(int data);
}

// Adapter : Adaptee 서비스를 클라이언트에서 사용하게 할 수 있도록 호환 처리 해주는 어댑터
class Adapter implements  Target{

    NewService adaptee; // 합성(composition)으로 Service 객체를 class field로

    // 어댑터가 인스턴스화되면 호환시킬 기존 서비스를 설정
    Adapter(NewService adaptee){
        this.adaptee = adaptee;
    }

    // 어댑터 메서드 호출되면, adaptee 메소드 호출 
    @Override
    public void method(int data) {
        adaptee.specificMethod(data);
    }
}

```
</br>

```java

class Client {
    public static void main(String[] args) {
        //어댑터 생성
        Target adapter = new Adapter(new Service());

        //Client Interface의 스펙에 따라 메소드를 실행하면 기존 서비스의 메소드가 실행
        adapter.method(100);
    }
}

```
</br>

#### ♦️ 클래스 어댑터 (Class Adaptor)

* 클래스 상속을 이용한 어댑터 패턴
* Adaptee를 상속했기 때문에 따로 객체 구현 없이 바로 코드 재사용 가능
* 상속은 대표적으로 구현된 코드를 재사용하는 방식이지만, 자바에서는 다중 상속 불가 문제 때문에 전반적으로 권장하지 않는 방법

</br>

<p align="center">
<img src="https://github.com/user-attachments/assets/e98ea4bb-ea07-4166-b78f-2fd0ac55cc00" width="70%" height="70%">
</p></br>


1. Adaptee(Service) : 어댑터 대상 객체, 기존 시스템/ 외부 시스템/ 써드파티 라이브러리
2. Target(Client Inteface) : Adapter가 구현하는 인터페이스
3. Adapter : Client와 Adaptee 중간에서 호환성이 없는 둘을 연결시켜주는 역할을 담당(핵심)
4. Client : 기존 시스템을 어댑터를 통해 이용하려는 쪽, Client interface를 통하여 Service 이용

</br>

```java

// Adaptee : 클라이언트에서 사용하고 싶은 기존의 서비스 (하지만 호환이 안되서 바로 사용 불가능)
class NewService{
    void specificMethod(int specialData){
        System.out.println("Call Client Service Feature + " + specialData);
    }
}


// Client Interface : 클라이언트가 접근해서 사용할 고수준의 어댑터 모듈
interface Target {
    void method(int data);
}

// Adapter : Adaptee 서비스를 클라이언트에서 사용하게 할 수 있도록 호환 처리 해주는 어댑터
class Adapter extends NewService implements  Target{

    // 어댑터의 메소드가 호출되면, 부모 클래스 Adaptee의 메소드를 호출
    public void method(int data) {
        adaptee.specificMethod(data);
    }
}

```

</br>


```java

class Client {
    public static void main(String[] args) {
        //어댑터 생성
        Target adapter = new Adapter();

        //인터페이스의 스펙에 따라 메소드를 실행하면 기존 서비스의 메소드가 실행
        adapter.method(100);
    }
}

```

</br>

## 2️⃣ Command Pattern

<mark>**커맨드 패턴은 이벤트가 발생했을 때 실행될 기능이 다양하면서도 변경이 필요한 경우에 이벤트를 발생시키는 클래스를 변경하지 않고 재사용하고자 할 때 유용한 디자인 패턴**</mark>

### 🏷️ 문제

눌리면 특정 기능을 수행하는 버튼이 있다고 하자. 이걸 클래스 다이어그램으로 표현하면 아래와 같다.

<p align="center">
<img src="https://github.com/user-attachments/assets/5b45377d-32fc-4b18-951a-f9558743041c" width="70%" height="70%">
</p></br>

```java
//Lamp 클래스
public class Lamp{
    public void turnOn(){
        System.out.println("Lamp On!");
    }
}

//Button 클래스
public class Button{
    private Lamp theLamp;

    public Button(Lamp theLamp){
        this.theLamp = theLamp;
    }

    public void pressed(){
        theLamp.turnOn();
    }
}

//Main 클래스
public class Main{
    public static void main(String[] args){
        Lamp lamp = new Lamp();
        Button lampButton = new Button(lamp);
        lampButton.pressed();
    }    
}

```


하지만 다음과 같은 요구 사항이 발생했을 때는 일반적인 방식으로 해결하려고 하면 문제가 생긴다.

* 누군가 버튼을 눌렀을 때 램프가 켜지는 대신 다른 기능을 실행하게 되려면 어떤 변경 작업을 해야 하는가? => 기존 Button클래스의 pressed 메서드 전체를 수정하는 것은 OCP에 위배
* 버튼을 누르는 동작에 따라 다른 기능을 실행하게 하려면 어떤 변경 작업을 해야 하는가? => 다른 기능이 추가 될 때마다 Button클래스의 코드가 수정되어야 함

이를 해결하기 위해 우리는 **Command Pattern**을 사용할 수 있다. 

</br>

### 🏷️ 해법 및 구현

커맨드 패턴의 아래와 같이 구성되어 있다. (위의 예제와 함께 묶어서 생각해보자)

<p align="center">
<img src="https://github.com/user-attachments/assets/153cbb5f-46cc-4abe-a43f-38a8b87b344e" width="70%" height="70%">
</p></br>

* Command : 실행될 기능에 대한 인터페이스, 실행될 기능을 execute 메서드로 선언
* ConcreteCommand : 실제로 실행되는 기능을 구현, 즉 Command라는 인터페이스를 구현
* Invoker : 기능의 실행을 요청하는 호출자 클래스
* Receiver : ConcreteCommand에서 execute 메서드를 구현할 때 필요한 클래스, 즉 ConcreteCommand의 기능을 실행하기 위해 사용하는 수신자 클래스

</br>

이제 커맨드 패턴을 위의 만능 버튼 예제에 적용하면 아래와 같다.

<p align="center">
<img src="https://github.com/user-attachments/assets/71b1c926-eb11-4299-bcd4-c91b70d37257" width="70%" height="70%">
</p></br>

이를 코드로 표현하면 다음과 같다.

```java
//Command 인터페이스 
interface Command{
    public abstract void execute();
}

//램프 on command 클래스
class LampOnCommand implements Command{

    private Lamp theLamp;

    LampOnCommand(Lamp theLamp){
        this.theLamp = theLamp;
    }

    @Override
    public void execute() {
        theLamp.turnOn();
    }
}

//램프 off command 클래스
class LampOffCommand implements Command{

    private Lamp theLamp;

    LampOffCommand(Lamp theLamp){
        this.theLamp = theLamp;
    }

    @Override
    public void execute() {
        theLamp.turnOff();
    }
}



//Lamp 클래스
class Lamp{
    public void turnOn(){
        System.out.println("Lamp On!");
    }

    public void turnOff(){
        System.out.println("Lamp Off!");
    }
}

//Button 클래스
class Button{
    private Command command;

    public Button(Command command){
        setCommand(command);
    }

    public void setCommand(Command command){
        this.command = command;
    }

    public void pressed(){
        command.execute();
    }
}

//실행 함수
public class Main {

    public static void main(String[] args) {
        Lamp lamp = new Lamp();
        Command lampOnCommand = new LampOnCommand(lamp);
        Command lampOffCommand =  new LampOffCommand(lamp);

        Button button = new Button(lampOnCommand);
        //lamp on
        button.pressed();

        button.setCommand(lampOffCommand);

        //lamp off
        button.pressed();
    }
}

```

</br>

## 3️⃣ Decorator Pattern
<mark>**기본 기능에 추가할 수 있는 기능의 종류가 많은 경우에 각 추가 기능을 Decorator 클래스를 정의한 후에 필요한 Decorator 객체를 조합함으로써 추가 기능의 조합을 설계하는 방식**</mark>


### 🏷️ 문제
내비게이션 SW에서 도로를 표시하는 기능이 있다고 하자. 가장 기본적인 기능은 도로를 간단한 선으로 표시하는 것(RoadDisplay)이다. 그리고 내비게이션 SW에 따라 도로의 차선을 표시하는 기능(RoadDisplayWithLane)도 제공한다.   

여기서 RoadDisplayWithLane 클래스 역시 도로 표시 기능을 제공하므로 RoadDisplay 클래스의 하위 클래스로 설계한다. 

이를 클래스 다이어그램으로 나타내면 아래와 같다.


<p align="center">
<img src="https://github.com/user-attachments/assets/def2b346-bcbe-4bb3-a055-c55a8058f4ea" width="20%" height="20%">
</p></br>



하지만 여기서 아래와 같은 추가 기능을 확장할 때 문제점이 발생할 수 있다.

* 또다른 도로 표시 기능을 추가하고 싶다면 어떻게 해야 하는가? => 예) 기본 도로 표시 + 교통량 표시 기능
* 여러 가지 추가 기능을 조합해 제공하고 싶다면 어떻게 해야 하는가? => 예) 기본 도로 표시 + 차선 표시 기능 + 교통량 표시 기능

일반적으로 상속으로 구현할 수 있지만 이는 기능이 더해질수록 조합 수가 무한정 늘어난다. 이는 나중에 유지보수 관리가 어려울 수 있다. (<code>RoadDisplayWithTrafficCrossing</code>, <code>RoadDisplayWithCrossing</code>, <code>RoadDisplayWithLane</code>, <code>RoadDisplayWithLaneCrossing</code> 등등)

</br>

### 🏷️ 해법 및 구현
데코레이터 패턴을 이용하면 필요한 추가 기능의 조합을 런타임에서 동적으로 생성할 수 있다. 데코레이터할 대상 객체를 새로운 행동들을 포함한 특수 장식자 객체에 넣어서 행동들을 해당 장식자 객체마다 연결시켜, 서브클래스로 구성할때 보다 훨씬 유연하게 기능을 확장할 수 있다. 

데코레이터 패턴 구조는 아래와 같다. 
</br>

<p align="center">
<img src="https://github.com/user-attachments/assets/e5eaaf26-2eea-4248-baba-5b4d2ada5507" width="70%" height="70%">
</p></br>

* Component : 기본 기능을 뜻하는 ConcreteComponent와 추가 기능을 뜻하는 Decorator의 공통 기능을 정의. 즉 클라이언트는 Component를 통해 실제 객체를 사용
* ConcreteComponent : 기본 기능을 구현하는 클래스
* Decorator : 많은 수가 존재하는 구체적인 Decorator의 공통 기능을 제공
* ConcreteDecoratorA, ConcreteDecoratorB : Decorator의 하위 클래스로 기본 기능에 추가되는 개별적인 기능을 뜻함

</br>

이를 도로 표시 예제에 적용하면 아래와 같다. 

<p align="center">
<img src="https://github.com/user-attachments/assets/ba436fa7-a87d-404f-9326-d39c3821a32b" width="70%" height="70%">
</p></br>

이를 코드로 나타내면 아래와 같다. 

```java

abstract class Display{
    public abstract void draw();
}

//기본 기능 표시 클래스
class RoadDisplay extends Display{

    @Override
    public void draw() {
        System.out.println("기본 도로 표시");
    }
}

//다양한 추가 기능에 대한 공통 클래스
abstract class DisplayDecorator extends Display{
    private Display decoratedDisplay;

    public DisplayDecorator(Display decoratedDisplay){
        this.decoratedDisplay = decoratedDisplay;
    }

    @Override
    public void draw() {
        decoratedDisplay.draw();
    }
}


//교통량 기능 추가하는 클래스
class TrafficDecorator extends DisplayDecorator{
    public TrafficDecorator(Display decoratedDisplay){
        super(decoratedDisplay);
    }

    public void draw(){
        super.draw();
        drawTraffic();
    }

    private void drawTraffic(){
        System.out.println("\t교통량 표시");
    }

}

//차선 표시를 추가하는 클래스
class LaneDecorator extends DisplayDecorator{
    public LaneDecorator(Display decoratedDisplay){
        super(decoratedDisplay);
    }

    public void draw(){
        super.draw();
        drawLane();
    }

    private void drawLane(){
        System.out.println("\t차선 표시");
    }

}

```
</br>

이를 Main에서 사용하면 아래와 같이 사용할 수 있다. 

```java
public class Main {

    public static void main(String[] args) {
        Display road = new RoadDisplay();
        road.draw(); // 기본 도로 표시

        Display roadWithLane = new LaneDecorator(new RoadDisplay());
        roadWithLane.draw(); // 기본 도로 표시 + 차선 표시

        Display roadWithTraffic = new TrafficDecorator(new RoadDisplay());
        roadWithTraffic.draw(); // 기본 도로 표시 + 차선 표시

        Display roadWithLandAndTraffic = new TrafficDecorator(new LaneDecorator(new RoadDisplay()));
        roadWithLandAndTraffic.draw();
    }
}

/* RESULT
기본 도로 표시
기본 도로 표시
	차선 표시
기본 도로 표시
	교통량 표시
기본 도로 표시
	차선 표시
	교통량 표시
*/

```

</br>

## 4️⃣ Facade Pattern
<mark>**퍼싸드 패턴은 복잡한 클래스 라이브러리에 대해 사용하기 편하게 간편한 인터페이스(API)를 구성하기 위한 구조 패턴**</mark>

### 🏷️ 문제

정교한 라이브러리나 프레임워크에 속하는 광범위한 객체들의 집합으로 당신의 코드를 작동하게 만들어야한다고 할 때, 일반적으로 당신은 이러한 객체들을 모두 초기화하고, 종속성 관계들을 추적하고, 올바른 순서로 메서드들을 실행하는 등 작업을 수행해야 한다.

하지만 그 결과, **당신의 클래스들의 비즈니스 로직이 타사 클래스들의 구현 세부 사항들과 밀접하게 결합하여 코드를 이해하고 유지 관리하기 어려워진다.**

</br>

### 🏷 해법 및 구현 방법

퍼사드 패턴은 이러한 복잡하게 얽혀 있는 것들을 정리해서 사용하기 편한 인터페이스를 고객에게 제공한다고 보면 된다. 

그래서 고객은 라이브러리나 프레임워크의 복잡한 시스템을 알 필요없이 시스템의 외부에 대해서 단순한 인터페이스를 이용하기만 하면 된다. (퍼사드 클래스는 보통 싱글톤으로 구현)

퍼싸드 패턴 구조는 아래와 같다.

<p align="center">
<img src="https://github.com/user-attachments/assets/b4571ddb-3947-4e4f-a0ba-0f90e3acbe51" width="70%" height="70%">
</p></br>

* Facade : 서브시스템 기능을 편리하게 사용할 수 있도록 하기 위해 여러 시스템과 상호 작용하는 복잡한 로직을 재정리해서 높은 레벨의 인터페이스 구성
* Additioanl Facacde : 퍼사드 클래스는 반드시 한 개만 존재해야 한다는 규칙은 없다. 연관 되지 않은 기능이 있다면 얼마든지 추가적인 퍼사드를 구현한다.
* SubSystem(하위 시스템) : 수십 가지 라이브러리 혹은 클래스들
* Client : 서브 시스템에 직접 접근하는 대신 퍼사드 사용

</br>

아래의 4개의 라이브러리 클래스를 사용해서 개발자가 데이터베이스로부터 값을 가져오고 화면에 데이터를 파싱해서 출력하는 프로그램을 만들려고 할 때 해당 라이브러리 코드를
직접 메인에서 작성한다면 향후 수정, 확장 및 유지보수에 어려움이 있을 수 있다. 그리고 다른 개발자가 투입 시, 코드를 이해하기 어려울 수 있다. 

```java

// DBMS에 저장된 데이터를 나타내는 클래스
class Row{

}

// 데이터베이스 역할을 하는 클래스
class DBMS {

}

// DBMS에서 조회된 데이터를 임시로 담아두는 클래스 (속도 향상)
class Cache {

}

// Row 클래스를 보기좋게 출력하는 클래스
class Message {

}
```

하나의 클래스를 새로 만들어서 위 코드를 하나로 묶어서 단순화된 인터페이스를 통해 서브 클래스를 다루어 개발자의 실수를 줄이고자 하는 것이 퍼사드 패턴이다. 

예시로 아래와 같이 구현할 수 있다.

```java
//퍼사드 클래스
class Facade {
    private DBMS dbms = new DBMS();
    private Cache cache = new Cache();

    public void insert() {
         //DB에 삽입
    }

    public void run(String name) {
        Row row = cache.get(name);

        // 1. 만약 캐시에 없다면 DB에 해당 데이터 조회해서 row에 저장, 있다면 캐시에 저장

        // 2. dbms.query(name)에서 조회된 값이 있으면
       
        // 3. 조회된 값이 없으면
   
    }
}

//개발자는 아래와 같이 구현
class Main {
    public static void main(String[] args) {

        // 1. 퍼사드 객체 생성
        Facade facade = new Facade();

        // 2. db 값 insert
        facade.insert();

        // 3. 퍼사드로 데이터베이스 & 캐싱 & 메세징 로직을 한번에 조회
        String name = "Hoon";
        facade.run(name);
    }
}

```

하지만 주의해야할 것은 퍼사드를 구현할때 인터페이스를 적게 구성해야 한다. 많이 구성한다면 퍼사드 패턴의 의미가 없어진다. 

</br>

## 5️⃣ Factory method Pattern

<mark>**팩토리 메서드 패턴은 객체의 생성 코드를 별도의 클래스/메서드로 분리함으로써 객체 생성의 변화에 대비하는데 유용한 디자인 패턴**<mark>

### 🏷️ 문제

여러 대의 엘리베이터가 있고 각 엘리베이터는 ElevatorController가 책임을 진다. 이를 ElevatorManager 클래스가 엘리베이터를 스케줄링하고 이동 요청을 처리한다. 그리고 스케줄링을 위해 ThroughputScheduler 객체를 갖는다. ThroughputScheduler는 작업 처리량에 따라 엘리베이터를 스케줄링해주는 객체이다. 이를 클래스 다이어그램으로 나타내면 아래와 같다.


<p align="center">
<img src="https://github.com/user-attachments/assets/a4e06291-6883-45a0-81b1-5af4970816cb" width="70%" height="70%">
</p></br>

```java
class ElevatorManager{
    private List<ElevatorController> controllers;
    private ThroughputScheduler scheduler;
    
    public ElevatorManager(int controllerCount){
        controllers = new ArrayList<>(controllerCount);
        
        for(int i = 0 ; i< controllerCount; i++){
            ElevatorController controller = new ElevatorController(i);
            controllers.add(controller);
        }
        
        //스케줄러 생성
        scheduler = new ThroughputScheduler();
    }
    
    void requestElevator(int destination, Direction direction){
        
        //스케줄러 통해서 엘리베이터 선택
        int selectedElevator = scheduler.selectElevator(this, destination, direction);
        
        // 선택한 엘리베이터 이동
        controllers.get(selectedElevator).gotoFloor(destination);
    }
    
}

class ElevatorController{
    private int id;
    private int curFloor;
    
    public ElevatorController(int id){
        this.id = id;
        curFloor = 1;
    }
    
    public void gotoFloor(int destination){
        System.out.println("Elevator [" + id + "] Floor : " + curFloor);
        
        curFloor = destination;
        System.out.println("==>" + curFloor);

    }
}

class ThroughputScheduler{
    public int selectElevator(ElevatorManager manager, int destination, Direction direction){
        //임의 선택
        return 0;
    }
}

//임시 값 
class Direction{
    
}

```

하지만 해당 구조에서 크게 2가지 요구사항이 발생했을 때 문제가 생길 수 있다.

1. 만약 작업 처리량 스케줄링이 아닌 다른 스케줄링을 사용해야 할 경우
2. 프로그램 실행 중에 스케줄링 전략을 변경해야 하는 경우 (동적 스케줄링 지원이 필요한 경우)

우선 스트래티지 패턴을 통해서 시간에 따라 <code>requestElevator()</code>를 아래와 같이 변경할 수 있다.
```java
    void requestElevator(int destination, Direction direction){

        int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        
        if (hour < 12){
            scheduler = new ResponseTimeScheduler();
        }else{
            scheduler = new ThroughputScheduler();
        }
        
        //스케줄러 통해서 엘리베이터 선택
        int selectedElevator = scheduler.selectElevator(this, destination, direction);
        controllers.get(selectedElevator).gotoFloor(destination);
    }

```

이는 ElevatorScheculer라는 인터페이스를 만들고 이를 implements를 받아서 ThroughputScheduler와 ResponseTimeScheduler를 구현해서 적용했다.
엘리베이터 스케줄링 전략이 변경될 때마다 requestElevator 메서드도 수정이 되어야 한다. 하지만 requestElevator 메서드는 엘리베이터 선택과 선택된 엘리베이터를 이동시키는 근본 책임이다. 즉 전략이 변경에 따라 해당 메서드가 변경되는 것은 바람직하지 않다. 

</br>

### 🏷️ 해법 및 구현

주어진 기능을 실제로 제공하는 적절한 클래스 생성 작업을 별도의 클래스 / 메서드로 분리시키는 편이 좋다. 예를 들어 엘리베이터 스케줄링 전략에 일치하는 클래스를 생성하는 코드를 requestElevator 메서드에서 분리해 별도의 클래스/메서드를 정의하면 된다.

```java

pubic enum SchedulingStrategyID { RESPONSE_TIME, THROUGHPUT }

public class SchedulerFactory{

    public static ElevatorScheduler getScheduer(SchedulingStrategyID startegyID){
        ElevatorScheduler scheduler = null;
        switch(stratgeyID){
            case RESPONSE_TIME:
                //전략 객체는 싱글 인스턴스로 동작하기 위해 싱글턴 패턴 적용 
                scheduler = ResponseTimeScheduler.getInstance(); 
                break;
            case THROUGHPUT:
                scheduler = ThroughputScheduler.getInstance();
                break;
        }

        return scheduler;
    }
}

//위의 Factory 클래스를 통해 전략 선택 (in ElevatorManager.java)

private SchedulingStrategyID strategyID; // 생성자에서 선택

void requestElevator(int destination, Direction direction){
    //주어진 전략 ID에 해당되는 ElevatorScheduler를 사용
    ElevatorScheduer scheduler = SchedulerFactory.getScheduler(strategyID);
    
    //스케줄러 통해서 엘리베이터 선택
    int selectedElevator = scheduler.selectElevator(this, destination, direction);
    controllers.get(selectedElevator).gotoFloor(destination);
}

```

하지만 위와 같이 스케줄링을 선택하는 SchedulerFactory 클래스를 만들어서 ThroughputScheduler 객체나 ResponseTimeScheduler 객체를 생성할 수 있지만 ElevatorManager클래스의 하위 클래스로 정의할 수 있다. 
(<code>**ElevatorManagerWithThroughputSchedulingr**</code>, <code>**ElevatorManagerWithResponseTimeScheduling**</code>, <code>**ElevatorManagerWithDynamicScheduling**</code>)

이를 코드로 구현하면 아래와 같다. 

```java
interface ElevatorScheduler{
    public int selectElevator(ElevatorManager manager, int destination, Direction direction);
}

//ElevatorManager
abstract class ElevatorManager{
    private List<ElevatorController> controllers;


    public ElevatorManager(int controllerCount){
        controllers = new ArrayList<>(controllerCount);

        for(int i = 0 ; i< controllerCount; i++){
            ElevatorController controller = new ElevatorController(i);
            controllers.add(controller);
        }
    }

    protected abstract ElevatorScheduler getScheduler();

    void requestElevator(int destination, Direction direction){

        ElevatorScheduler scheduler = getScheduler();
        //스케줄러 통해서 엘리베이터 선택
        int selectedElevator = scheduler.selectElevator(this, destination, direction);
        controllers.get(selectedElevator).gotoFloor(destination);
    }

}

class ElevatorController{
    private int id;
    private int curFloor;

    public ElevatorController(int id){
        this.id = id;
        curFloor = 1;
    }

    public void gotoFloor(int destination){
        System.out.println("Elevator [" + id + "] Floor : " + curFloor);

        curFloor = destination;
        System.out.println("==>" + curFloor);

    }
}

//대기 시간 최소화 스케줄링
class ElevatorManagerWithResponseTimeScheduling extends ElevatorManager{

    ElevatorManagerWithResponseTimeScheduler(int controllerCount){
        super(controllerCount);
    }

    public int selectElevator(ElevatorManager manager, int destination, Direction direction){
        //임의 선택
        return 0;
    }

    @Override
    protected ElevatorScheduler getScheduler() {
        //싱글턴 패턴
        ElevatorScheduler scheduler = ResponseTimeScheduler.getInstance();
        return scheduler;
    }
}

//작업 처리량 스케줄링
class ElevatorManagerWithThroughputScheduling extends ElevatorManager {

    ElevatorManagerWithThroughputScheduler(int controllerCount){
        super(controllerCount);
    }

    public int selectElevator(ElevatorManager manager, int destination, Direction direction){
        //임의 선택
        return 0;
    }

    @Override
    protected ElevatorScheduler getScheduler() {
        //싱글턴 패턴
        ElevatorScheduler scheduler = ThroughputScheduler.getInstance();
        return scheduler;
    }
}

//동적 스케줄링!!
class ElevatorManagerWithDynamicScheduling extends ElevatorManager{

    ElevatorManagerWithDynamicScheduling(int controllerCount){
        super(controllerCount);
    }

    public int selectElevator(ElevatorManager manager, int destination, Direction direction){
        //임의 선택
        return 0;
    }

    @Override
    protected ElevatorScheduler getScheduler() {
        ElevatorScheduler scheduler = null;
        int hour = Calendar.getInstance().get(Calendar.HOUR_OF_DAY);
        
        if(hour < 12){
             scheduler = ThroughputScheduler.getInstance();
        }else{
             scheduler = ResponseTimeScheduler.getInstance();     
        }
       
        return scheduler;
    }
}

```




</br>

정리하면 팩토리 메서드 패턴을 다이어그램으로 표현하면 다음과 같다. 


<p align="center">
<img src="https://github.com/user-attachments/assets/569130a1-3146-453a-a699-11d5b4040c76" width="70%" height="70%">
</p></br>

* Product : 팩토리 메서드로 생성될 객체의 공통 인터페이스
* ConcreteProduct : 구체적으로 객체가 생성되는 클래스
* Creator : 팩토리 메서드를 갖는 클래스
* ConcreteCreator : 팩토리 메서드를 구현하는 클래스로 ConcreteProduct 객체를 생성 

</br>


위의 컬레보레이션과 맞게 예제를 적용해서 다이어그램을 그려보면 다음과 같다.

<p align="center">
<img src="https://github.com/user-attachments/assets/f8e45419-20ff-4835-b527-9767d9796502" width="90%" height="90%">
</p></br>



## 6️⃣ Singleton Pattern

<mark>**싱글턴 패턴은 인스턴스가 오직 하나만 생성하는 것을 보장하고 어디에서든 이 인스턴스를 접근할 수 있도록 하는 디자인 패턴**</mark>



<p align="center">
<img src="https://github.com/user-attachments/assets/ae61ad5d-4529-4ac3-87e0-491b340a4c28" width="40%" height="40%"></br>
</p>



Client는 getInstance()를 호출해서 해당 객체를 사용한다. Application에서 하나의 인스턴스가 유지되어야 할 때 해당 패턴을 사용한다. (예 : 로그인 객체, 장바구니 객체 등)

</br>

### 🏷️ 발생할 수 있는 문제

**만약 Printer 객체를 하나의 인스턴스를 유지하려고 아래의 코드를 구현했다고 했을때**, 하나의 문제점이 있다. 아래 코드에서 만약 두 개의 스레드가 경합 조건(race condition)을 일으킨다면 Printer 인스턴스가 1개 이상 생성되는 경우가 있다. 이는 하나의 프린터 객체를 유지하려고 했던 목적과 달라질 수 있다. 

```java
public class Printer {

    private static Printer printer = null;
    private Printer(){}


    public static Printer getPrinter(){
        if(printer == null)
            printer = new Printer();

        return printer;
    }

    public void print(Resource r){
        System.out.println(r.getText());

    }

}
```

<code>Thread.sleep(1)</code>을 이용해 스레드 실행을 고의적으로 1ms 동안 정지하도록 하여 테스트를 하면 서로 다른 Printer 인스턴스가 생성되는 것을 확인할 수 있다. 

```java

    public static Printer getPrinter(){
        if(printer == null){
          
            try{
              Thread.sleep(1);
            }catch(InterruptedException e){}

            printer = new Printer();
        }
        return printer;
    }

/**
3-thread print using Printer@4ea64ead.
5-thread print using Printer@6473c571.
4-thread print using Printer@e2fc46b.
2-thread print using Printer@14ab5bc5.
1-thread print using Printer@16ad880c.
**/


```

</br>

### 🏷️ 해법 및 구현 방법

위의 다중 스레드 Application에서 발생하는 문제를 해결하는 2가지 방법이 있다. 

* 정적 변수에 인스턴스를 만들어 바로 초기화하는 방법
* 인스턴스를 만드는 메스드에 동기화하는 방법

#### ♦️ 정적 변수에 인스턴스를 만들어 바로 초기화하는 방법 (Eager Initialization)

하지만 해당 방법은 static 멤버는 당장 객체를 사용하지 않더라도 메모리에 적재하기 때문에 만일 리소스가 큰 객체일 경우, 공간 자원 낭비가 발생한다.
추가적으로 예외 처리를 할 수 없다.


```java
public class Printer {

    private static final Printer printer = new Printer();
    private Printer(){}


    public  static Printer getPrinter(){
        return printer;
    }

    public void print(String r){
        System.out.println(r);

    }

}

/**
1-thread print using Printer@30f190e3.
2-thread print using Printer@30f190e3.
3-thread print using Printer@30f190e3.
4-thread print using Printer@30f190e3.
5-thread print using Printer@30f190e3.
**/

```

</br> 

#### ♦️ 인스턴스를 만드는 메스드에 동기화하는 방법 (Thread safe initialization)

Printer클래스의 객체를 얻는 <code>**getPrinter**</code> 메서드를 동기화하는 코드, 이를 통해 다중 스레드 환경에서 동시에 여러 스레드가 <code>**getPrinter**</code>메서드를 소유하는 객체에 접근하는 것을 방지

하지만 여러개의 모듈들이 매번 객체를 가져올 때 synchronized 메서드를 매번 호출하여 동기화 처리 작업에 **overhead**가 발생해 성능 하락이 발생한다. 


```java
public class Printer {

    private static Printer printer = null;
    private Printer(){}


    public synchronized static Printer getPrinter(){
        if(printer == null){
            printer = new Printer();
        }

        return printer;
    }

    public void print(String r){
        System.out.println(r);

    }

}

/**
3-thread print using Printer@431f3f8e.
1-thread print using Printer@431f3f8e.
4-thread print using Printer@431f3f8e.
2-thread print using Printer@431f3f8e.
5-thread print using Printer@431f3f8e.
**/

```


</br>

### 🏷️ 인터페이스로 구현하는 경우

정적 클래스를 사용해도 동일한 효과를 얻을 수 있지만 인터페이스를 구현하는 경우, 정적 메서드를 사용할 수 없기 때문에 아래와 같이 구현해야 한다.

```java
//Printer 인터페이스 
public interface Printer{
  public void print(String str);
}


//Printer 인터페이스를 가지고 구현한 V12Printer - 싱글턴 패턴
pulbic class V12Printer implements Printer{

  private static Printer printer = null;
  private V12Printer() {}

  public synchronized static Printer getPrinetr(){
    if(printer == null)
        printer = new V12Printer();

    return printer;
  }

  public void print(String str){
        //실제 프린터 하드웨어 조작하는 코드
  }
}


```

</br>


## 7️⃣ Strategy Pattern

<mark>**전략(일을 수행하는 방식, 문제를 해결하는 알고리즘, 비즈니스 규칙)을 쉽게 바꿀 수 있도록 해주는 디자인 패턴**</mark>

### 🏷️ 문제

2가지 로봇을 만들려고 하는데 이름은 atom과 태권 V다. 이 두 로봇은 공격 기능과 이동 기능이 있다. 아톰은 공격할 때 주먹만 사용하지만 하늘을 날 수 있고 태권 v는 미사일로 공격을 할 수 있지만 날아다니지는 못하고 걸을 수만 았다.

위의 내용을 클래스 다이어그램으로 나타내면 아래와 같다. 

<p align="center">
<img src="https://github.com/user-attachments/assets/aadf2252-e760-4f60-bf86-abdecca053a4" width="50%" height="50%">
</p></br>

여기서 우리는 아래의 요구 사항이 발생했을 때 어떻게 해결할 것인가?

* 기존 로봇의 공격 또는 이동 방법을 수정하려면 어떤 변경 작업을 해야 하는가? => 아톰을 걷게만 하고 태권 v를 날 수 있게 한다면
* 새로운 로봇을 만들어 기존의 공격 또는 이동 방법을 추가하거나 수정하려면? => 새로운 로봇이 태권 V의 미사일 공격 기능을 추가하려면?

새로운 기능으로 변경하려고 태권v와 아톰의 코드를 직접 수정하는 것은 OCP를 위배한다. 또한 동일한 기능을 실행하는 중복 코드도 발생할 수 있다. 

</br>

### 🏷️ 해법 및 구현 방법

위의 문제를 우리는 스트래티지 패턴을 통해서 해결할 수 있다. 우선적으로 전략이 될 만한 부분(변화된 것) 찾은 후에 이를 클래스로 캡슐화하여 해결할 수 있다. 

아래는 스트래티지 패턴의 구조이다. 

<p align="center">
<img src="https://github.com/user-attachments/assets/bf752324-e463-429a-8f22-e3ce62224689" width="70%" height="70%">
</p></br>

위 예제에서는 공격 기능과 이동 기능이 변한다는 것을 알 수 있기 때문에 이를 각각 인터페이스로 만들고 이들을 실제 실현한 클래스를 만들어주면 된다. 
아래는 예제에 스트래티지 패턴을 적용한 다이어그램이다. 

<p align="center">
<img src="https://github.com/user-attachments/assets/def5b2d0-e999-41ca-b377-52b4f3217bd9" width="70%" height="70%">
</p></br>

이제 이를 코드로 나타내면 아래와 같다. 

```java


```

</br>
