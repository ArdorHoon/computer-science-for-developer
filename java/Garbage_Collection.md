# Garbage Collection

<mark>**Garbage Collection은 java의 메모리 관리 방법 중 하나로 [JVM](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/java/%EB%A9%94%EB%AA%A8%EB%A6%AC_%EA%B5%AC%EC%A1%B0(JVM).md)의 Heap 영역에서 동적으로 할당했던 메모리 중 필요 없게 된 메모리 객체(garbage)를 모아 주기적으로 제거해주는 프로세스**</mark>

C언어 같은 경우, free() 함수를 통해 개발자가 직접 메모리를 해제해야 한다. 이와 달리 Java에서는 GC가 이를 대신해주기 때문에 개발자는 메모리 관리, 메모리 누수 문제에 대해 신경쓰지 않아도 된다. (Python, JavaScript, Go 언어 등에도 GC가 기본으로 내장되어 있음)

하지만 장점만 있는 것은 아니다. 메모리를 언제 해제되는지 정확하게 개발자는 알 수 없고, GC가 동작하는 동안에는 다른 동작을 멈추기 때문에 Overhead가 발생되는 문제점이 있다. (Stop-The-World)

</br>


> **Stop the World**</br>
> GC를 수행하기 위해 JVM이 프로그램 실행을 멈추는 현상을 의미</br>
> 이 시간 동안 다른 Thread는 멈춰있기 때문에 이 시간을 최소화 시키는 것이 핵심이다.
>
><img src="https://github.com/user-attachments/assets/fd70c1a8-192b-471a-bcbf-73122549a05c" width="40%" height="40%">


</br>

위의 문제를 최소화 하기 위해 GC 최적화 작업(GC 튜닝)을 한다.


## Garbage Collection 대상

GC는 특정 객체가 garbage인지 아닌지 판단하기 위해, Reachability(도달성)이라는 개념을 사용한다.

객체에 reference가 있다면 Reachable로 구분되고, 객체가 유효한 reference가 없다면 Unreachable로 구분해서 수거한다.


<p align="center">
<img src="https://github.com/user-attachments/assets/532fe553-77a9-477f-9a12-074abed3679c" width="70%" height="70%"></br>
</p></br>


JVM 메모리에서는 객체들은 실질적으로 Heap영역에서 생성되고 Native Method area나 Stack area에서는 해당 객체의 주소를 참조하는 형식으로 구성된다. 이 때 Heap 영역에 생성된 객체 중 어디도 참조하고 있지 않은 객체들을 주기적으로 Garbage Collector에서 수거해 삭제해준다.


</br>

## Garbage Collection 동작 방식

### Mark and Sweep


<p align="center">
<img src="https://github.com/user-attachments/assets/aa53eb1b-88f2-47f6-bf4c-5d88f7704348" width="70%" height="70%"></br>
</p></br>



- <mark>Mark</mark> : 사용되는 메모리와 사용되지 않는 메모리를 식별하는 작업
- <mark>Sweep</mark> : Mark 되지 않은 메모리를 해제하는 작업

</br>

앞서 Stop The world를 통해 GC가 동작할 때, GC는 stack 모든 변수 또는 Reachable한 객체를 스캔하면서 어떤 객체를 참조하고 있는지를 탐색한다. 이를 통해 사용되고 있는 메모리를 식별(mark)하고 Mark가 되지 않은 객체들을 메모리에서 제거(sweep)한다.

</br>


### Heap 메모리 구조 (Minor GC & Major GC)

JVM의 Heap 영역은 2가지를 전제로 설계 되었다.
1. 대부분의 객체는 금방 접근 불가능한 상태가 돤다. (Unreachable)
2. 오래된 객체에서 새로운 객체로의 참조는 아주 적게 존재한다.

이를 종합하면 **"객체는 대부분 일회성되며, 메모리에 오랫동안 남아있는 경우는 드물다"**"라고 정의할 수 있다.

</br>

객체의 생존 기간에 따라 물리적인 Heap 영역을 나누게 되었고 <code>Young</code>, <code>Old</code> 총 2가지 영역으로 설계되었다. 





