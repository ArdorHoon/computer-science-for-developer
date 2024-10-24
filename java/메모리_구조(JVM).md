# 메모리 구조(JVM) 

## 목차
1. [JVM 이란?](#JVM-이란?)
2. [JVM 구성](#JVM-구성)
     1. [클래스 로더 (Class Loader)](#Class-Loader)
     2. [실행 엔진 (Execution Engine)](#Execution-Engine)
     3. [RunTime Data Area](#RunTime-Data-Area)
3. [JDK, JRE](#JDK,-JRE)
     1. [JDK](#JDK)
     2. [JRE](#JRE)

</br></br>


## JVM 이란?
<mark>**OS에 종속받지 않고 CPU가 JAVA를 인식, 실행할 수 있게 하는 가상 컴퓨터**</mark>

JVM (Java Virtual Machine) 직역하면 자바 가상 머신인데 Java는 특정 OS에 종속적이지 않다는 특징을 가지고 있다. </br>
이때 Java 프로그램을 OS 위에서 실행시키기 위해 필요한 장치가 바로 JVM이다.</br>
</br>

일반적으로 <code>.java 파일</code>은 CPU가 인식하지 못하기 때문에 기계어로 Compile해야한다. 이를 Java complier 통해서 <code>.class 파일</code>로 변환해준다.
이 <code>.class 파일</code>을 JVM을 통해서 OS에서 동작할 수 있개 해준다. 


## JVM 구성
<p align="center">
<img src="https://github.com/user-attachments/assets/925d45ff-18bc-4f2a-b7de-4895a07d271a" width="70%" height="70%"></br>
</p></br>

JVM은 크게 아래와 같이 구성되어 있다.</br>
- 클래스 로더(Class Loader)
- 실행 엔진(Execution Engine)
     - 인터프리터(Interpreter)
     - JIT 컴파일러(Just-in-Time)
     - 가비지 콜렉터(Garbage collector)
- 런타임 데이터 영역 (Runtime Data Area)


### Class Loader

<mark>**JVM 내로 클래스 파일을 로드하고, 링크롤 통해 배치하는 작업을 수행하는 모듈**</mark>

runtime 시, 클래스를 처음 참조할 때, 해당 클래스를 로드하고 링크하는 역할


### Execution Engine

<mark>**클래스를 실행시키는 모듈**</mark>

클래스 로더가 JVM내의 런타임 데이터 영역에 바이트 코드(.class 파일)를 배치 => 이것을 실행 엔진이 실행
즉, 실행 엔진을 통해 .class 파일을 실제 기계가 실행할 수 있는 형태로 변경</br>


 - ### 인터프리터
   <mark>**실행 엔진은 java .class 파일를 명령어 단위로 읽어서 실행**</mark></br>
   (명령을 한 줄씩 해석해서 일을 하는 인터프리트 방식)</br>
   
 - ### JIT Compiler
   <mark>**프로그램을 실제 실행하는 시점에 기계어로 번역하는 컴파일러**</mark></br>
   인터프리터 방식의 단점을 보완하기 위해 도입, 인터프리터 방식으로 실행하다가 적절한 시점에 바이트 코드 전체를 컴파일하여 기계어로 변경하고, 이후에는 해당 더 이상 인터프리팅 하지 않고 기계어로 직접 실행하는 방식
   
 - ### Garbage Collector
   <mark>**더 이상 사용되지 않는 인스턴스를 찾아 메모리에서 삭제**</mark></br>

</br>

### RunTime Data Area 

<p align="center">
<img src="https://github.com/user-attachments/assets/71706273-d87b-4e43-a32e-09c9f1aa68ab" width="60%" height="60%"></br>
</p></br>

<mark>**프로그램을 수행하기 위해 OS에서 할당받은 메모리 공간**</mark></br>

- JVM 스택 영역
     - 프로그램 실행과정에서 임시로 할당되었다가 메소드를 빠져나가면 바로 소멸되는 특성의 데이터를 저장하기 위한 영역
- Native method stack
     - 자바 프로그램이 컴파일되어 생성되는 바이트 코드가 아닌 실제 실행할 수 있는 기계어로 작성된 프로그램을 실행시키는 영역.
- Method Area
     - 클래스 정보를 처음 메모리 공간에 올릴 때 초기화되는 대상을 저장하기 위한 메모리 공간

</br>


## JDK, JRE

### JDK
<mark>**Java를 사용하기 위해 필요한 모든 기능을 갖춘 Java용 SDK**</mark></br>
JDK는 JRE뿐만 아니라 javac,jdb,javadoc과 같은 도구를 포함하고 있다.</br>
JDK를 이용해서 프로그램을 <code>**생성**</code>, <code>**실행**</code>, <code>**컴파일**</code>을 할 수 있다.</br>
보통 현업에서 Was에 Java로 된 프로그램을 사용하려고 하면 해당 프로그램에 맞는 JDK를 설치해주어야 한다. 


### JRE
<mark>**JVM + Java Class Library 등으로 구성**</mark></br>
컴파일 된 Java 프로그램을 실행하는데 필요한 패키지


