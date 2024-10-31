# Load Balancer

<mark>**load-balanced 세트에 정의된 Web Server 간에 수신 트래픽을 고르게 분산해주는 장치**</mark>

</br></br>


<p align="center">
<img src="https://github.com/user-attachments/assets/d70880a5-b64c-43a3-8489-e9037c08ecde" width="65%" height="65%"></p>
</p></br>


트래픽이 많아지면 하나의 서버가 감당하기 힘들어지기 때문에 여러 서버가 분산해서 트래픽을 감당해야 한다. 이를 가능하게 해주는 장치가 Load Balancer이다.
특히 대고객 서비스나 트래픽이 많이 발생하는 application에서는 load balacner는 필수적인 요소이다.

</br>

- 만약 Server #1이 오프라인이 되면 모든 트래픽이 Server #2로 라우팅된다. 이렇게 하면 웹사이트가 오프라인이 되는 것을 방지할 수 있다. 또한 load balancing을 위해 정상적인 새 Web Server를 Server pool 추가
- 급격한 트래픽이 증가하여 두 개의 서버가 감당하지 못할 때, 로드 밸런서는 Web Server pool에 새로운 서버를 추가하여 트래픽을 분산할 수 있다. (Scale-out)




</br>


## Load balancer의 주요 기능

-  <mark>**Health Check(상태 확인)** </mark> : Server들에 대한 주기적인 상태 확인을 통해 서버들의 장애 여부를 판단할 수 있다
-  <mark>**Tunneling**</mark>: 인터넷 상에서 눈에 보이지 않는 통로를 만들어 통신할 수 있게 하는 개념, 데이터를 캡슐화해서 연결된 상호 간에만 캡슐화된 패킷을 구별해 캡슐화를 해제할 수 있음 (Load Balancer <-> Web Server)
-  <mark>**NAT (Network Address Translation)** </mark> : IP 주소를 변환해 주는 기능, 내부 네트워크에서 사용하던 사설 IP 주소를 로드 밸런서 외부의 공인 IP 주소로 변경해 주며, 반대 과정도 가능
-  <mark>**DSR (Direct Server Routing)** </mark> : 로드 밸런서 사용 시 서버에서 클라이언트로 되돌아가는 경우, 목적지주소를 스위치의 IP 주소가 아닌 클라이언트의 IP 주소로 전달해서 네트워크 장비나 로드 밸런서를 거치지 않고 바로 클라이언트로 찾아가는 방식 (load balancer의 부하를 줄여줌)

</br>


## Load Balancer 알고리즘
- <mark>**라운드 로빈** </mark> : 서버에 들어온 요청을 순서대로 돌아가며 배정하는 방식, 서버와의 연결이 오래 지속하지 않을 경우 적합
- <mark>**가중 라운드 로빈** </mark> : 각 서버에 가중치를 매겨 높은 순으로 배정하는 방식
- <mark>**최소 연결 방식** </mark> : 요청이 들어온 시점에 가장 적은 연결 상태를 보이는 서버에 트래픽을 배정하는 방식
- <mark>**IP 해시 방식** </mark> : 클라이언트의 IP주소를 특정 서버로 매핑하여 요청을 처리하는 방식

</br>



## Load Balancer 종류
- <mark>**L2** </mark> : Mac 주소를 바탕으로 Load Balancing
- <mark>**L3** </mark> : IP 주소를 바탕으로 Load Balancing
- <mark>**L4** </mark> : Transport Layer에서 Load Balancing (IP와 Port)
- <mark>**L7** </mark> : Application Layer에서 Load Balancing (비용이 비쌈)


</br>
