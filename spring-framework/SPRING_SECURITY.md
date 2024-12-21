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


## Spring Security 시작하기

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


