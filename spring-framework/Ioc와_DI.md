# IoC와 DI

Spring의 IoC와 DI는 코드의 모듈화, 테스트 용이성, 유지보수성 등을 향상시키는 핵심 기능 중 하나이다.


## IoC (Inversion of Control)
<mark>**IoC는 말 그대로 제어의 역전을 의미**</mark>  

전통적인 프로그래밍에서는 개발자가 프로그램의 흐름과 제어를 직접 다룬다. 
하지만 IoC는 프레임워크가 객체의 생성, 관리, 제어 흐름을 담당하도록 변경하는 개념이다.  

Spring은 이를 지원하기 위해 ApplicationContext라는 컨테이너를 제공한다. ApplicationContext는 애플리케이션의 컴포넌트를 생성하고 조립하며, 객체의 라이프사이클을 관리한다.


</br>

## DI
