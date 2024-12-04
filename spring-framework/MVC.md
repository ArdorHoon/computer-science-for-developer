# MVC

<mark>**MVC 패턴은 애플리케이션을 개발할 때 사용하는 디자인 패턴**</mark></br>

MVC를 사용함으로써 **UI 영역**과 **도메인(비즈니스 로직) 영역**으로 구분되어 서로에게 영향을 주지 않으면서 개발과 유지보수가 가능하다.

MVC 패턴을 구성하는 요소는 Model, View, Controller가 있다. </br>


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

</br>

### 🟥 Controller

Controller는 **클라이언트 측의 요청을 직접적으로 전달받는 엔드포인드(Endpoint)로써 Model과 View의 중간에서 상호작용을 해주는 역할** </br>

클라이언트 측의 요청을 전달받아 비즈니스 로직을 거친 후, Model 데이터가 만들어지면 이 Model 데이터를 View로 전달하는 역할

</br>

## 2️⃣ Spring MVC     //3️⃣ 4️⃣
