# 디자인 패턴

<mark>**"기존 환경 내에서 반복적으로 일어나는 문제들을 어떻게 풀어나갈 것인가?"에 대한 일종의 솔루션**</mark>

디자인 패턴은 디자인 패턴의 교과서인 [GoF의 디자인패턴]에서는  <code>**생성 패턴**</code>, <code>**구조 패턴**</code>, <code>**핻동 패턴**</code> 3가지로 구분하고 있다. 


</br>


## Adapter Pattern

<정의>

### 문제


</br>

### 해법 및 구현


</br>

### 결과 



</br>


## Command Pattern


</br>

## Decorator Pattern


</br>

## Facade Pattern


</br>

## Factory method Pattern


</br>


## Singleton Pattern

<mark>**싱글턴 패턴은 인스턴스가 오직 하나만 생성하는 것을 보장하고 어디에서든 이 인스턴스를 접근할 수 있도록 하는 디자인 패턴**</mark>



<p align="center">
<img src="https://github.com/user-attachments/assets/ae61ad5d-4529-4ac3-87e0-491b340a4c28" width="40%" height="40%"></br>
</p>



Application에서 하나의 인스턴스가 유지되어야 할 때 해당 패턴을 사용한다. (예 : 로그인 객체, 장바구니 객체 등)

</br>

### 🏷️ 문제

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

### 🏷️ 해법 및 구현

위의 다중 스레드 Application에서 발생하는 문제를 해결하는 2가지 방법이 있다. 

* 정적 변수에 인스턴스를 만들어 바로 초기화하는 방법
* 인스턴스를 만드는 메스드에 동기화하는 방법

#### ♦️ 정적 변수에 인스턴스를 만들어 바로 초기화하는 방법

```java
public class Printer {

    private static Printer printer = new Printer();
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

#### ♦️ 인스턴스를 만드는 메스드에 동기화하는 방법

Printer클래스의 객체를 얻는 <code>**getPrinter**</code> 메서드를 동기화하는 코드, 이를 통해 다중 스레드 환경에서 동시에 여러 스레드가 <code>**getPrinter**</code>메서드를 소유하는 객체에 접근하는 것을 방지

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

### 🏷️ 결과 



</br>


## Strategy Pattern


</br>
