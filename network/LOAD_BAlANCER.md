# Load Balancer

<mark>**load-balanced 세트에 정의된 Web Server 간에 수신 트래픽을 고르게 분산해주는 장치**</mark>

</br></br>


<p align="center">
<img src="https://github.com/user-attachments/assets/d70880a5-b64c-43a3-8489-e9037c08ecde" width="65%" height="65%"></p>
</p></br>


트래픽이 많아지면 하나의 서버가 감당하기 힘들어지기 때문에 여러 서버가 분산해서 트래픽을 감당해야 한다. (Sacle-out) 이를 가능하게 해주는 장치가 Load Balancer이다.
특히 대고객 서비스나 트래픽이 많이 발생하는 application에서는 load balacner는 필수적인 요소이다. 



</br>


## Load Balancer 알고리즘
- 라운드 로빈 : 서버에 들어온 요청을 순서대로 돌아가며 배정하는 방식, 서버와의 연결이 오래 지속하지 않을 경우 적합
- 가중 라운드 로빈 : 각 서버에 가중치를 매겨 높은 순으로 배정하는 방식
- 최소 연결 방식 : 요청이 들어온 시점에 가장 적은 연결 상태를 보이는 서버에 트래픽을 배정하는 방식
- IP 해시 방식 : 클라이언트의 IP주소를 특정 서버로 매핑하여 요청을 처리하는 방식

</br>



## Load Balancer 종류
- L2 : Mac 주소를 바탕으로 Load Balancing
- L3 : IP 주소를 바탕으로 Load Balancing
- L4 : Transport Layer에서 Load Balancing (IP와 Port)
- L7 : Application Layer에서 Load Balancing (비용이 비쌈)


</br>
