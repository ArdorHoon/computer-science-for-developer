# 디자인 패턴

<mark>**"기존 환경 내에서 반복적으로 일어나는 문제들을 어떻게 풀어나갈 것인가?"에 대한 일종의 솔루션**</mark>

디자인 패턴은 디자인 패턴의 교과서인 [GoF의 디자인패턴]에서는  <code>**생성 패턴**</code>, <code>**구조 패턴**</code>, <code>**핻동 패턴**</code> 3가지로 구분하고 있다. 


</br>


## 1️⃣ Adapter Pattern

<mark>**어댑터 패턴은 서로 호환되지 않는 인터페이스를 가진 객체들이 서로 협업할 수 있도록 하는 구조적 디자인 패턴**</mark>

### 문제

이미 구축된 것을 어떠한 새로운 것을 사용할 때 양 쪽 간의 호환성을 유지해 주기 위해 사용한다. 예를 들어 기존 시스템에 타사의 새로운 라이브러리를 통합하여 시스템을 개선하려고 한다. 기존 시스템은 XML 형식으로 데이터를 처리하는 반면, 새로운 라이브러리는 JSON 형태로 데이터를 처리한다. 이 간극으로 인해 라이브러리를 있는 그대로 사용할 수 없다.

</br>

### 해법 및 구현
이 때 시스템과 라이브러리 사이에 XML과 JSON을 서로 변환시켜주는 어댑터가 필요하게 된다. 어댑터 패턴 구조는 크게 2가지로 나누어 진다.

</br>

#### 객체 어댑터 (Object Adaptor)

* 합성(Composition)된 맴버에게 위임을 이용한 어댑터 패턴
* 위임 : 자기가 해야 할 일을 클래스 맴버 객체의 메소드에게 다시 시킴으로써 목적을 달성하는 것
* 합성을 활용하기ㅣ 때문에 런타임 중에 Adaptee가 결정되어 유연
* 그러나 Adaptee 객체를 필드 변수로 저장해야하기 때문에 공간 차지 비용 든다.


1. Adaptee(Service) : 어댑터 대상 객체, 기존 시스템/ 외부 시스템/ 써드파티 라이브러리
2. Target(Client Inteface) : Adapter가 구현하는 인터페이스
3. Adapter : Client와 Adaptee 중간에서 호환성이 없는 둘을 연결시켜주는 역할을 담당(핵심)
4. Client : 기존 시스템을 어댑터를 통해 이용하려는 쪽, Client interface를 통하여 Service 이용

</br>

```java

// Adaptee : 클라이언트에서 사용하고 싶은 기존의 서비스 (하지만 호환이 안되서 바로 사용 불가능)
class Service {

    void specificMethod(int specialData) {
        System.out.println("기존 서비스 기능 호출 + " + specialData);
    }
}

// Client Interface : 클라이언트가 접근해서 사용할 고수준의 어댑터 모듈
interface Target {
    void method(int data);
}

// Adapter : Adaptee 서비스를 클라이언트에서 사용하게 할 수 있도록 호환 처리 해주는 어댑터
class Adapter extends Service implements Target {

    // 어댑터의 메소드가 호출되면, 부모 클래스 Adaptee의 메소드를 호출
    public void method(int data) {
        specificMethod(data);
    }
}

```
</br>

```java

class Client {
    public static void main(String[] args) {
        // 1. 어댑터 생성 (기존 서비스를 인자로 받아 호환 작업 처리)
        Target adapter = new Adapter(new Service());

        // 2. Client Interfac의 스펙에 따라 메소드를 실행하면 기존 서비스의 메소드가 실행된다.
        adapter.method(1);
    }
}

```

#### 객체 어댑터 (Object Adaptor)


</br>




## 2️⃣ Command Pattern


</br>

## 3️⃣ Decorator Pattern


</br>

## 4️⃣ Facade Pattern


</br>

## 5️⃣ Factory method Pattern


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
