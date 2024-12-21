# Spring Security

<mark>**Spring에서 강력하고 고도로 사용자 정의가 가능한 인증 및 권한 기능을 제공하는 프레임워크**</mark>

Spring기반 Application 보안의 표준이다. Spring Security에서 기본으로 제공하는 기능들은 아래와 같습니다. (24년 12월 21일 6.4.2가 최신버전)

* 인증 및 권한 부여에 대한 포괄절이고 확장 가능한 지원
* Session Fixation, Clickjacking, Cross site request forgery 등과 같은 보안 공격으로부터 보호
* Spring Web MVC와 선택적 통합
* Servlet API와 통합

또한 Spring Security에서는 OAuth2(소셜 로그인), JWT(Json Web Token) 등 다양한 로그인 수단을 제공하지만 여기서는 가장 기본적인 방법에 대해 알아보려고 한다.

추가적인 Spring Security에 대한 설명을 보고 싶다면 [공식 사이트](https://spring.io/projects/spring-security#overview)를 확인하자.

</br>

### 용어 설명
* 인증(Authentication) : 사용자가 누구인지 확인하는 절차 
* 인가(Authorization) : 인증된 사용자가 요청한 자원에 접근 가능한지 권한을 확인하는 절차


</br>

## Spring Security 동작 원리



</br>

## Spring Security 시작하기


### Spring Security 기본 설정

우선 Spring Security를 설정하기 위해 dependency를 추가해준다. 

```gradle
 implementation 'org.springframework.boot:spring-boot-starter-security'
```

해당 Dependcy를 추가하고 페이지를 확인하면 로그인 화면이 보일 것이다.

![login](https://github.com/user-attachments/assets/cc114ee6-2786-4b00-a44e-906cf9cbadf0)


Spring Security에서는 웹사이트 보안에 가장 기본적인 기능인 아이디/패스워드 인증을 화면까지 지원합니다. 해당 화면에서 id는 user이고 패스워드는 console 로그(Using generated security password)를 보면 확인가능하다.

```gradle
2024-12-21T19:15:18.757+09:00  WARN 9091 --- [  restartedMain] .s.s.UserDetailsServiceAutoConfiguration : 

Using generated security password: 599ae06e-76c0-4b57-ab0f-30c13a5995fd

This generated password is for development use only. Your security configuration must be updated before running your application in production.

```

우리는 저 화면을 [Configuration](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/spring-framework/Configuration.md)을 통해 원하는 페이지에 적용할 수 있다. 이제 <code>SecurityConfig.java</code>를 만들어 보자!

```java

@Configuration
@EnableWebSecurity
public class SecurityConfig {


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{

        http.authorizeHttpRequests((authorizeRequests)
         -> authorizeRequests
                .anyRequest().permitAll()
        );
        
        return http.build();
    }
}


```
해당 코드는 요청되는 모든 URL을 허용하겠다는 의미이다. 이렇게 하고 재실행하면 로그인 화면은 나오지 않을 것이다. 하지만 우리가 원하는 것은 

Spring Security에서 인증, 인가를 처리하는 방법이기 때문에 해당 코드를 변경 해준다. 

</br>

### Spring Secuirty 인증

Spring Security에서 아이디, 패스워드를 가지고 인증을 처리하는 방식을 확인해보자!

```java

@Configuration
@EnableWebSecurity
public class SecurityConfig {


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{

        http.authorizeHttpRequests((authorizeRequests)
         -> authorizeRequests
                .anyRequest().authenticated()
        )
                .formLogin((formLogin) -> formLogin
                        .usernameParameter("id")
                        .passwordParameter("password")
                        .defaultSuccessUrl("/", true)
                );
        return http.build();
    }
    
    
    @Bean
    public UserDetailsService userDetailsService(){
        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(User.withUsername("user1").password("1234").build());
        return  manager;
    }
    
    
    @Bean
    public PasswordEncoder passwordEncoder(){
        return NoOpPasswordEncoder.getInstance();
    }
    
}


```

permitAll()을 authenticated()로 변경해주고 formLogin을 추가해주면 Spring에서 제공하는 기본 로그인 화면이 등장한다. 

그리고 로그인 처리가 되면 UserDetailsSerive 객체가 반환하게 되는데 여기서는 강제로 id는 user1, password는 1234로 강제했다.

그리고 Spring에서 패스워드는 인코딩해야 하는데 PasswordEncoder를 통해 간단히 암호화할 수 있다. 


### Spring Secuirty 인가

또 Spring Security에서는 계정에 권한을 부여하는 인가를 통해 허용된 사이트만 들어가게 할 수 있다. 

UserDetailsService에서 roles()를 통해 인가를 부여할 수 있다. 하나의 예제를 보자! 


우선 user1 계정에 user라는 Role을 부여하는 코드이다.

```java
    @Bean
    public UserDetailsService userDetailsService(){
        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
        manager.createUser(User.withUsername("user1").password("1234").roles("user").build());
        return  manager;
    }

```

그리고 requestMatchers를 통해서 url에 대한 호출 권한을 지정한다. 

```java
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{

        http.authorizeHttpRequests((authorizeRequests)
         -> authorizeRequests
                        .requestMatchers("/normal").hasRole("user")
                        .requestMatchers("/admin").hasRole("admin")
                .anyRequest().authenticated()
        )
                .formLogin((formLogin) -> formLogin
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .defaultSuccessUrl("/", true)
                );
        return http.build();
    }

```

그리고 인가를 확인하기 위해 간단한 Controller를 만들어준다.

```java
@RestController
public class AuthController {
    
    @GetMapping("/normal")
    public ResponseEntity normal() {

        return new ResponseEntity< >("normal 페이지", HttpStatus.OK);
    }

    @GetMapping("/admin")
    public ResponseEntity admin() {
        return new ResponseEntity< >("admin 페이지", HttpStatus.OK);
    }
}

```

이제 user1으로 로그인에 테스트를 해보자 


localhost/normal로 접속

![normal](https://github.com/user-attachments/assets/4754c48b-4f84-41b3-b2a8-24c2e6ad7455)

localhost/admin로 접속

![admin](https://github.com/user-attachments/assets/89c7f548-a684-4619-b93e-4a81955e33cc)

