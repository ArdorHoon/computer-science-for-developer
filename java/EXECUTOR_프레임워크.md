# Executor 프레임워크

<mark>**JDK에서 제공하는 framework, Java Application에서 실행되는 task를 간단하게 비동기로 처리할 수 있게 해주는 thread-pool과 API를 제공**</mark>

</br>

Executor가 하는 일은 크게 3가지
1. Thread 생성 : thread 생성하거나 thread pool을 만드는 method 제공
2. Thread 관리 : thread의 생명주기 관리
3. Task 제출 및 실행 : Runnable 혹은 Callable method를 제출하고 그것을 원하는 때에 실행할 수 있음

</br>

## 주요 인터페이스

### ExecutorService 
<mark>Executor를 상속 받은 인터페이스로, Callable도 실행할 수 있으며, Executor를 종료 시키거나 여러 Callable을 동시에 실행하는 등의 기능을 제공</mark>


</br>

### ScheduledExecutorService
<mark>ExecutorService를 상속 받은 인터페이스로 특정 시간 이후에 또는 주기적으로 작업을 실행</mark>


</br>
