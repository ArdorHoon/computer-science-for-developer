# NoSQL
<mark>**비관계형 데이터베이스를 저장**</mark>

관계형 데이터 모델을 지양하며 대량의 분산된 비정형 데이터를 저장하고 조회하는데 특화된 데이터베이스로 스키마 없이 사용하거나 느슨한 스키마를 제공하는 저장소

</br>

### ▶️ 특징 
1. RDBMS와 달리 데이터 간의 관계를 정의하지 않는다. 
2. RDBMS에 비해 대용량의 데이터를 저장할 수 있다.
4. 분산형 구조로 설계되어 있다.
5. 고정되지 않은 테이블 스키마를 갖는다. 

</br>

### ▶️ 장점
1. RDBMS에 비해 저렴한 비용으로 분산처리와 병렬처리가 가능하다.
2. 빅 데이터 처리에 효과적이다. 
3. 가변적인 구조로 데이터 저장이 가능하다.
4. 데이터 모델의 유연한 변화가 가능하다.

</br>


### ▶️ 단점
1. 데이터 업데이트 중 장애 발생 시, 데이터 손실이 발생할 수 있다.
2. 데이터의 일관성이 항상 보장되지 않는다.  -> 최종적 일관성(Eventually Consistent)을 지향한다.
3. 많은 인덱스를 사용하려면 충분한 메모리가 필요하다. (인덱스 구조가 메모리에 저장)


</br>



## RDBMS 종류

- Key-Value Database : KEY-VALUE 하나의 묶음(Unique)으로 저장되는 구조, 단순한 구조이기에 속도가 빠르며 분산 저장 시 용이(ex : Redis, VoldeMorte, Oracle NoSQL)
- Wide-Column Database : 행마다 키와 해당 값을 저장할 때마다 각각 다른값의 다른 수의 스키마를 가질 수 있다. (ex : GoogleBigTable, Vertica, Hbase)
- Document Database : 테이블의 스키마가 유동적, 즉 레코드마다 각각 다른 스키마를 가질 수 있다. 보통 XML, JSON을 이용해 레코드 저장 (ex : MongoDB, CouchDB, Azure Cosmos DB)
- Graph Database : 데이터를 노드로 표현하며 노드 사이의 관계를 엣지로 표현, RDBMS 보다 성능이 좋고 유지보수 용이 (ex : Neo4j, BlazeGraph, OrientDB) 

</br>

