# 제네릭(Generics)

<mark>**클래스 내부에서 사용할 데이터 타입을 외부에서 지정하는 기법**</mark>

이를 통해 객체별로 다른 타입의 자료가 저장될 수 있다. Java Collection의 한 종류인 ArrayList의 선언을 보면 <code><></code>가 있는데 바로 이게 제네릭이다.

</br>


```java
ArrayList<String> strList = new ArrayList<>();
```

</br>

이렇게 제네릭은 배열의 타입을 지정하듯이 리스트 자료형 같은 Collection class나 method에서 사용할 내부 데이터 타입을 파라미터 주듯이 외부에서 지정하는 **타입을 변수화한 기능**이라고 생각하면 된다.<mark>(객체(object)에 타입을 지정해주는 것)</mark>

</br>

## 1️⃣ Generic 사용법

Generic은 <> 다이아몬드 연산자를 통해 사용한다. 

```java

List<T> // 여기서 T를 타입 매개변수라고 한다.

List<String> // 여기서 String은 매개변수화된 타입이라고 한다.

```

Generic에서는 <T> 부분에서 실행부에서 타입을 받아와 내부에서 T 타입으로 지정한 맴버들에게 전파하여 타입이 구체적으로 설정된다.
이를 **구체화(Specialization)** 라고 한다.


### ♦️ Generic Class 

```java
import java.util.ArrayList;
import java.util.List;

class Ball {}
class BaseBall extends Ball {}
class Soccerball extends Ball {}


class BallBox<T>{
    List<T> balls = new ArrayList<>();

    public void add (T ball){
        balls.add(ball);
    }

}


public class Main {
    public static void main(String[] args) {
        BallBox<Ball> box = new BallBox<>();

        box.add(new BaseBall());
        box.add(new Soccerball());

    }
}
```

</br>

### ♦️ Generic Interface
```java
interface Sample<T>{
    public void add(T t, int index);
    public T get(int index);
    
}

class Model<T> implements Sample<T>{

    private T[] array;
    
    @Override
    public void add(T t, int index) {
        array[index] = t;
    }

    @Override
    public T get(int index) {
        return array[index];
    }
}

```

</br>



### ♦️ Generic Method

- 일반 메서드 : 클래스의 타입 파라미터를 받아와 사용하는 메서드
- 제너릭 메서드 : 클래스의 타입과 상관없이 직접 타입을 설정해서 독립적으로 운용하는 메서드 

```java
class BallBox<T> {
	
    // 클래스의 타입 파라미터를 받아와 사용하는 (일반 메서드)
    public T addBall(T x, T y) {
        // ...
    }
    
    // 독립적으로 타입 할당 운영되는 제네릭 메서드 => 호출 시에 매개 타입을 지정하기에 static 가능 (제너릭 메서드)
    public static <T> T addBallStatic(T x, T y) {
        // 순서대로
        // <T>          T             T
        // genric type, return type, parameter type 
    }
}

```

</br>

일반적으로 제네릭은 아래 표의 타입들이 많이 쓰인다.

|타입|설명|
|----|---|
| T | Type|
|E|element|
|K|Key|
|V|value|
|N|number|
|S,U,V| 2번째, 3번째, 4번째에 선언된 타입|


</br>

## 2️⃣ Generic의 장점

1. 잘못된 타입이 들어올 수 있는 것을 Compile 단계에서 방지할 수 있다.
2. 클래스 외부에서 타입을 지정해주기 때문에 따로 타입을 체크하고 변환해줄 필요가 없다. (불필요한 캐스팅을 없애 성능 향상)
3. 비슷한 기능을 지원하는 경우 코드의 재사용성이 높아진다.


</br>

## 3️⃣ Generic의 주의사항

1. <mark>제네릭 타입의 객체는 생성 불가</mark>
    - new 연산자 뒤에 제네릭 타입 파라미터가 올 수가 없다. 
3. <mark>static 맴버에 제너릭 타입이 올 수 없음</mark>
    - static 맴버는 제너릭 객체가 생성되기 전에 이미 자료 타입이 정해져 있어야 하기 때문이다.
4. <mark>제네릭으로 배열 선언 주의점</mark>
    - 기본적으로 제네릭 클래스 자체를 배열로 만들 수는 없다.


</br>
