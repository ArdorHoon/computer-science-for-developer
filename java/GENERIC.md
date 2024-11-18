# 제네릭(Generics)

<mark>**클래스 내부에서 사용할 데이터 타입을 외부에서 지정하는 기법**</mark>

이를 통해 객체별로 다른 타입의 자료가 저장될 수 있다. Java Collection의 한 종류인 ArrayList의 선언을 보면 <code><></code>가 있는데 바로 이게 제네릭이다.

</br>


```java
ArrayList<String> strList = new ArrayList<>();
```

</br>

이렇게 제네릭은 배열의 타입을 지정하듯이 리스트 자료형 같은 Collection class나 method에서 사용할 내부 데이터 타입을 파라미터 주듯이 외부에서 지정하는 **타입을 변수화한 기능**이라고 생각하면 된다. 
