# Garbage Collection

<mark>**Garbage Collection은 java의 메모리 관리 방법 중 하나로 JVM의 Heap 영역에서 동적으로 할당했던 메모리 중 필요 없게 된 메모리 객체(garbage)를 모아 주기적으로 제거해주는 프로세스**</mark>

C언어 같은 경우, free() 함수를 통해 개발자가 직접 메모리를 해제해야 한다. 이와 달리 Java에서는 GC가 이를 대신해주기 때문에 개발자는 메모리 관리, 메모리 누수 문제에 대해 신경쓰지 않아도 된다. (Python, JavaScript, Go 언어 등에도 GC가 기본으로 내장되어 있음)

하지만 장점만 있는 것은 아니다. 메모리를 언제 해제되는지 정확하게 개발자는 알 수 없고, GC가 동작하는 동안에는 다른 동작을 멈추기 때문에 Overhead가 발생되는 문제점이 있다. (Stop-The-World)


> Stop the World
> GC를 수행하기 위해 JVM이 프로그램 실행을 멈추는 현상을 의미
> 이 시간 동안 다른 Thread는 멈춰있기 때문에 이 시간을 최소화 시키는 것이 핵심이다.
> 
> ![stw](https://github.com/user-attachments/assets/fd70c1a8-192b-471a-bcbf-73122549a05c)






