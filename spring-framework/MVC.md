# MVC

<mark>**MVC 패턴은 애플리케이션을 개발할 때 사용하는 디자인 패턴**</mark></br>

MVC를 사용함으로써 **UI 영역**과 **도메인(비즈니스 로직) 영역**으로 구분되어 서로에게 영향을 주지 않으면서 개발과 유지보수가 가능하다.

MVC 패턴을 구성하는 요소는 Model, View, Controller가 있다.

</br>


<p align="center">
<img src="https://github.com/user-attachments/assets/98c9537a-b325-4866-be5d-1bf8b0ae506d" width="70%" height="70%"></br>
</p></br>




</br>

## 1️⃣ Model, View, Controller

### 🟥 Model

Spring MVC 기반의 웹 애플리케이션이 클라이언트의 요청을 전달받으면 요청 사항을 처리하기 위한 작업을 한다. </br>

처리한 작업의 결과 데이터를 클라이언트에게 응답으로 돌려주어야 하는데, 이 때 **클라이언트에게 응답으로 돌려주는 작업의 처리 결과 데이터를 Model**이라고 한다.

</br>

### 🟥 View

View는 **Model을 이용하여 웹 브라우저와 같은 애플리케이션의 화면에 보이는 리소스(Resource)를 제공하는 역할**을 한다.

#### @ Spring MVC에서 다양한 View 기술
- HTML 페이지 출력
- PDF, Excel 등의 문서 형태로 출력
- XML, JSON 등 특정 형식의 포맷으로 변환


</br>

### 🟥 Controller

Controller는 **클라이언트 측의 요청을 직접적으로 전달받는 엔드포인드(Endpoint)로써 Model과 View의 중간에서 상호작용을 해주는 역할** </br>

클라이언트 측의 요청을 전달받아 비즈니스 로직을 거친 후, Model 데이터가 만들어지면 이 Model 데이터를 View로 전달하는 역할

</br>

## 2️⃣ Spring MVC    


<p align="center">
<img src="https://github.com/user-attachments/assets/063200de-8904-43b7-98be-1c4f94a304fc" width="80%" height="80%"></br>
</p></br>

- 노란색 : 개발자에의해 실행
- 파란색 : Spring에서 제공
- 초록색 : Spring에서 제공, 가끔 개발자에 의해 실행 



### 🟥 동작 순서

1. <code>**DispatcherServlet**</code>가 request를 받는다.
2. <code>**DispatcherServlet**</code>가 적절한 controller를 선택하는 작업을 HandlerMapping에게 전달하고 HandlerMapping은 들어오는 요청 URL에 매핑되는 Controller를 선택된 Handler와 Controller를 <code>**DispatcherServlet**</code>에게 반환한다.
3. <code>**DispatcherServlet**</code>은 Controller의 비즈니스 로직을 실행하는 작업을 HandlerAdpater에 전달한다.
4. HandlerAdpater는 Controller의 비즈니스 로직을 호출한다.
5. Controller는 비즈니스 로직을 실행하고, 처리 결과를 Model에 설정하고, logical name of view을 HandlerAdapter에 반환한다.
6. <code>**DispatcherServlet**</code>는 View 이름에 해당하는 View를 찾기 위해 ViewResolver에게 전달하고 ViewResolver는 view name에 매핑된 view를 반환한다.
7. <code>**DispatcherServlet**</code>는 반환된 view에 rendering process를 dispatch한다.
8. View는 Model 데이터를 렌더링하고 응답을 반환한다.

</br>

### 🟥 Spring MVC 요소

#### ♦️ DispatcherServlet
Front Controller 역할을 숭행하며 Request를 각각의 Controller에게 위임 

가장 앞 단에서 client 요청을 처리하는 Controller로써 요청부터 응답까지 전반적인 처리 과정을 통제

</br>

#### ♦️ HandlerMapping
요청을 직접 처리할 컨트롤러를 탐색 (구체적인 Mapping은 xml이나 java config 관련 어노테이션 등을 통해 처리할 수 있음)

</br>

#### ♦️ HandlerAdapter
매핑된 Controller의 실행을 요청

</br>

#### ♦️ Controller
DispatcherServlet이 전달해준 HTTP 요청을 처리하고 결과를 Model에 저장
- 직접 요청을 처리하며, 처리 결과를 반환
- 결과가 반환되면 HandlerAdapter가 ModelAndView 객체로 변환되며, 여기에는 View Name과 같이 응답을 통해 보여줄 View에 대한 정보와 관련된 데이터가 포함

</br>

#### ♦️ ModelAndView
ModelAndView는 Controller에 의해 반환된 Model과 View가 Wrapping된 객체

</br>
#### ♦️ View Resolver
View Name을 확인한 후, 실제 Controller로부터 받은 로직 처리 결과를 반영할 View 파일(jsp)을 탐색

</br>

#### ♦️ View
로직 처리 결과를 반영한 최종 화면을 생성

</br>
