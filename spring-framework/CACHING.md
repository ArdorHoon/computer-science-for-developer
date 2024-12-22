# Spring Caching

캐싱은 <mark>**자주 사용하는 데이터를 어딘가 가까운 곳에 저장해두었다가, 필요할 때 빠르께 가져오기 위한 기술**</mark>이다. 

</br>

> **Cache vs Buffer**</br></br>
> 둘의 공통점은 추가적인 메모리를 사용하여 속도 차이를 보상한다에 있지만 </br>
> 캐시는 작업 속도를 증진시키기 위해 사용하기 때문에 해당 데이터를 저장소에 저장하여 계속 사용할 수 있지만, </br>
> 버퍼는 데이터 손실을 막기 위해 사용하기 때문에 연산이 끝난 뒤 데이터를 저장할 수 없는 일회성라는 차이가 있다.

</br>

Spring에서도 캐싱을 구축할 수 있는데 캐시 저장소 위치에 따라 크게 로컬 캐시와 원격 캐시로 나눌 수 있다.

* **로컬 캐시** : Java Application에 embedded하는 방식
* **원격 캐시** : Java Application에 외부의 독립 메모리 저장소를 별도로 구축하여 모든 인스턴스가 네트워크를 사용하여 데이터를 캐시하는 방식

</br>


Spring Caching은 [Configuration](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/spring-framework/Configuration.md)과 [AOP](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/spring-framework/AOP.md)를 활용해 구현할 수 있다. 

</br>

## 1️⃣ Spring Chacing 기본 

우선 Spring에서 cache사용을 위해 dependency를 추가해준다.

```gradle
implementation 'org.springframework.boot:spring-boot-starter-cache' // Spring 내부 캐시
implementation 'org.springframework.boot:spring-boot-starter-data-redis' // redis
```
</br>

기본적으로 Spring에서 @Cacheable과 같은 어노테이션 기반의 캐시 기능을 사용하기 위해서는 먼저 별도의 선언이 필요하다. 그래서 Config Class에 @EnableCaching을 선언해주어야 한다.
```java
@Configuration
@EnableCaching
public class CacheConfig {

  ...
}

```

</br>

그리고 캐시를 관리해줄 CacheManager를 빈으로 등록해야 하는데 아래가 CacheManager의 종류이다. 이외에도 [공식 문서](https://docs.spring.io/spring-boot/reference/io/caching.html)에서 다양항 CacheManager를 확인할 수 있다.

* ConcurrentMapCacheManager: Java의 ConcurrentHashMap을 사용해 구현한 캐시를 사용하는 CacheManager
* SimpleCacheManager: 기본적으로 제공하는 캐시가 없어 사용할 캐시를 직접 등록하여 사용하기 위한 CacheManager
* EhCacheCacheManager: 자바에서 유명한 캐시 프레임워크 중 하나인 EhCache를 지원하는 CacheManager
* CompositeCacheManager: 1개 이상의 캐시 매니저를 사용하도록 지원해주는 혼합 CacheManager
* CaffeineCacheManager: Java 8로 Guava 캐시를 재작성한 Caffeine 캐시를 사용하는 CacheManager
* JCacheCacheManager: JSR-107 기반의 캐시를 사용하는 CacheManager
* RedisCacheManager: Redis 기반 CacheManager

</br>


### @Cacheable
<mark>**캐시 저장소에 캐시 데이터를 저장하거나 조회하는 기능**</mark>

에노테이션이 정의된 메서드를 실행하면 데이터 저장소에 캐시 데이터 유무를 확인한다. 적용된 메서드의 리턴 값을 기준으로 캐시에 값을 저장한다.


</br>


### @CacheEvict

<mark>**캐시 데이터를 캐시에서 제거하는 목적으로 사용**</mark>

원본 데이터를 변경하거나 삭제하는 메서드에 해당 애노테이션을 적용하면 된다.

</br>


### @CachePut

<mark>**캐시를 생성하는 기능만 제공하는 어노테이션**</mark></br>

@Cachable과 유사하게 실행 결과를 캐시에 저장하지만, 조회 시에 저장된 캐시의 내용을 사용하지는 않고 항상 메소드의 로직을 실행



</br>


오늘은 ConcurrentMapCacheManager(로컬 캐시)와 RedisCacheManager(원격 캐시)로 Spring Caching을 구현하는 방법을 확인해보자!

</br>

## 2️⃣ ConcurrentMapCacheManager - local Cache

```java
@Configuration
@EnableCaching
public class CacheConfig {
    @Bean
    public CacheManager cacheManager(){
        return new ConcurrentMapCacheManager("localCacheInfo");
    }
    
}
```


</br>

## 3️⃣  Redis - Remote Cache 

```java 


```
</br>
