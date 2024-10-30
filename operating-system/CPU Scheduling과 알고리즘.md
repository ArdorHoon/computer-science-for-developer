# CPU Scheduling과 알고리즘


## CPU Scheduling

<mark>CPU를 사용하려고 하는 프로세스들 사이의 우선순위를 관리하는 작업</mark>

### 그렇다면 왜 CPU는 Scheduling이 필요할까?</br>

컴퓨터 시스템 내의 프로세스의 CPU 버스트를 분석해보면 대부분의 경우 짧은 CPU 버스트를 가지며, 극히 일부분만 긴 CPU 버스트를 갖는다. 이는 I/O 작업을 수행하는 프로세스가 상당히 많은 부분을 차지한다는 뜻이다. 즉, 대화형 작업을 많이 수행해야 하는데, 사용자에 대한 빠른 응답을 위해서는 해당 프로세스한테 우선적으로 CPU를 할당해야한다. 이러한 이유로 CPU 스케줄링이 필요해졌다.


<p align="center">
<img src="https://github.com/user-attachments/assets/d23c436c-fce8-490a-b0dc-4f30c7d023e4" width="50%" height="50%"></br>
</p></br>


- CPU burst : 프로그램이 CPU를 직접 가지고 빠른 명령을 수행하는 단계 
- I/O burst : 커널에 의해 입출력 작업을 진행하는 단계, 운영체제를 통해 서비스가 실행됨



## 
