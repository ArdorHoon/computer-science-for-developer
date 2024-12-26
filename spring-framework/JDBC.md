# Spring JDBC


## 1️⃣ JDBC(Java Database Connectivity)란?
<mark>**자바에서 데이터베이스에 접속할 수 있도록 도와주는 API**</mark></br></br>


<p align="center">
<img src="https://github.com/user-attachments/assets/1a7bb8b1-27f2-44dc-a9e0-35407b52917e" width="40%" height="40%"></br>
JDBC 흐름도
</p></br></br>

* **JDBC API** : 데이터베이스 연동을 가능하게하는 JDBC 클래스는 자바 패키지 java.sql과 javax.sql에 포함
* **JDBC Driver Manager** : 애플리케이션이 요구하는 데이터베이스에 접근하기 위한 적절한 드라이버를 선택하여 데이터베이스와 연결

</br>

JDBC 동작 흐름은 다음과 같다.

1. JDBC Driver 로딩 후 DB 연결(JDBC Driver 구현체를 이용해 특정 Vendor DB에 접근)
3. JDBC Driver Manager가 드라이버들을 관리하고 Connection 획득하는 기능 제공
4. 개발자는 JDBC API를 통해서 DB에 SQL을 실행하고 결과를 응답 받음

</br>

JDBC는 3가지 기능을 표준 인터페이스로 정의하여 제공

* java.sql.Connection - 연결
* java.sql.Statement - SQL을 담은 내용
* java.sql.ResultSet - SQL 요청 응답

</br>

## 2️⃣ Spring JDBC의 특징
<mark>**Spring JDBC는 Spring Framewor에서 제공하는 JDBC 기반의 데이터 액세스 기술**</mark></br>
Spring JDBC를 통해 JDBC를 보다 쉽고 효율적으로 사용할 수 있도록 추상화된 기능을 제공한다. 


### ✴︎ DataSource 추상화
* Spring JDBC는 데이터베이스 연결 풀을 관리하기 위한 DataSource 인터페이스를 제공
* DataSource를 사용하여 데이터베이스 연결 및 트랜잭션 관리를 편리하게 처리

```java
// MySQL 데이터베이스에 연결하기 위한 DataSource 설정
DriverManagerDataSource dataSource = new DriverManagerDataSource();
dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
dataSource.setUrl("jdbc:mysql://localhost:3306/mydb");
dataSource.setUsername("root");
dataSource.setPassword("password");
```

</br>

### ✴︎ 예외 처리 및 자원 관리
* Spring JDBC는 JDBC 작업에서 발생하는 예외를 일관되게 처리하고, 연결 및 리소스 관리를 자동으로 처리하여 개발자가 명시적으로 관리해야 하는 부분을 간소화

</br>

### ✴︎ SQL 문 실행 및 매핑
* Spring JDBC는 간단하고 직관적인 방식으로 SQL 문을 실행하고 결과를 자바 객체로 매핑하는 기능을 제공
* ResultSet을 자동으로 객체로 변환하고, PreparedStatement 및 CallableStatement를 사용하여 SQL 파라미터를 설정

</br>

**♦️ PreparedStatement**</br>
아래와 같이 SQL문의 틀을 미리 생성해 놓고 ?를 이용해서 나중에 값을 지정하는 것
```java
 //** 생략 
 pstmt = conn.prepareStatement("select * from USER where EMAIL=?");
 pstmt.setString(1, email);

//** 생략
```

</br>

**♦️ CallableStatement**</br>
데이터베이스에서 저장 프로시저(Stored Procedure)를 호출하기 위해 사용
```java
public class CallableStatementExample {
    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "user", "password")) {
            // CallableStatement 생성
            CallableStatement stmt = conn.prepareCall("{call my_procedure(?, ?)}");

            // 입력 매개변수 설정
            stmt.setInt(1, 10);

            // 출력 매개변수 등록
            stmt.registerOutParameter(2, Types.VARCHAR);

            // 실행
            stmt.execute();

            // 출력 매개변수 값 가져오기
            String result = stmt.getString(2);
            System.out.println("프로시저 결과: " + result);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

```

</br>

Jdbc Template에서 사용 예시 
```java
String sql = "SELECT * FROM USER WHERE name = ?";
List<User> user = jdbcTemplate.query(sql, new Object[]{"John Doe"}, new RowMapper<User>() {
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setId(rs.getLong("id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        return customer;
    }
});

```
</br>


### ✴︎ 트랜잭션 관리
* Spring JDBC는 스프링의 트랜잭션 관리 기능과 통합된다. 기존에는 Service에서 커밋과 롤백을 설정했었다면 Spring에서는 자동으로 관리
* @Transactional로 선언적 트랜잭션 관리나 TransactionTemplate로 프로그래밍 방식으로 트랜잭션 관리가 가능

</br>

♦️ <code>@Transactional</code> 예시 (권장)
```java
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Transactional
    public void transfer(String fromAccountId, String toAccountId, double amount) {
        accountRepository.withdraw(fromAccountId, amount);
        
        // 에러 발생 시 트랜잭션 롤백
        if (amount > 10000) {
            throw new IllegalArgumentException("Amount exceeds transfer limit!");
        }
        
        accountRepository.deposit(toAccountId, amount);
    }
}
```

</br>

♦️ <code>TransactionTemplate</code> 예시

```java
@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private TransactionTemplate transactionTemplate;

    public void transfer(String fromAccountId, String toAccountId, double amount) {
        transactionTemplate.execute(status -> {
            try {
                accountRepository.withdraw(fromAccountId, amount);
                
                // 에러 발생 시 트랜잭션 롤백
                if (amount > 10000) {
                    throw new IllegalArgumentException("Amount exceeds transfer limit!");
                }

                accountRepository.deposit(toAccountId, amount);
            } catch (Exception e) {
                status.setRollbackOnly();
                throw e;
            }
            return null;
        });
    }
}


```

</br>


### ✴︎ 다양한 Callback 및 템플릿
* Spring JDBC는 JdbcTemplate, NamedParameterJdbcTemplate, SimpleJdbcTemplate 등의 다양한 템플릿과 콜백 기능을 제공
* 현재는 Spring JDBC를 사용하는 상황이라면, JdbcTemplate를 제일 많이 사용한다. 

```java
@Autowired
private JdbcTemplate jdbcTemplate;

public int updateAccountBalance(String accountId, double amount) {
    String sql = "UPDATE accounts SET balance = ? WHERE account_id = ?";
    return jdbcTemplate.update(sql, amount, accountId);
}
```

</br>

## 3️⃣ Spring JDBC 활용


</br>
