# TCP 
<mark>**전송 제어 프로토콜(Transmission Control Protocol)**, 인터넷 상에서 데이터를 메세지의 형태로 보내기 위해 IP와 함께 사용하는 프로토콜</mark></br>(이 두 프로토콜을 합쳐서 [TCP/IP](https://github.com/ArdorHoon/computer-science-for-developer/blob/main/network/TCP_IP.md)라고 함)


## TCP 특징
1. 연결형 서비스 : TCP Connection (3-way handshake), TCP Disconnection (4-way handshake)
2. 흐름 제어 : 데이터 처리 속도를 조절하여 수신자의 버퍼 오버플로우를 방지
3. 혼잡 제어 : 네트워크 내의 패킷 수가 넘치게 증가하지 않도록 방지 
4. 신뢰성이 높은 전송 
   - Dup Ack-based retransmission : 정상적인 상황에서 ACK 값을 연속적으로 전송, 만일 ACK 값이 중복으로 올 경우 패킷 이상 감지하여 재전송 요청 
   - Timeout-based retransmission : 일정 시간동안 ACK값을 수신받지 모한 경우 재전송 요청
6. 전이중(전송이 양방향으로 동시에 일어날 수 있음), 점대점(각 연결이 정확히 2개의 종단점을 가지고 있음)


</br>


# TCP의 3-Way Handshake
<mark>TCP 통신을 이용하여 데이터를 전송하기 위해 네트워크 연결을 설정(Connection Establish) 하는 과정</mark></br>
TCP/IP 프로토콜을 이용해서 통신을 하는 응용 프로그램이 데이터를 전송하기 전에 먼저 정확한 전송을 보장하기 위해 상대방과 사저에 세션을 수립하는 과정을 의미</br>

<p align="center">
<img src="https://github.com/user-attachments/assets/37ae3089-228c-408a-ba7e-a5d3cce1d6b2" width="60%" height="60%"></p></br>

1. 먼저 open()을 실행한 클라이언트가 SYN 보내고, SYN_SENT 상태로 대기
2. 서버는 SYN_RCVD 상태로 바꾸고 SYN과 응답 ACK를 보냄
3. SYN과 응답 ACK을 받은 클라이언트는 ESTABLISHED 상태로 변경하고 서버에게 응답 ACK를 전송
4. 응답 ACK를 받은 서버는 ESTABLISHED 상태로 변경
