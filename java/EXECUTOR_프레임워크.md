# Executor 프레임워크

<mark>**JDK에서 제공하는 framework, Java Application에서 실행되는 task를 간단하게 비동기로 처리할 수 있게 해주는 thread-pool과 API를 제공**</mark>

</br>

Executor가 하는 일은 크게 3가지
1. Thread 생성 : thread 생성하거나 thread pool을 만드는 method 제공
2. Thread 관리 : thread의 생명주기 관리
3. Task 제출 및 실행 : Runnable 혹은 Callable method를 제출하고 그것을 원하는 때에 실행할 수 있음


## 주요 인터페이스

### Executor 
