# Database Optimizer

<mark>**SQL문을 실행하는 가장 효율적인 방법을 결정하는DBMS의 핵심 엔진**</mark></br>

이를 통해 옵티마이저는 2가지 역할을 수행한다. 
- 쿼리 실행 성능을 최적화하여 더 빠르고 효율적인 데이터 처리
- 쿼리 실행의 자원 소비를 줄여 시스템 성능을 개선


</br>


## 1️⃣ Optimizer 동작 방식

1. <mark>**쿼리 파싱 (Query Parsing)** </mark> : SQL 쿼리는 구문 분석을 거쳐 **추상 구문 트리**로 변환함
2. <mark>**논리적 최적화 (Logincal Optimization)** </mark> : 파싱된 쿼리는 논리적 최적화를 거친다. (불필요한 조건 제거, 조인 순서 변경, 조건 통합)
3. <mark>**통계 정보 및 메타데이터 활용(Statistics and Metadata Utilization)** </mark> : 옵티마이저는 **테이블 통계, 인덱스 정보, 데이터 분포** 등을 기반으로 쿼리를 최적화
4. <mark>**물리적 최적화 (Physical Optimization)** </mark> : 논리적 최적화가 끝난 후, 옵티마이저는 쿼리 실행을 위해 물리적 실행 계획을 선택 (인덱스 선택, 조인 방법 결정 등)
5. <mark>**실행 계획 생성(Execution Plan Generation** </mark>) : 물리적 최적화가 끝나면, 최종적으로 실행 계획 생성
6. <mark>**쿼리 실행 (Query Execution)** </mark> : 최종적으로 선택된 실행 계획 기반으로,  DB는 실제로 데이터를 처리하고 결과를 반환 


</br>


## 2️⃣ Optimizer 종류




</br>


### ⭕ 규칙 기반 옵티마이저(RBO : Rule-Based Optimizer)




</br>


### ⭕ 비용 기반 옵티마이저(CBO : Cost-Based Optimizer)




</br>

## 3️⃣ 옵티마이저의 한계

옵티마이저는 


</br>
