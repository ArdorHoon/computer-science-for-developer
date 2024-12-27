# JPA & Hibernate


## 1️⃣ JPA
<mark>**JAVA 객체와 관계형 데이터베이스(RDBMS) 간의 매핑을 처리하는 Java 표준 API**</mark>

</br>

### 🥎 JPA 특징

* 데이터베이스 작업을 객체 지향적으로 처리
* 엔티티(Entity)라는 자바 클래스를 사용하여 데이터베이스 테이블과 매핑
* 영속성 컨텍스트(Persistence Context)라는 개념을 사용하여, 데이터베이스 상태와 자바 객체 상태를 동기화

</br>

## 2️⃣ Hibernate
<mark>**JPA의 구현체(Implementation) 중 하나인 ORM(Object-Relational Mapping) 프레임워크**</mark>입니다. 즉, JPA 인터페이스를 구현하여 실제로 데이터베이스와 상호작용하는 기능을 제공

</br>

### 🥎  Hibernate 특징

* 객체-관계 매핑을 자동으로 처리하여, 개발자가 SQL을 직접 작성할 필요를 줄임
* 세션(Session)을 사용하여 데이터베이스와의 연결을 관리
* 캐시 및 지연 로딩(Lazy Loading) 기능을 제공하여 성능 최적화
* 트랜잭션 관리와 쿼리 실행을 처리

</br>


### 🥎 Hibernate 장점

* 생산성 :SQL을 직접 사용하지 않고, 메서드 호출로 쿼리를 수행
* 유지보수 : 테이블 컬럼 변경 시, 테이블과 관련된 DAO의 파라미터, 결과, SQL 등을 대신 수행
* 객체지향적 개발 : 객체지향적으로 데이터를 관리할 수 있기 때문에 비즈니스 로직에 집중
* 특정 밴더에 종속적이지 않음 : JPA는 추상화된 데이터 접근 계층을 제공하기 때문에 특정 벤더에 종속적이지 않음 (즉, MySQL, ORACLE 등 DB 변경이 쉽다.)

</br>

### 🥎 Hibernate 단점

* 성능 : 메서드 호출만으로 쿼리를 수행하는 것은 SQL을 작성하는 것보다 성능상 좋지 않음
* 세밀함이 떨어짐 : 메서드 호출만으로 DB데이터를 조작하기에는 한계가 있음(이를 보완하기 위해 JPQL 지원)
* 러닝커브 : 공부해야할 양이 많다.

</br>

## 3️⃣ JPA와 Hibernate 사용 예시 및 관계

```java

// JPA Entity 클래스 예시
@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;

}

// EntityManager를 이용한 데이터베이스 작업 예시
@PersistenceContext
private EntityManager entityManager;

public void saveUser(User user) {
    entityManager.persist(user);  // Hibernate가 JPA의 persist를 구현
}

```

여기서 entityManager는 JPA 표준 API이며, 이 내부에서 Hibernate가 실제로 데이터를 처리한다. 결국 JPA를 통해 Hibernate와 같은 ORM 구현체를 사용하여 데이터베이스 작업을 쉽게 처리할 수 있다.

</br>

![jpa](https://github.com/user-attachments/assets/ff81396e-6643-43ab-a745-d6389656f94f)


실제로 위의 사진처럼 JPA와 Hibernate의 상속 및 구현 관계를 보면 JPA의 EntityManager, EntityManager, EntityTransaction을 Hibernate에서 SessionFactory, Session, Transaction으로 상속 받고 각각 Impl로 구현하고 있다는 것을 확인할 수 있다. 

</br>

## 4️⃣ Spring Data JPA와 활용 예시

실제로 Spring에서 JPA를 사용하기 위해서 Spring Data JPA라는 라이브러리를 제공한다. Spring Data JPA는 JPA를 한 단계 더 추상화 시켜서 좀 더 쉽게 사용할 수 있게 해준다.

<p align="center">
<img src="https://github.com/user-attachments/assets/05414461-745f-4790-8b33-4da7cf457748" width="50%" height="50%"></br>
</p></br>



</br>

### 🥎 Spring Data JPA를 활용한 DB 접근 소스 코드

아래는 도서 주문 관련 간단한 REST API를 Spring Data JPA로 만든 예제이다. 

</br>

### 🔵 Entity
```java
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private Long bookId;   // Book 엔티티와 연관
    private String customerName;
    private Integer quantity;
    private Double totalPrice;
}


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;
    private String author;
    private Double price;
}
```

</br>

### 🔵 Repository
```java
public interface OrderRepository extends JpaRepository<Order, Long> {

}

public interface BookRepository extends JpaRepository<Book, Long> {
}
```
</br>

### 🔵 OrderService
```java

@Service
public class OrderService {

    private final BookRepository bookRepository;
    private final OrderRepository orderRepository;

    @Autowired
    public OrderService(BookRepository bookRepository, OrderRepository orderRepository) {
        this.bookRepository = bookRepository;
        this.orderRepository = orderRepository;
    }

    // 주문 생성
    public Order createOrder(Long bookId, String customerName, Integer quantity) {
        // Book 정보를 찾음
        Book book = bookRepository.findById(bookId)
                .orElseThrow(() -> new RuntimeException("Book not found"));

        // 총 가격 계산
        Double totalPrice = book.getPrice() * quantity;

        // 새로운 주문 객체 생성
        Order order = new Order();
        order.setBookId(bookId);
        order.setCustomerName(customerName);
        order.setQuantity(quantity);
        order.setTotalPrice(totalPrice);

        // 주문 저장
        return orderRepository.save(order);
    }

    // 주문 ID로 조회
    public Order getOrder(Long orderId) {
        return orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found"));
    }
}

```


</br>

### 🔵 OrderController

```java
@RestController
@RequestMapping("/api/orders")
public class OrderController {

    private final OrderService orderService;

    @Autowired
    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    // 주문 생성 API
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Order createOrder(@RequestParam Long bookId, 
                             @RequestParam String customerName, 
                             @RequestParam Integer quantity) {
        return orderService.createOrder(bookId, customerName, quantity);
    }

    // 주문 조회 API
    @GetMapping("/{id}")
    public Order getOrder(@PathVariable Long id) {
        return orderService.getOrder(id);
    }
}
```

</br>

### 🔵 테스트 데이터 삽입
```java
@Component
public class DataLoader implements CommandLineRunner {

    private final BookRepository bookRepository;

    public DataLoader(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        // 테스트 도서 데이터 삽입
        bookRepository.save(new Book(null, "Spring in Action", "Craig Walls", 35.99));
        bookRepository.save(new Book(null, "Hibernate Tips", "Thorben Janssen", 29.99));
    }
}

```

</br>

### 🔵 테스트

> **GET /api/orders/1**

```json
{
    "id": 1,
    "bookId": 1,
    "customerName": "JohnDoe",
    "quantity": 2,
    "totalPrice": 71.98
}

```

</br>
