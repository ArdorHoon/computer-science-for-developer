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


기본적으로 Spring에서 @Cacheable과 같은 어노테이션 기반의 캐시 기능을 사용하기 위해서는 먼저 별도의 선언이 필요하다. 그래서 Config Class에 @EnableCaching을 선언해주어야 한다.

</br>

```java
@Configuration
@EnableCaching
public class CacheConfig {

  ...
}

```

그리고 캐시를 관리해줄 CacheManager를 빈으로 등록해야 하는데 아래가 CacheManager의 종류이다. 이외에도 [공식 문서](https://docs.spring.io/spring-boot/reference/io/caching.html)에서 다양항 CacheManager를 확인할 수 있다.

* ConcurrentMapCacheManager: Java의ConcurrentHashMap을 사용해 구현한 캐시를 사용하는 캐시매니저
* SimpleCacheManager: 기본적으로 제공하는 캐시가 없어 사용할 캐시를 직접 등록하여 사용하기 위한 캐시매니저
* EhCacheCacheManager: 자바에서 유명한 캐시 프레임워크 중 하나인 EhCache를 지원하는 캐시 매니저
* CompositeCacheManager: 1개 이상의 캐시 매니저를 사용하도록 지원해주는 혼합 캐시 매니저
* CaffeineCacheManager: Java 8로 Guava 캐시를 재작성한 Caffeine 캐시를 사용하는 캐시 매니저
* JCacheCacheManager: JSR-107 기반의 캐시를 사용하는 캐시 매니저


오늘은 로컬 캐시와 원격 캐시 중 가장 유명한 Redis로 Spring Caching을 구현하는 방법을 확인해보자

</br>

## EhCache - local Cache


</br>

## Redis - Remote Cache 


</br>
