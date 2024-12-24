# Spring Batch 

<mark>**Spring에서 배치 작업을 보다 쉽게 구현하고 관리할 수 있도록 도와주는 Framework**</mark>

> 배치(Batch) : 일정 시간마다 또는 특정 조건에 따라 대규모 데이터를 일괄 처리하는 방식

Spring Batch는 대량의 데이터를 효율적으로 처리하기 위한 프레임워크로 아래와 같은 기능을 제공한다. 

* 배치 프로세스를 주기적으로 commit
* 동시 다발적인 job의 배치 처리, 대용량 병렬 처리 
* 실패 후 수동 또는 스케줄링에 의한 재시작 (오류 대처 옵션 제공)
* 반복, 재시도, Skip 처리 (실패한 배치 작업 중단 지점 재시작 또는 skip)
* 모니터링 (진행 상태와 소요 시간 확인)
* 트랜잭션 관리 (데이터 일관성 유지)

이와 달리 흔히 혼동할 수 있는 $\it{ {\color{#DD6565} Spring,\ Scheduler는,\ 특정,\ 시간에,\ 작업을,\ 실행하기,\ 위한,\ 도구}}$이다. 


</br>



## 1️⃣ Spring Batch 용어

### 🏷️ Job

<mark>**Job은 배치처리 과정을 하나의 단위로 만들어 놓은 객체**</mark>, 또한 배치처리 과정에 있어 전체 계층 최상단에 위치</br>

</br>

### 🏷️ JobInstance

<mark>**Job의 실제 실행 인스턴스를 의미**</mark>

</br>

### 🏷️ JobParameters
<mark>**JobParameters는 JobInstance를 생성하고 구별하는 데 사용되는 파라미터**</mark>

스프링 배치는 String, Double, Long, Date 이렇게 4가지 타입의 파라미터를 지원

</br>

### 🏷️ JobExecution

<mark>**JobInstance의 실행에 대한 정보를 저장**</mark>

JobExecution은 실행 상태, 시작시간, 종료시간, 생성시간 등 JobInstance의 실행에 대한 세부 정보를 담고 있다.

</br>


### 🏷️ Step

Step은 <mark>**Job의 하위 단계로서 실제 배치 처리 작업의 최소 단위**</mark> 

Step은 Tasklet 혹은 Chunk 방식으로 구성

* Tasklet : 하나의 트랜잭션에서 수행되는 단순한 작업
* Chunk :  트랜잭션 범위 내에서 Chunk 단위로 데이터를 읽어 처리하는 방식

</br>


### 🏷️ StepExecution
<mark>**Step의 한 번의 실행을 나타내며, Step의 실행 상태, 실행 시간 등의 정보를 포함**</mark> 

* 각 Step의 실행 시도마다 새로운 StepExecution이 생성
* 읽은 아이템의 수, 쓴 아이템의 수, 커밋 횟수, 스킵한 아이템의 수 등의 Step 실행에 대한 상세 정보도 포함

</br>

### 🏷️ ExecutionContext
<mark>**Step 간 또는 Job 실행 도중 데이터를 공유하는 데 사용되는 저장소**</mark> 

* JobExecutionContext와 StepExecutionContext 두 종류가 있으며, 범위와 저장 시점에 따라 적절하게 사용
* Job이나 Step이 실패했을 경우, ExecutionContext를 통해 마지막 실행 상태를 재구성하여 재시도 또는 복구 작업을 수행
 
</br>

### 🏷️ JobRepository
<mark>**배치 작업에 관련된 모든 정보를 저장하고 관리하는 메커니즘**</mark> 

* Job 실행정보(JobExecution), Step 실행정보(StepExecution), Job 파라미터(JobParameters)등을 저장하고 관리
* Job이 실행될 때, JobRepository는 새로운 JobExecution과 StepExecution을 생성하고, 이를 통해 실행 상태를 추적

</br>

### 🏷️ JobLauncher
<mark>**Job과 JobParameters를 받아 Job을 실행하는 역할**</mark> 

전반적인 Job의 생명 주기를 관리하며, JobRepository를 통해 실행 상태를 유지

</br>

### 🏷️ ItemReader
<mark>**배치 작업에서 처리할 아이템을 읽어오는 역할**</mark> 

</br>

### 🏷️ ItemProcessor
<mark>**ItemReader로부터 읽어온 아이템을 처리하는 역할**</mark> 

</br>

 ### 🏷️ ItemWriter
<mark>**ItemProcessor에서 처리된 데이터를 최종적으로 기록하는 역할**</mark> 

</br>


## 2️⃣ Batch 사용 사례

</br>
