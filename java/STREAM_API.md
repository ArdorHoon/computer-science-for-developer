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


### 원본의 데이터를 변경하지 않는다. 



### 일회용이다.




### 내부 반복으로 작업을 처리한다. 





