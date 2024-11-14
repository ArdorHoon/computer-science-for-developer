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



</br> 


## 3️⃣ Queue interface



</br> 


## 4️⃣ Set interface


</br>


## 5️⃣ Map interface


</br>
