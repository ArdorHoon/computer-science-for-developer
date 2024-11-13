# Stream API

JAVA 8 부터 제공하는 JAVA를 이용해 함수형으로 프로그래밍할 수 있게 해주는 API이다. 사용하기 위해서는 **java.util.stream.Stream**를 import해주어야 한다. 

Stream API는 원본의 데이터 변경 없이 코드를 더욱 간략하게 작성할 수 있다. 하나의 예시를 보자

</br>

아래의 리스트를 정렬하여 출력해야 하는 상황이라고 가정하자

```java

        String[] fruitArr = {"Apple", "Melon", "Kiwi", "Grape"}
        List<String> fruitList = Arrays.asList(fruitArr);
```

</br>

일반적인 코드로 작성하면 아래와 같다.
```java

        //원본 데이터를 정렬
        Collections.sort(fruitList);

        for (String fruit : fruitList)
            System.out.println(fruit);
```
</br>

Stream을 이용하면 한 줄로 표현할 수 있다.
```java

        //별도의 Stream 객체를 생성
        Stream<String> fruitStream = fruitList.stream();

        //복사된 데이터를 정렬하여 출력
        fruitStream.sorted().forEach(System.out::println);

```

## Stream API 특징


### 1️⃣ 원본의 데이터를 변경하지 않는다. 

Stream 객체는 원본 데이터를 변경하지 않습니다. 단, 새로운 변수에 직접 할당한다면 해당 데이터는 조작한 데이터로 나오게 된다.

```java

        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape"});
        List<String> newFruitList = fruitList.stream().sorted().collect(Collectors.toList());

        System.out.println(fruitList); // result : [Melon, Apple, Kiwi, Grape]
        System.out.println(newFruitList); // result : [Apple, Grape, Kiwi, Melon]

```


그레서 보통 원본 데이터 변경 없이 원본 데이터에서 새로운 데이터를 만들어내야 할 때 많이 사용한다. 해당 방법을 통해 쉽게 새로운 데이터를 만들어 낼 수 있다. 


### 2️⃣ 일회용이다.




### 3️⃣ 내부 반복으로 작업을 처리한다. 



## 자주 사용하는 Stream API



### forEach



### filter



### map



