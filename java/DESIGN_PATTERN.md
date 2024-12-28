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


</br>

## 4️⃣ Facade Pattern


</br>

## 5️⃣ Factory method Pattern

<mark>**팩토리 메서드 패턴은 객체의 생성 코드를 별도의 클래스/메서드로 분리함으로써 객체 생성의 변화에 대비하는데 유용한 디자인 패턴**<mark>

### 🏷️ 문제

여러 대의 엘리베이터가 있고 각 엘리베이터는 ElevatorController가 책임을 진다. 이를 ElevatorManager 클래스가 엘리베이터를 스케줄링하고 이동 요청을 처리한다. 그리고 스케줄링을 위해 ThroughputScheduler 객체를 갖는다. ThroughputScheduler는 작업 처리량에 따라 엘리베이터를 스케줄링해주는 객체이다. 이를 클래스 다이어그램으로 나타내면 아래와 같다.

![ele drawio](https://github.com/user-attachments/assets/a4e06291-6883-45a0-81b1-5af4970816cb)

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


</br>
