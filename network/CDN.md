
# CDN

<mark>**Content Delivery Network**의 약자인 CDN은 **지리적 제약 없이 전 세계 사용자에게 빠르고 안전하게 콘텐츠를 전송**할 수 있는 콘텐츠 전송 기술</mark></br>

</br>

CDN은 서버와 사용자 사이의 물리적인 거리를 줄여 콘텐츠 로딩에 소요되는 시간을 최소화한다. CDN은 각 지역에 캐시 서버(PoP, Points of presence)를 분산 배치해, 근접한 사용자의 요청에 원본 서버가 아닌 캐시 서버가 콘텐츠를 전달한다.
</br>

## CDN 사용 이유
인터넷을 통해 비즈니스를 운영하거나 웹 사이트에서 그래픽 이미지, 동영상 파일 등의 콘텐츠를 제공한다면 CDN 서비스를 이용할 필요가 있다.</br>

CDN은 동영상 스트리밍이나 온라인 게임, 대용량 파일 전송, 그리고 해상도가 높아 용량이 큰 이미지를 다루는 쇼핑몰, 포털 사이트 등에서 **안정적인 서비스 제공을 위해 활용**되고 있다.


</br>


## CDN 사용 이점

- **페이지 로드 시간 단축** 
- **대역폭 비용 절감**
- **콘텐츠 가용성 제고**
- **웹 사이트 보안 강화** (CDN 중간 서버 간에 로드를 분산하여 DDos 공격 영향을 줄일 수 있음) 


</br>

## CDN 동작 방식

1. 사용자가 콘텐츠 최초 요청 시, origin server로 부터 content를 가져와 사용자에게 전달하며 CDN 캐시장비 저장
2. 이후 요청 시, CDN에서 지정하는 해당 content 만료 시점까지 캐싱된 content 전송
3. 자주 사용하는 content에 한해 캐싱되며, 해당 content 호출이 없다면 주기적으로 삭제
4. Caching Server에서 Content를 찾지 못하면, 다른 서버에서 찾은 다음 사용자에게 전송
5. Content를 사용할 수 없거나 오래된 경우, CDN은 향후 요청에 대해 응답할 수 있도록 새로운 Content 저장 


</br>

## CDN에 Content 캐싱 방식

1. <mark>Static Caching </mark>: Origin Server 에 있는 Content를 운영자가 미리 Cache Server에 복사 해두어 사용자가 Cache Server에 Content 요청 시 무조건 Cache Server에 있음
2. <mark>Dynamic Caching</mark> : 사용자가 Content를 요청 시 해당 Content가 없는 경우, Origin Server로부터 다운로드 받아 전달. 있는 경우에는 캐싱된 Content전달(일정 시간 지난 후 캐시 삭제될 수 있음)
