# Collection Framework

<mark>**다수의 데이터를 쉽고 효과적으로 처리할 수 있는 표준화된 방법을 제공하는 클래스의 집합**</mark>

주로 java에서 자료 구조와 데이터를 처리할 때 사용한다고 생각하면 된다. Collection Framework 중 자주 사용하는 클래스들의 종류와 계층도는 아래와 같다.

</br>


<p align="center">
<img src="https://github.com/user-attachments/assets/45ba79ed-f613-41a3-9e1a-19d27f303032" width="70%" height="70%"></br>
</p>


</br> 


## 1️⃣ Collection interface

<code>List</code>, <code>Set</code>, <code>Queue</code>에 상속을하는 실질적인 최상위 컬렉션 타입

### 주요 메서드

- boolean add(Object o): 지정된 객체들을 Collection에 추가
- boolean addAll (Collcection c) : 지정된 Collection의 객체들을 Collection에 추가
- boolean remove(Object o) : 지정된 객체들을 Collection에서 삭제
- boolean removeAll (Collcection c) : 지정된 Collection의 객체들을 Collection에서 삭제
- boolean retainAll(Collection c) :  지정된 Collection에 포함된 객체만을 남기고 다른 객체들은 Collection에서 삭제
- boolean contains(Object o) : 지정된 객체가 Collection에 포함되어있는지 확인
- boolean containsAll(Collection c) : 지정된 Collection의 객체들이 Collection에 포함되어있는지 확인
- boolean equals(Object o) : 동일한 Collection인지 비교
- void clear() : Collection의 모든 객체를 삭제
- int size() : Collection에 저장된 객체의 개수를 반환
- boolean isEmpty() : Collection이 비어있는지 확인


</br> 


## 2️⃣ List interface

순서가 있는 저장공간

### 특징

- 저장 순서가 유지되는 collection을 구현하는데 사용
- 같은 요소의 중복 저장 허용
- 배열과 마찬가지로 index로 요소 접근
- 리스트와 배열의 가장 큰 차이는 동적으로 크기가 변하냐 변하지 않냐이다.
- 요소 사이에 빈공간을 허용하지 않아서 삽입, 삭제 시 배열이 이동함


### 주요 메서드
- Object get(int index) :지정된 위치(index)에 있는 객체를 반환
- Object remove(int index) : 지정된 위치(index)에 있는 객체를 삭제
- int indexOf(Object o) : 지정된 객체의 위치(index)를 반환

</br>

#### ArrayList

- 배열을 이용하여 만든 리스트
- 테이터의 저장순서가 유지되고 중복 허용
- 데이터량에 따라 capacity가 자동으로 늘어나거나 줄어듬
- 조회가 빠르다.
- 삽입, 삭제가 느리다. (단, 순차적으로 삽입, 삭제하는 경우에는 가장 빠르다.)

</br>

```java
        List<String> arrayList = new ArrayList<>();

        arrayList.add("one");
        arrayList.add("two");

        arrayList.get(0); // result : one
        arrayList.indexOf("one"); // result : 0

```


</br>

#### LinkedList

- 노드를 연결하여 리스트 처럼 만든 Collection
- 테이터의 중간 삽입, 삭제가 빈번할 경우 빠른 성능 보장
- 임의의 요소에 대한 접근 성능 좋지 않음

</br>

```java
        List<String> linkedList = new LinkedList<>();

        linkedList.add("one");
        linkedList.add("two");

        linkedList.get(0); // result : one
        linkedList.indexOf("one"); // result : 0
```

</br>

#### Vector

- ArrayList의 구형 버전
- ArrayList와 차이는 모든 메소드가 동기화 되어 있어 Thread-safe하다.

```java
        List<Integer> vector = new Vector<>();

        vector.add(10);
        vector.add(20);

        vector.get(0); // result : 10
        vector.indexOf(20); // result : 1
```


</br>

#### Stack 

- LIFO(Last-In-First-Out) 자료구조
- 들어올 때는 push, 나갈 때는 pop을 사용
- Stack은 Vector를 상속하기 때문에 문제점 많아 사용 안함, 대신 ArrayDeque 사용

```java

        Stack<Integer> stack = new Stack<>();

        stack.push(1);
        stack.push(2);

        stack.pop(); // 2
        stack.pop(); // 1

```


</br> 


## 3️⃣ Queue interface



</br> 


## 4️⃣ Set interface


</br>


## 5️⃣ Map interface


</br>
