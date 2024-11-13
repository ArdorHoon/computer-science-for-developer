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

</br>

## 🏷️ Stream API 특징


### 1️⃣ 원본의 데이터를 변경하지 않음

Stream 객체는 원본 데이터를 변경하지 않습니다. 단, 새로운 변수에 직접 할당한다면 해당 데이터는 조작한 데이터로 나오게 된다.

```java

        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape"});
        List<String> newFruitList = fruitList.stream().sorted().collect(Collectors.toList());

        System.out.println(fruitList); // result : [Melon, Apple, Kiwi, Grape]
        System.out.println(newFruitList); // result : [Apple, Grape, Kiwi, Melon]

```


그레서 보통 원본 데이터 변경 없이 원본 데이터에서 새로운 데이터를 만들어내야 할 때 많이 사용한다. 해당 방법을 통해 쉽게 새로운 데이터를 만들어 낼 수 있다. 

</br>

### 2️⃣ 일회용

스트림은 데이터를 모두 읽고나면 사라지는 일회용이다. 즉 이미 한번 사용한 스트림 객체를다시 사용할 경우 runtime error가 발생한다.

```java
        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape"});

        Stream<String> stream = fruitList.stream();
        List<String> newFruitList =stream.sorted().collect(Collectors.toList());
        
        //stream 객체 재사용 시, java.lang.IllegalStateException: stream has already been operated upon or closed 발생
        stream.forEach(System.out::println);


```

</br>


### 3️⃣ 내부 반복으로 작업을 처리

Stream 사용 시, 코드가 간결해지는 이유는 내부 반복 때문이다. 일반적으로 반복문을 작성하기 위해서는 for문이나 while문을 사용해야 하는데 stream에서는 해당 문법들을 내부에 숨기고 있어서 간결한 코드 작성이 가능하다.


</br>

## 🏷️ 자주 사용하는 Stream API


### 🔵 Sorted
Stream의 요소들을 정렬하기 위해 사용, 파라미터로 Comparator를 넘길 수 있다. 

```java
        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape"});

        //오름차순 정렬
        fruitList.stream().sorted().toList();
        
        //내림차순 정렬
        fruitList.stream().sorted(Comparator.reverseOrder()).toList();
```

</br>


### 🔵 Distinct
Stream 요소의 중복된 데이터를 제거

```java
        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape", "Apple"});

        List<String> list = fruitList.stream().distinct().toList(); //result : [Melon, Apple, Kiwi, Grape]
```


</br>


### 🔵 forEach

Stream에서 요소들을 반복하기 위한 연산

```java
        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape", "Apple"});

        fruitList.stream().forEach(System.out::println);

```

</br>


### 🔵 filter
Stream에서 조건에 맞는 데이터만을 정제하여 더 작은 컬렉션을 만들어내는 연산

```java

        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape", "Apple"});

        List<String> list = fruitList.stream().filter(name -> name.contains("A")).toList(); //result : [Apple, Apple]

```


</br>

### 🔵 map

Stream 요소들을 변환하여 새로운 Stream을 형성하는 연산

```java

  List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape", "Apple"});

  List<String> list = fruitList.stream().map(n -> n.toLowerCase()).toList(); //result : [melon, apple, kiwi, grape, apple]

```

</br>

### 🔵 Max/Min/Sum/Average/Count

Stream 에서 최종적으로 결과 값을 내기 위한 함수 (최대, 최소, 합계, 평균, 개수)

```java

        OptionalInt min = IntStream.of(1, 3, 5, 7, 9).min();
        int max = IntStream.of().max().orElse(0);
        IntStream.of(1, 3, 5, 7, 9).average().ifPresent(System.out::println);

        long count = IntStream.of(1, 3, 5, 7, 9).count(); //stream 비어 있는 경우 0
        long sum = LongStream.of(1, 3, 5, 7, 9).sum(); // stream 비어 있는 경우 0

```

</br>

### 🔵 collect

Stream의 요소들을 List나 Set, Map, 등 다른 종류의 결과로 수집하고 싶을 때 사용하는 함수

```java

        List<String> fruitList = Arrays.asList(new String[] {"Melon", "Apple", "Kiwi", "Grape", "Apple"});

        List<String> list = fruitList.stream().collect(Collectors.toList()); // list로 반환받기

        //collectors.joining() : 1개의 String으로 이어붙이고 싶을 때 사용
        String result = fruitList.stream().collect(Collectors.joining()); // result : MelonAppleKiwiGrapeApple
        String result2 = fruitList.stream().collect(Collectors.joining(" ")); // result : Melon Apple Kiwi Grape Apple


       //collectors.groupingBy() : 연산 결과를 특정 그룹으로 묶기를 원할 때 사용
        List<Fruit> fruits = Arrays.asList(
                new Fruit(1, "Melon"),
                new Fruit(3, "Grape"),
                new Fruit(1, "Apple"),
                new Fruit(2, "Kiwi")
        );

        Map<Integer, List<Fruit>> mapOfList = fruits.stream()
                        .collect(Collectors.groupingBy(Fruit::getAmount));

        /*
              result : {1=[Fruit{amount=1, name='Melon'}, Fruit{amount=1, name='Apple'}], 2=[Fruit{amount=1, name='Kiwi'}], 3=[Fruit{amount=1, name='Grape'}]}
        */
```

</br>


